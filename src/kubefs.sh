#!/bin/sh
# kubefs.sh

_kfs_printf_stderr() {
  if test "$#" -eq 0; then
    _kfs_printf_stderr '%s\n' "$(cat)"
  else
    printf -- "$@" >/dev/stderr
  fi
}

_kfm_iprintf() {
  if test -t 1 || test -n "${KUBEFS_DEBUG:-}"; then
    if test "$#" -eq 0; then
      cat | _kfs_printf_stderr
    else
      _kfs_printf_stderr "$@"
    fi
  fi
}

_kfs_debug() {
  if test -n "${KUBEFS_DEBUG:-}"; then
    if test "$#" -eq 0; then
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
  if test -n "${LOCK_KUBECONFIG:-}"; then
    _kfs_printf_stderr '# INFO: Can not execute authenticate while `LOCK_KUBECONFIG` is set.\n'
    return 0
  fi

  _kfs_dirname=$(_kfs_dirname "${1:-}")
  # try to find first occuring .kubeauth in the parent tree
  if \
  search_kubeauth=$(\
    _kfs_parents "$_kfs_dirname" \
    | xargs -I {} ls -1 {}/.kubeauth 2>/dev/null \
    | head -n1 \
  );
  test -n "$search_kubeauth"; then
    kubeauth="$search_kubeauth"
  else
    _kfs_printf_stderr "# WARNING: Could not find any \`.kubeauth\` in path or parents' paths\n"
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
  if test -f "$1/.kubeconfig"; then
    command cd -- "$1"
  else
    _kfs_printf_stderr '# INFO: no `.kubeconfig` found in directory `%s`.\n' "$1"
  fi
}

kubefs() {
  case ${1:-get} in
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
    printf 'KUBECONFIG="%s"\n' "$(kubefs get)"
  ;;
  la|lsa|list-all)
    kubefs list
    kubefs lock session list
    kubefs lock global list
  ;;
  auth|authenticate)
    _kfs_kubeauth "${2:-}"
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
      help|*)
        :
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
      help|*)
        :
      ;;
      esac
    ;;
    help|*)
      :
    ;;
    esac
  ;;
  help|*)
    :
  ;;
  esac
}

# ENTRYPOINT
## executed with arguments
## also works when sourced, but not supported
if test "${#:-0}" -gt 0; then
  kubefs "$@"
## executed as a subshell, prefixed to a pipe, etc.
elif ! test -t 1; then
  kubefs get
## sourced (without arguments)
## also works when executed, results in nothing though
else
  unset KUBECONFIG LOCK_KUBECONFIG
fi

# ALIASES

_kfs_which() {
  while test "$#" -gt 0; do
    command -v "$1" >/dev/null 2>&1 || return $?
    shift
  done
}

## install _complete_alias
# _kfs_install_complete_alias() {
#   # already sourced
#   _kfs_which _complete_alias && return 0
#   # already installed
#   test -f "$HOME/.local/share/bash-completion/helpers/complete_alias" && return 0

#   if _kfs_which 'wget'; then
#     wget -O "$HOME/.local/share/bash-completion/helpers/complete_alias" \
#       https://raw.githubusercontent.com/cykerway/complete-alias/refs/heads/master/complete_alias \
#     || return 1
#   elif  _kfs_which 'curl'; then
#     curl -fLo "$HOME/.local/share/bash-completion/helpers/complete_alias" \
#       https://raw.githubusercontent.com/cykerway/complete-alias/refs/heads/master/complete_alias \
#     || return 1
#   else
#     _kfs_printf_stderr '# ERROR: Could not install `complete_alias`, neither `wget` or `curl` found\n'
#     return 1
#   fi
# }

## create an alias, with bash completion
_kfs_alias() {
  alias $1="kubefs $2"

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
  
  # complete_alias not sourced
  # _kfs_which _complete_alias || return 0

  # # if _complete_alias is not sourced
  # if ! _kfs_which _complete_alias; then
  #   # if installed then source it
  #   if test -f "$HOME/.local/share/bash-completion/helpers/complete_alias"; then
  #     . "$HOME/.local/share/bash-completion/helpers/complete_alias" \
  #     || return 1
  #   fi
  # fi

  # _kfs_which _complete_alias && complete -F _complete_alias "$1" || :
  # complete -F _complete_alias "$1"
}

## required
alias kubectl='_kfs_kubectl'

## recommended
if test "${KUBEFS_RECOMMENDED_ALIAS:-true}" = 'true'; then
  alias kf='kubefs'
  _kfs_which _kubefs_completions && complete -F _kubefs_completions kf || :
fi

## optional
if test "${KUBEFS_OPTIONAL_ALIAS:-true}" = 'true'; then
  _kfs_alias kfg 'lock global toggle'
  _kfs_alias kfe 'lock session set'
  _kfs_alias kfl 'lock session toggle'
  _kfs_alias kfc 'cd'
  alias kfls='kubefs list-all'
  alias kfa='kubefs auth'

  # set KUBECONFIG for tool
  for tool in $(printf '%s\n' ${KUBEFS_TOOL:-helm} | tr ':' ' '); do
    command -v $tool >/dev/null 2>&1 \
    && alias $tool="KUBECONFIG=\$(kf) command $tool" || continue
  done
fi
