#!/bin/sh
# https://github.com/dxlr8r/kubefs

kubefs() {
case "${1:-get}" in

# kubefs functions
# ================

fn) shift
case "$1" in
kubefs-bash-complete)
cat << 'EOF'
# kubefs completion                                        -*- shell-script -*-

# This bash completions script was generated by
# completely (https://github.com/dannyben/completely)
# Modifying it manually is not recommended

_kubefs_completions_filter() {
  local words="$1"
  local cur=${COMP_WORDS[COMP_CWORD]}
  local result=()

  if [[ "${cur:0:1}" == "-" ]]; then
    echo "$words"

  else
    for word in $words; do
      [[ "${word:0:1}" != "-" ]] && result+=("$word")
    done

    echo "${result[*]}"

  fi
}

_kubefs_completions() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local compwords=("${COMP_WORDS[@]:1:$COMP_CWORD-1}")
  local compline="${compwords[*]}"

  case "$compline" in
    'lock session toggle'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "$(find "${KUBEFS_ROOT:-$HOME/.kube}" -type f -name '.kubeconfig' 2>/dev/null | LC_COLLATE=C.UTF-8 sort)")" -- "$cur")
      ;;

    'lock global toggle'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "$(find "${KUBEFS_ROOT:-$HOME/.kube}" -type f -name '.kubeconfig' 2>/dev/null | LC_COLLATE=C.UTF-8 sort)")" -- "$cur")
      ;;

    'lock session list'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "")" -- "$cur")
      ;;

    'lock global list'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "")" -- "$cur")
      ;;

    'lock session set'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "$(find "${KUBEFS_ROOT:-$HOME/.kube}" -type f -name '.kubeconfig' 2>/dev/null | LC_COLLATE=C.UTF-8 sort)")" -- "$cur")
      ;;

    'lock session del'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "")" -- "$cur")
      ;;

    'lock session get'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "")" -- "$cur")
      ;;

    'lock global set'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "$(find "${KUBEFS_ROOT:-$HOME/.kube}" -type f -name '.kubeconfig' 2>/dev/null | LC_COLLATE=C.UTF-8 sort)")" -- "$cur")
      ;;

    'lock global del'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "")" -- "$cur")
      ;;

    'lock global get'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "")" -- "$cur")
      ;;

    'lock session'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "set toggle del get list")" -- "$cur")
      ;;

    'lock global'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "set toggle del get list")" -- "$cur")
      ;;

    'list-all'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "")" -- "$cur")
      ;;

    'list'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "")" -- "$cur")
      ;;

    'find'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "kubeauth kubeconfig")" -- "$cur")
      ;;

    'auth'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "$(find "${KUBEFS_ROOT:-$HOME/.kube}" -type f -name '.kubeauth' 2>/dev/null | LC_COLLATE=C.UTF-8 sort)")" -- "$cur")
      ;;

    'lock'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "global session")" -- "$cur")
      ;;

    'get'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "")" -- "$cur")
      ;;

    'cd'*)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "$(find "${KUBEFS_ROOT:-$HOME/.kube}" -type f -name '.kubeconfig' -exec dirname {} \; 2>/dev/null | LC_COLLATE=C.UTF-8 sort)")" -- "$cur")
      ;;

    *)
      while read -r; do COMPREPLY+=("$REPLY"); done < <(compgen -W "$(_kubefs_completions_filter "get list list-all find cd auth lock")" -- "$cur")
      ;;

  esac
} &&
  complete -o nosort -F _kubefs_completions kubefs

# ex: filetype=sh

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

find-any-kubefile) shift; (
  if
    kubefile=$(kubefs fn find-kubefile "${1:-}" "${2:-}")
    test -n "$kubefile"
  then
    :
  elif test -n "${LOCK_KUBECONFIG:-}"; then
    kubefile="$LOCK_KUBECONFIG"
  elif test -n "${KUBECONFIG:-}"; then
    kubefile="$KUBECONFIG"
  else
    kubefile="$HOME/.kube/config"
  fi

  kubefs fn debug '# KUBECONFIG="%s"\n' "$kubefile"
  printf '%s\n' "$kubefile"
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
  cfg=$(kubefs fn find-kubefile "${1:-.}")
  test -n "$cfg" && export KUBECONFIG="$cfg" || :
  command kubectl "$@"
)
;;

cd) shift
  set -- "${1:-}" '.kubeconfig'
  # if no argument, set $1 to session or global lock (if set)
  if test -z "${1:-}"; then
    if
      test "${KUBEFS_CD_SESSION:-false}" = 'true' &&
      test -f "$(kubefs fn lock-session-get)"
    then
      set -- "$(dirname "$(kubefs fn lock-session-get)")" "$2"
    elif
      test "${KUBEFS_CD_SESSION:-false}" = 'true' &&
      test -f "$(kubefs fn lock-global-get)"
    then
      set -- "$(dirname "$(kubefs fn lock-global-get)")" "$2"
    elif
      test "${KUBEFS_CD_SESSION:-false}" = 'true' &&
      test -f "${KUBECONFIG:-}"
    then
      set -- "$(dirname "$KUBECONFIG")" "$(basename "$KUBECONFIG")"
    else
      :
    fi
  fi
  # if argument, cd if .kubeconfig found

  if test -f "$1/$2"; then
    command cd -- "$1"
  else
    kubefs fn printf-stderr '# INFO: no `.kubeconfig` found in directory'
    test -n "${1:-}" && kubefs fn printf-stderr ' `%s`' "$1" || :
    kubefs fn printf-stderr '.\n'
    return 1
  fi

  # lock session unless is already current lock
  if
    test "${KUBEFS_CD_SESSION_LOCK:-false}" = 'true' &&
    test "${LOCK_KUBECONFIG:-}" != "$1"/.kubeconfig &&
    test "$2" = '.kubeconfig'
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
  printf '%s\n' "$(kubefs fn find-any-kubefile)"
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
Manage multiple kubeconfigs with your filesystem

# Usage

kubefs  <command1> [command2] ... [commandN] [path]

# Available commands

get
  prints the current KUBECONFIG

cd [path]
  cd to a directory containing a .kubeconfig, and lock session. If no argument
  is given it will cd to the current KUBECONFIG.

list
  prints the current KUBECONFIG as an env variable

list-all
  shows shell, session and globally locked KUBECONFIG

auth [path]
  executes `.kubeauth` in path, if path not specified it will use current
  working directory

lock
  <global/session>
    <set> [path]
      locks KUBECONFIG to path
    <toggle>
      toggles lock
    <del>
      delete lock
    <get>
      prints the current lock if any
    <list>
      prints the current lock as an env variable

# Available arguments

path  a file or directory depending on the command. If a directory is given, and
      the command does not find .kubeconfig or .kubeauth, it will search for the
      first occurence of the file in the parent tree.

# Options

KUBEFS_CD_SESSION (default: `false`)
  when using `kubefs cd` without `path` as an argument, set path to the session
  lock's directory if set, if not attempt global lock's directory.

KUBEFS_CD_SESSION_LOCK (default: `false`)
  when using `kubefs cd` with `path` as an argument, do a
  `kubefs lock session set` towards that `path`.

KUBEFS_AUTH_SESSION_LOCK (default: `false`)
  when using `kubefs auth` with `path` as an argument, do a
  `kubefs lock session set` towards that `path`.

KUBEFS_AUTH_AUTO_CD (default: `false`)
  when using `kubefs auth` with `path` as an argument, cd to that path.

KUBEFS_RECOMMENDED_ALIAS (default: `true`)
  recommended aliases that makes short aliases of long commands. Only turn off
  if you know what you are doing.
    - `kf` -> `kubefs`
    - `kubefs` -> `kubefs`, set `KUBECONFIG` to `.kubeconfig`'s path

KUBEFS_OPTIONAL_ALIAS (default: `true`)
  recommended aliases that makes short aliases of long commands.
    - `kfg` `kubefs lock global toggle`
    - `kfe` `kubefs lock session set`
    - `kfl` `kubefs lock session toggle`
    - `kfc` `kubefs cd`
    - `kfa` `kubefs auth`
    - `kfls` `kubefs list-all`
    - for each tool in `KUBEFS_TOOL` set `KUBECONFIG` to `.kubeconfig`'s path 

KUBEFS_BASE_ADDONS (default: `true`)
  enable all base addons:
    - `kx` for listing and changing context
    - `kn` for listing and changing namespace
    - `kubefs init auth` creates a .kubeauth in current directory

KUBEFS_ROOT (default: `$HOME/.kube`)
  where to search for .kubeconfig and .kubeauth. Recommended to keep unchanged.

KUBEFS_TOOL (default: `tk:helm`)
  a list of tools, separated by `:`. See `KUBEFS_OPTIONAL_ALIAS`.

KUBEFS_COMPLETION (default: `true`)
  automatic sourcing of kubefs completion (bash shell). Defaults to false if
  bash is not the current shell.

KUBEFS_DEBUG (default: `false`)
  enable debugging

# Examples
## Options

`KUBEFS_CD_SESSION`, `KUBEFS_CD_SESSION_LOCK`, `KUBEFS_AUTH_SESSION_LOCK`: while
`false` by default, `true` is recommended for heavy shell users. Add to your
~/.profile:

```
KUBEFS_CD_SESSION=true
KUBEFS_CD_SESSION_LOCK=true
KUBEFS_AUTH_SESSION_LOCK=true
```

# About
## Precedent

`kubefs` will tell `kubectl` to use a config file in the follow order:

1. lock session (`LOCK_KUBECONFIG`)
2. `.kubeconfig` in current path or first occurence in the parent tree.
3. lock global (`~/kube/config`)

# Notes
## KUBECONFIG

When using/sourcing `kubefs` with `KUBEFS_RECOMMENDED_ALIAS=true` (default) you
can no longer specify `KUBECONFIG`, use `kubectl --kubeconfig` instead, or
disable `KUBEFS_RECOMMENDED_ALIAS=false` and `unalias kubectl` in open shells.

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


