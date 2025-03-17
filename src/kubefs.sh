#!/bin/sh

# KUBEFS
# ======

_kfs_printf_stderr() {
  if test $# -eq 0; then
    _kfs_printf_stderr '%s\n' "$(cat)"
  else
    printf -- "$@" >/dev/stderr
  fi
}

_kfm_iprintf() {
  if case "${-:-}" in *i*) true;; *) false;; esac || test "${KUBEFS_DEBUG:-false}" = 'true'; then
    if test $# -eq 0; then
      cat | _kfs_printf_stderr
    else
      _kfs_printf_stderr "$@"
    fi
  fi
}



_kfs_debug() {
  if test "${KUBEFS_DEBUG:-false}" = 'true'; then
    if test $# -eq 0; then
      cat | _kfs_printf_stderr
    else
      _kfs_printf_stderr "$@"
    fi
  fi
}

_kfs_parents() (
  dirname="${1:-$(pwd)}"
  if test "$dirname" != '/'; then
    printf '%s\n' "$dirname"
    _kfs_parents "$(dirname "$dirname")"
  else
    printf '/\n'
    return 0
  fi
)

_kfs_dirname() (
  if test -d "${1:-}"; then
    printf '%s\n' "$1"
  elif test -e "${1:-}"; then
    dirname "$1"
  else
    :
  fi
)

_kfs_resolve_symlink() {
  awk \
  -v LINK="$1" \
  -v LIST="$(LC_ALL=C command ls -l "$1")" \
  'BEGIN {
    LINK_LEN=length(LINK)
    LINK_POS=index(LIST, LINK);
    print substr(LIST, LINK_POS+LINK_LEN+4)
  }'
}

_kfs_find_kubeconfig() (
  if test -n "${LOCK_KUBECONFIG:-}"; then
    candidate="$LOCK_KUBECONFIG"
  else
    # find first occurence of .kubeconfig in the parent tree
    candidate=$(\
      _kfs_parents "${1:-}" \
      | xargs -I {} ls -1 {}/.kubeconfig 2>/dev/null \
      | head -n1 \
    )
  fi
  kubeconfig=${candidate:-$HOME/.kube/config}
  printf '%s\n' "$kubeconfig"
  _kfs_debug '# KUBECONFIG="%s"\n' "$kubeconfig"
)

_kfs_lock_session_set() {
  _kfs_dirname=$(_kfs_dirname "${1:-}")
  export LOCK_KUBECONFIG=$(_kfs_find_kubeconfig "$_kfs_dirname")
  export KUBECONFIG="$LOCK_KUBECONFIG"
  _kfm_iprintf '# LOCK_KUBECONFIG="%s"\n' "$LOCK_KUBECONFIG"
}
_kfs_lock_session_del() {
  test "${KUBECONFIG:-}" = "${LOCK_KUBECONFIG:-}" && unset KUBECONFIG || :
  unset LOCK_KUBECONFIG
  _kfm_iprintf '# unset LOCK_KUBECONFIG\n'
}
_kfs_lock_session_toggle() {
  if test -z "${1:-}" -a -n "$LOCK_KUBECONFIG"; then
    _kfs_lock_session_del
  else
    _kfs_lock_session_set "${1:-}"
  fi
}
_kfs_lock_session_get() (
  if test -n "$LOCK_KUBECONFIG"; then
    test "${1:-}" = "list" \
    && printf 'LOCK_KUBECONFIG="%s"\n' "$(_kfs_lock_session_get)" \
    || printf '%s\n' "$LOCK_KUBECONFIG"
  fi
)

_kfs_lock_global_set() (
  _kfs_dirname=$(_kfs_dirname "${1:-}")
  kubeconfig=$(_kfs_find_kubeconfig "$_kfs_dirname")
  if test "$kubeconfig" = "$HOME/.kube/config"; then
    _kfs_printf_stderr '# INFO: no `.kubeconfig` found in directory `%s`.\n' "$(pwd)"
    return 1
  else
    test -L "$HOME/.kube/config" && unlink "$HOME/.kube/config" || :
    if ! test -e "$HOME/.kube/config"; then
      ln -s "$kubeconfig" "$HOME/.kube/config"
      _kfm_iprintf '# ln -s "%s" "%s"\n' "$kubeconfig" "$HOME/.kube/config"
    else
      _kfs_printf_stderr '# ERROR: `%s` not a symlink.\n' "$HOME/.kube/config"
    fi
  fi
)
_kfs_lock_global_del() (
  if unlink "$HOME/.kube/config" 2>/dev/null; then
    _kfm_iprintf '# unlink "%s"\n' "$HOME/.kube/config"
  else
    _kfs_printf_stderr '# WARNING: `%s` not a symlink.\n' "$HOME/.kube/config"
  fi
)
_kfs_lock_global_toggle() (
  if test -z "${1:-}" -a -L "$HOME/.kube/config"; then
    _kfs_lock_global_del
  else
    _kfs_lock_global_set "${1:-}"
  fi
)
_kfs_lock_global_get() (
  if test -L "$HOME/.kube/config"; then
    test "${1:-}" = "list" && printf '%s -> ' "$HOME/.kube/config" || :
    printf '%s\n' "$(_kfs_resolve_symlink "$HOME/.kube/config")"
  fi
)

_kfs_kubeauth() (
  if test -z "$1" -a -n "${LOCK_KUBECONFIG:-}"; then
    _kfs_printf_stderr '# INFO: `LOCK_KUBECONFIG` is set, attempting to deduct `.kubeauth`.\n'
    set -- "$LOCK_KUBECONFIG"
  fi

  _kfs_dirname=$(_kfs_dirname "${1:-}")
  # try to find first occuring .kubeauth in the parent tree
  if
    search_kubeauth=$(\
      _kfs_parents "$_kfs_dirname" \
      | xargs -I {} ls -1 {}/.kubeauth 2>/dev/null \
      | head -n1 \
    )
    test -n "$search_kubeauth"
  then
    kubeauth="$search_kubeauth"
  else
    _kfs_printf_stderr "# WARNING: Could not find any \`.kubeauth\` in path or parents' paths.\n"
    return 1
  fi
  test -x "$kubeauth" || chmod +x "$kubeauth"
  _kfs_debug '# kubeauth="%s"\n' "$kubeauth"
  export KUBECONFIG=$(_kfs_find_kubeconfig "$_kfs_dirname")
  "$kubeauth"
)

_kfs_kubectl() (
  export KUBECONFIG=$(_kfs_find_kubeconfig)
  command kubectl "$@"
)

_kfs_cd() {
  # if no argument, set $1 to session or global lock (if set)
  if test -z "${1:-}"; then
    if
      test "${KUBEFS_CD_SESSION:-false}" = 'true' &&
      test -f "$(_kfs_lock_session_get)"
    then
      set -- "$(dirname "$(_kfs_lock_session_get)")"
    elif
      test "${KUBEFS_CD_SESSION:-false}" = 'true' &&
      test -f "$(_kfs_lock_global_get)"
    then
      set -- "$(dirname "$(_kfs_lock_global_get)")"
    else
      _kfs_cmd get
      return 0
    fi
  fi
  # if argument, cd if .kubeconfig found

  if test -f "$1/.kubeconfig"; then
    command cd -- "$1"
  else
    _kfs_printf_stderr '# INFO: no `.kubeconfig` found in directory `%s`.\n' "$1"
    return 0
  fi

  # lock session unless is already current lock
  if
    test "${KUBEFS_CD_SESSION_LOCK:-false}" = 'true' &&
    test "${LOCK_KUBECONFIG:-}" != "${1:-}"
  then
    _kfs_lock_session_set "${1:-}"
  fi
}

_kfs_cmd() {
  case ${1:-} in
  ctl|kubectl)
    shift
    _kfs_kubectl "$@"
  ;;
  g|get)
    printf '%s\n' "$(_kfs_find_kubeconfig)"
  ;;
  cd|jump)
    shift
    _kfs_cd "${1:-}"
  ;;
  ls|list)
    printf 'KUBECONFIG="%s"\n' "$(_kfs_cmd get)"
  ;;
  la|lsa|list-all)
    _kfs_cmd list
    _kfs_cmd lock session list
    _kfs_cmd lock global list
  ;;
  auth|authenticate)
    _kfs_kubeauth "${2:-}"
    if
      test "${KUBEFS_AUTH_AUTO_CD:-false}" = 'true' &&
      test -n "${2:-}"
    then
      _kfs_cd "$(dirname "${2:-}")"
    fi
  ;;
  lock)
    case ${2:-session} in
    global)
      case ${3:-set} in
      del|delete|rm|remove|unset)
        _kfs_lock_global_del
      ;;
      toggle)
        _kfs_lock_global_toggle "${4:-}"
      ;;
      g|get)
        _kfs_lock_global_get get
      ;;
      ls|list)
        _kfs_lock_global_get list
      ;;
      set|add|mk)
        _kfs_lock_global_set "${4:-}"
      ;;
      esac
    ;;
    
    session)
      case ${3:-set} in
      del|delete|rm|remove|unset)
        _kfs_lock_session_del
      ;;
      toggle)
        _kfs_lock_session_toggle "${4:-}"
      ;;
      g|get)
        _kfs_lock_session_get get
      ;;
      ls|list)
        _kfs_lock_session_get list
      ;;
      set|add|mk)
        _kfs_lock_session_set "${4:-}"
      ;;
      esac
    ;;
    esac
  ;;
  help|*)
    printf '%s\n' "$_KFS_HELP"
  ;;
  esac
}

# KUBEFS INTERACTIVE
# ==================

_kfs_which() {
  while test $# -gt 0; do
    command -v "$1" >/dev/null 2>&1 || return $?
    shift
  done
}

## create an alias, with bash completion
_kfs_alias() {
  alias $1="_kfs_cmd $2"

  # kubefs completion not sourced
  _kfs_which _kubefs_completions || return 0
  
  eval "$(printf "
  _kubefs_completions_$1() {
    local compl
    compl=\${COMP_WORDS[@]:1}
    (( COMP_CWORD += 2 ))
    COMP_WORDS=( kubectl '$2' \"\${compl:- }\" )
    _kubefs_completions
  }
  complete -o default -F _kubefs_completions_$1 $1
  ")"
}

_kfs_init_sourced() {
  # required
  alias kubefs='_kfs_cmd'
}

_kfs_init_interactive() {
  # do not inherit from muxer etc.
  unset KUBECONFIG LOCK_KUBECONFIG

  # enable bash completion for kubefs
  if
    test "${KUBEFS_COMPLETION:-true}" = 'true' &&
    _kfs_which _get_comp_words_by_ref
  then
    _kfs_bash_complete
  fi

  # recommended
  if test "${KUBEFS_RECOMMENDED_ALIAS:-true}" = 'true'; then
    alias kubectl='_kfs_kubectl'
    alias kf='_kfs_cmd'
    _kfs_which _kubefs_completions && complete -F _kubefs_completions kf || :
  fi

  # optional
  if test "${KUBEFS_OPTIONAL_ALIAS:-true}" = 'true'; then
    _kfs_alias kfg 'lock global toggle'
    _kfs_alias kfe 'lock session set'
    _kfs_alias kfl 'lock session toggle'
    _kfs_alias kfc 'cd'
    _kfs_alias kfa 'auth'
    alias kfls='_kfs_cmd list-all'


    # set KUBECONFIG for tool
    for tool in $(printf '%s\n' ${KUBEFS_TOOL:-tk:helm} | tr ':' ' '); do
      command -v $tool >/dev/null 2>&1 \
      && alias $tool="KUBECONFIG=\$(kf) command $tool" || continue
    done
  fi
}

# KUBEFS ENTRYPOINT
# =================

# executed
if test "$(basename -- "$0" '.sh')" = 'kubefs'; then
  _kfs_cmd "$@"
  printf -- '---
  WARNING: executing `kubefs` as an executable is not recommended.\n
  Only the following commands fill work in this mode:\n
  - ctl
  - get
  - ls
  - lsa, except session
  - auth
  - lock global\n
  The recommended way is to source it, that be in your shell or script.
  ---\n' \
  | sed -E 's#^\s{2}##' | _kfs_printf_stderr
else
  _kfs_init_sourced
  ## interactive, not subshelled, without arguments
  if
    case "${-:-}" in *i*) true;; *) false;; esac &&
    test -t 1 &&
    test "${#:-0}" -eq 0
  then
    _kfs_init_interactive
  fi
fi
