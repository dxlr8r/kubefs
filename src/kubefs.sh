#!/bin/sh

kubefs() {
case "${1:-get}" in

# kubefs functions
# ================

fn) shift
case "$1" in
kubefs-bash-complete)
cat << 'EOF'
_KUBEFS_BASH_COMPLETE_PLACEHOLDER_
EOF
;;
printf-stderr) shift
  if test $# -eq 0; then
    kubefs fn printf-stderr '%s\n' "$(cat)"
  else
    printf -- "$@" >/dev/stderr
  fi
;;

iprintf) shift
  if case "${-:-}" in *i*) true;; *) false;; esac || test "${KUBEFS_DEBUG:-false}" = 'true'; then
    if test $# -eq 0; then
      cat | kubefs fn printf-stderr
    else
      kubefs fn printf-stderr "$@"
    fi
  fi
;;

debug) shift
  if test "${KUBEFS_DEBUG:-false}" = 'true'; then
    if test $# -eq 0; then
      cat | kubefs fn printf-stderr
    else
      kubefs fn printf-stderr "$@"
    fi
  fi
;;

descendants) shift; (
  test -n "${1:-}" || return 1
  if test "$1" != '/'; then
    printf '%s\n' "$1"
    kubefs fn descendants "$(dirname "$1")"
  else
    printf '/\n'
    return 0
  fi
)
;;

dirname) shift; (
  if test -d "${1:-}"; then
    # printf '%s\n' "$1"
    cd "$1"; pwd
  elif test -e "${1:-}"; then
    cd "$(dirname "$1")"; pwd
  else
    :
  fi
)
;;

resolve-symlink) shift
  awk \
  -v LINK="$1" \
  -v LIST="$(LC_ALL=C command ls -l "$1")" \
  'BEGIN {
    LINK_LEN=length(LINK)
    LINK_POS=index(LIST, LINK);
    print substr(LIST, LINK_POS+LINK_LEN+4)
  }'
;;

find-kubefile) shift; (
  set -- "$(kubefs fn dirname "${1:-}")" "${2:-.kubeconfig}"
  # find first occurence of .kubeconfig in the parent tree
  kubefile=$(\
    kubefs fn descendants "$1" \
    | xargs -I {} ls -1 {}/$2 2>/dev/null \
    | head -n1 \
  )
  kubefs fn debug '# KUBEFILE="%s"\n' "$kubefile"
  test -z "$kubefile" || printf '%s\n' "$kubefile"
)
;;

find-any-kubeconfig) shift; (
  if
    kubeconfig=$(kubefs fn find-kubefile "${1:-}")
    test -n "$kubeconfig"
  then
    :
  elif test -n "${LOCK_KUBECONFIG:-}"; then
    kubeconfig="$LOCK_KUBECONFIG"
  else
    kubeconfig="$HOME/.kube/config"
  fi

  kubefs fn debug '# KUBECONFIG="%s"\n' "$kubeconfig"
  printf '%s\n' "$kubeconfig"
)
;;

lock-session-set) shift
  set -- "$(kubefs fn find-kubefile "${1:-.}")"
  if test -z "${1:-}"; then
    kubefs fn printf-stderr '# INFO: no `.kubeconfig` found in directory `%s`.\n' "$(pwd)"
    return 1
  else
    export LOCK_KUBECONFIG=$1
    export KUBECONFIG=$LOCK_KUBECONFIG
    kubefs fn iprintf '# LOCK_KUBECONFIG="%s"\n' "$LOCK_KUBECONFIG"
  fi
;;
lock-session-del) shift
  test "${KUBECONFIG:-}" = "${LOCK_KUBECONFIG:-}" && unset KUBECONFIG || :
  unset LOCK_KUBECONFIG
  kubefs fn iprintf '# unset LOCK_KUBECONFIG\n'
;;
lock-session-toggle) shift
  if test -z "${1:-}" -a -n "$LOCK_KUBECONFIG"; then
    kubefs fn lock-session-del
  else
    kubefs fn lock-session-set "${1:-}"
  fi
;;
lock-session-get) shift; (
  if test -n "$LOCK_KUBECONFIG"; then
    test "${1:-}" = "list" \
    && printf 'LOCK_KUBECONFIG="%s"\n' "$(kubefs fn lock-session-get)" \
    || printf '%s\n' "$LOCK_KUBECONFIG"
  fi
)
;;

lock-global-set) shift; (
  set -- "$(kubefs fn find-kubefile "${1:-.}")"
  if test -z "${1:-}"; then
    kubefs fn printf-stderr '# INFO: no `.kubeconfig` found in directory `%s`.\n' "$(pwd)"
    return 1
  else
    test -L "$HOME/.kube/config" && unlink "$HOME/.kube/config" || :
    if ! test -e "$HOME/.kube/config"; then
      ln -s "$1" "$HOME/.kube/config"
      kubefs fn iprintf '# ln -s "%s" "%s"\n' "$1" "$HOME/.kube/config"
    else
      kubefs fn printf-stderr '# ERROR: `%s` not a symlink.\n' "$HOME/.kube/config"
    fi
  fi
)
;;
lock-global-del) shift; (
  if unlink "$HOME/.kube/config" 2>/dev/null; then
    kubefs fn iprintf '# unlink "%s"\n' "$HOME/.kube/config"
  else
    kubefs fn printf-stderr '# WARNING: `%s` not a symlink.\n' "$HOME/.kube/config"
  fi
)
;;
lock-global-toggle) shift; (
  if test -z "${1:-}" -a -L "$HOME/.kube/config"; then
    kubefs fn lock-global-del
  else
    kubefs fn lock-global-set "${1:-}"
  fi
)
;;
lock-global-get) shift; (
  if test -L "$HOME/.kube/config"; then
    test "${1:-}" = "list" && printf '%s -> ' "$HOME/.kube/config" || :
    printf '%s\n' "$(kubefs fn resolve-symlink "$HOME/.kube/config")"
  fi
)
;;

kubeauth) shift
  if test -z "${1:-}" -a -n "${LOCK_KUBECONFIG:-}"; then
    kubefs fn printf-stderr '# INFO: `LOCK_KUBECONFIG` is set, attempting to deduct `.kubeauth`.\n'
    set -- "$(kubefs fn find-kubefile "$LOCK_KUBECONFIG" '.kubeauth')" _
  else
    set -- "$(kubefs fn find-kubefile "${1:-.}" '.kubeauth')"
  fi

  if test -z "$1"; then
    kubefs fn printf-stderr "# WARNING: Could not find any \`.kubeauth\` in path or descendants' paths.\n"
    return 1
  fi

  test -x "$1" || chmod +x "$1"
  kubefs fn debug '# kubeauth="%s"\n' "$1"
  "$1"

  # lock session unless is already current lock
  if
    test "${KUBEFS_AUTH_SESSION_LOCK:-false}" = 'true' &&
    test "${LOCK_KUBECONFIG:-}" != "$1"/.kubeconfig
  then
    kubefs fn lock-session-set "$1"
  fi

  if
    test "${KUBEFS_AUTH_AUTO_CD:-false}" = 'true' &&
    test -n "${2:-}"
  then
    kubefs fn cd "$(dirname "${1:-}")"
  fi

  # allow for .kubeauth and .kubeconfig to not be in the same directory, besides KUBEFS_CD_SESSION_LOCK does the same
  # test -z "${2:-}" || kubefs fn lock-session-set "$1"
;;

kubectl) shift; (
  export KUBECONFIG=$(kubefs fn find-any-kubeconfig)
  command kubectl "$@"
)
;;

cd) shift
  # if no argument, set $1 to session or global lock (if set)
  if test -z "${1:-}"; then
    if
      test "${KUBEFS_CD_SESSION:-false}" = 'true' &&
      test -f "$(kubefs fn lock-session-get)"
    then
      set -- "$(dirname "$(kubefs fn lock-session-get)")"
    elif
      test "${KUBEFS_CD_SESSION:-false}" = 'true' &&
      test -f "$(kubefs fn lock-global-get)"
    then
      set -- "$(dirname "$(kubefs fn lock-global-get)")"
    else
      kubefs get
      return 0
    fi
  fi
  # if argument, cd if .kubeconfig found

  if test -f "$1/.kubeconfig"; then
    command cd -- "$1"
  else
    kubefs fn printf-stderr '# INFO: no `.kubeconfig` found in directory `%s`.\n' "$1"
    return 0
  fi

  # lock session unless is already current lock
  if
    test "${KUBEFS_CD_SESSION_LOCK:-false}" = 'true' &&
    test "${LOCK_KUBECONFIG:-}" != "$1"/.kubeconfig
  then
    kubefs fn lock-session-set "$1"
  fi
;;

# kubefs interactive functions
# ============================

which) shift
  while test $# -gt 0; do
    command -v "$1" >/dev/null 2>&1 || return $?
    shift
  done
;;

## create an alias, with bash completion
gen-alias) shift
  alias $1="kubefs $2"

  # kubefs completion not sourced
  kubefs fn which _kubefs_completions || return 0

  eval "$(printf "
  _kubefs_completions_$1() {
    local compl
    compl=\${COMP_WORDS[@]:1}
    (( COMP_CWORD += 2 ))
    COMP_WORDS=( kubectl '$2' \"\${compl:- }\" )
    _kubefs_completions
  }
  complete -o nosort -F _kubefs_completions_$1 $1
  ")"
;;

init-sourced) shift
  # required
  :
;;

init-interactive) shift
  # do not inherit from muxer etc.
  unset KUBECONFIG LOCK_KUBECONFIG

  # enable bash completion for kubefs
  if
    test "${KUBEFS_COMPLETION:-true}" = 'true' &&
    kubefs fn which _get_comp_words_by_ref
  then
    eval "$(kubefs fn kubefs-bash-complete)"
  fi

  # recommended
  if test "${KUBEFS_RECOMMENDED_ALIAS:-true}" = 'true'; then
    alias kubectl='kubefs fn kubectl'
    alias kf='kubefs'
    kubefs fn which _kubefs_completions && complete -o nosort -F _kubefs_completions kf || :
  fi

  # optional
  if test "${KUBEFS_OPTIONAL_ALIAS:-true}" = 'true'; then
    kubefs fn gen-alias kfg 'lock global toggle'
    kubefs fn gen-alias kfe 'lock session set'
    kubefs fn gen-alias kfl 'lock session toggle'
    kubefs fn gen-alias kfc 'cd'
    kubefs fn gen-alias kfa 'auth'
    kubefs fn gen-alias kff 'find'
    alias kfls='kubefs list-all'


    # set KUBECONFIG for tool
    for tool in $(printf '%s\n' ${KUBEFS_TOOL:-tk:helm} | tr ':' ' '); do
      command -v $tool >/dev/null 2>&1 \
      && alias $tool="KUBECONFIG=\$(kf) command $tool" || continue
    done
  fi
;;

esac
;;

## commands

ctl|kubectl)
  shift
  kubefs fn kubectl "$@"
;;
g|get)
  printf '%s\n' "$(kubefs fn find-any-kubeconfig)"
;;
cd|jump) shift
  kubefs fn cd "${1:-}"
;;
ls|list)
  printf 'KUBECONFIG="%s"\n' "$(kubefs get)"
;;
la|lsa|list-all)
  kubefs list
  kubefs lock session list
  kubefs lock global list
;;
find) shift
  case ${1:-kubeconfig} in
    kubeauth)
      find "${KUBEFS_ROOT:-$HOME/.kube}" -type f -name '.kubeauth' 2>/dev/null | LC_COLLATE=C.UTF-8 sort
    ;;
    kubeconfig)
      find "${KUBEFS_ROOT:-$HOME/.kube}" -type f -name '.kubeconfig' 2>/dev/null | LC_COLLATE=C.UTF-8 sort
    ;;
  esac
;;
auth|authenticate) shift
  kubefs fn kubeauth "${1:-}"
;;
lock)
  case ${2:-session} in
  global)
    case ${3:-set} in
    del|delete|rm|remove|unset)
      kubefs fn lock-global-del
    ;;
    toggle)
      kubefs fn lock-global-toggle "${4:-}"
    ;;
    g|get)
      kubefs fn lock-global-get get
    ;;
    ls|list)
      kubefs fn lock-global-get list
    ;;
    set|add|mk)
      kubefs fn lock-global-set "${4:-}"
    ;;
    esac
  ;;

  session)
    case ${3:-set} in
    del|delete|rm|remove|unset)
      kubefs fn lock-session-del
    ;;
    toggle)
      kubefs fn lock-session-toggle "${4:-}"
    ;;
    g|get)
      kubefs fn lock-session-get get
    ;;
    ls|list)
      kubefs fn lock-session-get list
    ;;
    set|add|mk)
      kubefs fn lock-session-set "${4:-}"
    ;;
    esac
  ;;
  esac
;;
update|upgrade)
  curl -LSq --no-progress-meter --fail-with-body \
    https://raw.githubusercontent.com/dxlr8r/kubefs/master/install.sh | sh -
;;
?*)
  command -V "_kubefs_addon_$1" >/dev/null 2>&1 &&
    eval "_kubefs_addon_$1" \"\$\@\" ||
    kubefs fn printf-stderr 'argument `%s` not supported\n' "$1"
;;
help|*)
cat << 'EOF'
_HELP_PLACEHOLDER_
EOF
;;
esac
}

# KUBEFS ENTRYPOINT
# =================

# executed
if test "$(basename -- "$0" '.sh')" = 'kubefs'; then
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
  | sed -E 's#^\s{2}##' | kubefs fn printf-stderr
  kubefs "$@"
else
  kubefs fn init-sourced
  ## interactive, not subshelled, without arguments
  if
    case "${-:-}" in *i*) true;; *) false;; esac &&
    test -t 1 &&
    test "${#:-0}" -eq 0
  then
    kubefs fn init-interactive
  fi
fi
