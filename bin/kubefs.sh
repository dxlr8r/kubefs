#!/bin/sh
# https://github.com/dxlr8r/kubefs
_kfs_bash_complete() {
eval "$(printf '%s\n' X2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIoKSB7CmxvY2FsIHdvcmRzPSIkMSIKbG9jYWwgY3VyPSR7Q09NUF9XT1JEU1tDT01QX0NXT1JEXX0KbG9jYWwgcmVzdWx0PSgpCmlmIFtbICIke2N1cjowOjF9IiA9PSAiLSIgXV07IHRoZW4KZWNobyAiJHdvcmRzIgplbHNlCmZvciB3b3JkIGluICR3b3JkczsgZG8KW1sgIiR7d29yZDowOjF9IiAhPSAiLSIgXV0gJiYgcmVzdWx0Kz0oIiR3b3JkIikKZG9uZQplY2hvICIke3Jlc3VsdFsqXX0iCmZpCn0KX2t1YmVmc19jb21wbGV0aW9ucygpIHsKbG9jYWwgY3VyPSR7Q09NUF9XT1JEU1tDT01QX0NXT1JEXX0KbG9jYWwgY29tcHdvcmRzPSgiJHtDT01QX1dPUkRTW0BdOjE6JENPTVBfQ1dPUkQtMX0iKQpsb2NhbCBjb21wbGluZT0iJHtjb21wd29yZHNbKl19IgpjYXNlICIkY29tcGxpbmUiIGluCidsb2NrIHNlc3Npb24gdG9nZ2xlJyopCndoaWxlIHJlYWQgLXI7IGRvIENPTVBSRVBMWSs9KCIkUkVQTFkiKTsgZG9uZSA8IDwoY29tcGdlbiAtVyAiJChfa3ViZWZzX2NvbXBsZXRpb25zX2ZpbHRlciAiJChmaW5kICIke0tVQkVGU19ST09UOi0kSE9NRS8ua3ViZX0iIC10eXBlIGYgLW5hbWUgJy5rdWJlY29uZmlnJyAyPi9kZXYvbnVsbCB8IExDX0NPTExBVEU9Qy5VVEYtOCBzb3J0KSIpIiAtLSAiJGN1ciIpCjs7Cidsb2NrIGdsb2JhbCB0b2dnbGUnKikKd2hpbGUgcmVhZCAtcjsgZG8gQ09NUFJFUExZKz0oIiRSRVBMWSIpOyBkb25lIDwgPChjb21wZ2VuIC1XICIkKF9rdWJlZnNfY29tcGxldGlvbnNfZmlsdGVyICIkKGZpbmQgIiR7S1VCRUZTX1JPT1Q6LSRIT01FLy5rdWJlfSIgLXR5cGUgZiAtbmFtZSAnLmt1YmVjb25maWcnIDI+L2Rldi9udWxsIHwgTENfQ09MTEFURT1DLlVURi04IHNvcnQpIikiIC0tICIkY3VyIikKOzsKJ2xvY2sgc2Vzc2lvbiBsaXN0JyopCndoaWxlIHJlYWQgLXI7IGRvIENPTVBSRVBMWSs9KCIkUkVQTFkiKTsgZG9uZSA8IDwoY29tcGdlbiAtVyAiJChfa3ViZWZzX2NvbXBsZXRpb25zX2ZpbHRlciAiIikiIC0tICIkY3VyIikKOzsKJ2xvY2sgZ2xvYmFsIGxpc3QnKikKd2hpbGUgcmVhZCAtcjsgZG8gQ09NUFJFUExZKz0oIiRSRVBMWSIpOyBkb25lIDwgPChjb21wZ2VuIC1XICIkKF9rdWJlZnNfY29tcGxldGlvbnNfZmlsdGVyICIiKSIgLS0gIiRjdXIiKQo7OwonbG9jayBzZXNzaW9uIHNldCcqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgIiQoZmluZCAiJHtLVUJFRlNfUk9PVDotJEhPTUUvLmt1YmV9IiAtdHlwZSBmIC1uYW1lICcua3ViZWNvbmZpZycgMj4vZGV2L251bGwgfCBMQ19DT0xMQVRFPUMuVVRGLTggc29ydCkiKSIgLS0gIiRjdXIiKQo7OwonbG9jayBzZXNzaW9uIGRlbCcqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgIiIpIiAtLSAiJGN1ciIpCjs7Cidsb2NrIHNlc3Npb24gZ2V0JyopCndoaWxlIHJlYWQgLXI7IGRvIENPTVBSRVBMWSs9KCIkUkVQTFkiKTsgZG9uZSA8IDwoY29tcGdlbiAtVyAiJChfa3ViZWZzX2NvbXBsZXRpb25zX2ZpbHRlciAiIikiIC0tICIkY3VyIikKOzsKJ2xvY2sgZ2xvYmFsIHNldCcqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgIiQoZmluZCAiJHtLVUJFRlNfUk9PVDotJEhPTUUvLmt1YmV9IiAtdHlwZSBmIC1uYW1lICcua3ViZWNvbmZpZycgMj4vZGV2L251bGwgfCBMQ19DT0xMQVRFPUMuVVRGLTggc29ydCkiKSIgLS0gIiRjdXIiKQo7OwonbG9jayBnbG9iYWwgZGVsJyopCndoaWxlIHJlYWQgLXI7IGRvIENPTVBSRVBMWSs9KCIkUkVQTFkiKTsgZG9uZSA8IDwoY29tcGdlbiAtVyAiJChfa3ViZWZzX2NvbXBsZXRpb25zX2ZpbHRlciAiIikiIC0tICIkY3VyIikKOzsKJ2xvY2sgZ2xvYmFsIGdldCcqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgIiIpIiAtLSAiJGN1ciIpCjs7Cidsb2NrIHNlc3Npb24nKikKd2hpbGUgcmVhZCAtcjsgZG8gQ09NUFJFUExZKz0oIiRSRVBMWSIpOyBkb25lIDwgPChjb21wZ2VuIC1XICIkKF9rdWJlZnNfY29tcGxldGlvbnNfZmlsdGVyICJzZXQgdG9nZ2xlIGRlbCBnZXQgbGlzdCIpIiAtLSAiJGN1ciIpCjs7Cidsb2NrIGdsb2JhbCcqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgInNldCB0b2dnbGUgZGVsIGdldCBsaXN0IikiIC0tICIkY3VyIikKOzsKJ2xpc3QtYWxsJyopCndoaWxlIHJlYWQgLXI7IGRvIENPTVBSRVBMWSs9KCIkUkVQTFkiKTsgZG9uZSA8IDwoY29tcGdlbiAtVyAiJChfa3ViZWZzX2NvbXBsZXRpb25zX2ZpbHRlciAiIikiIC0tICIkY3VyIikKOzsKJ2xpc3QnKikKd2hpbGUgcmVhZCAtcjsgZG8gQ09NUFJFUExZKz0oIiRSRVBMWSIpOyBkb25lIDwgPChjb21wZ2VuIC1XICIkKF9rdWJlZnNfY29tcGxldGlvbnNfZmlsdGVyICIiKSIgLS0gIiRjdXIiKQo7OwonZmluZCcqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgImt1YmVhdXRoIGt1YmVjb25maWciKSIgLS0gIiRjdXIiKQo7OwonYXV0aCcqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgIiQoZmluZCAiJHtLVUJFRlNfUk9PVDotJEhPTUUvLmt1YmV9IiAtdHlwZSBmIC1uYW1lICcua3ViZWF1dGgnIDI+L2Rldi9udWxsIHwgTENfQ09MTEFURT1DLlVURi04IHNvcnQpIikiIC0tICIkY3VyIikKOzsKJ2xvY2snKikKd2hpbGUgcmVhZCAtcjsgZG8gQ09NUFJFUExZKz0oIiRSRVBMWSIpOyBkb25lIDwgPChjb21wZ2VuIC1XICIkKF9rdWJlZnNfY29tcGxldGlvbnNfZmlsdGVyICJnbG9iYWwgc2Vzc2lvbiIpIiAtLSAiJGN1ciIpCjs7CidnZXQnKikKd2hpbGUgcmVhZCAtcjsgZG8gQ09NUFJFUExZKz0oIiRSRVBMWSIpOyBkb25lIDwgPChjb21wZ2VuIC1XICIkKF9rdWJlZnNfY29tcGxldGlvbnNfZmlsdGVyICIiKSIgLS0gIiRjdXIiKQo7OwonY2QnKikKd2hpbGUgcmVhZCAtcjsgZG8gQ09NUFJFUExZKz0oIiRSRVBMWSIpOyBkb25lIDwgPChjb21wZ2VuIC1XICIkKF9rdWJlZnNfY29tcGxldGlvbnNfZmlsdGVyICIkKGZpbmQgIiR7S1VCRUZTX1JPT1Q6LSRIT01FLy5rdWJlfSIgLXR5cGUgZiAtbmFtZSAnLmt1YmVjb25maWcnIC1leGVjIGRpcm5hbWUge30gXDsgMj4vZGV2L251bGwgfCBMQ19DT0xMQVRFPUMuVVRGLTggc29ydCkiKSIgLS0gIiRjdXIiKQo7OwoqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgImdldCBsaXN0IGxpc3QtYWxsIGZpbmQgY2QgYXV0aCBsb2NrIikiIC0tICIkY3VyIikKOzsKZXNhYwp9ICYmCmNvbXBsZXRlIC1vIG5vc29ydCAtRiBfa3ViZWZzX2NvbXBsZXRpb25zIGt1YmVmcwo= | base64 --decode)"
}
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
test -n "${1:-}" || return 1
if test "$1" != '/'; then
printf '%s\n' "$1"
_kfs_parents "$(dirname "$1")"
else
printf '/\n'
return 0
fi
)
_kfs_dirname() (
if test -d "${1:-}"; then
cd "$1"; pwd
elif test -e "${1:-}"; then
cd "$(dirname "$1")"; pwd
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
_kfs_find_kubefile() (
set -- "$(_kfs_dirname "${1:-}")" "${2:-.kubeconfig}"
kubefile=$(\
_kfs_parents "$1" \
| xargs -I {} ls -1 {}/$2 2>/dev/null \
| head -n1 \
)
_kfs_debug '# KUBEFILE="%s"\n' "$kubefile"
test -z "$kubefile" || printf '%s\n' "$kubefile"
)
_kfs_find_any_kubeconfig() (
if
kubeconfig=$(_kfs_find_kubefile "${1:-}")
test -n "$kubeconfig"
then
:
elif test -n "${LOCK_KUBECONFIG:-}"; then
kubeconfig="$LOCK_KUBECONFIG"
else
kubeconfig="$HOME/.kube/config"
fi
_kfs_debug '# KUBECONFIG="%s"\n' "$kubeconfig"
printf '%s\n' "$kubeconfig"
)
_kfs_lock_session_set() {
set -- "$(_kfs_find_kubefile "${1:-.}")"
if test -z "${1:-}"; then
_kfs_printf_stderr '# INFO: no `.kubeconfig` found in directory `%s`.\n' "$(pwd)"
return 1
else
export LOCK_KUBECONFIG=$1
export KUBECONFIG=$LOCK_KUBECONFIG
_kfm_iprintf '# LOCK_KUBECONFIG="%s"\n' "$LOCK_KUBECONFIG"
fi
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
set -- "$(_kfs_find_kubefile "${1:-.}")"
if test -z "${1:-}"; then
_kfs_printf_stderr '# INFO: no `.kubeconfig` found in directory `%s`.\n' "$(pwd)"
return 1
else
test -L "$HOME/.kube/config" && unlink "$HOME/.kube/config" || :
if ! test -e "$HOME/.kube/config"; then
ln -s "$1" "$HOME/.kube/config"
_kfm_iprintf '# ln -s "%s" "%s"\n' "$1" "$HOME/.kube/config"
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
_kfs_kubeauth() {
if test -z "${1:-}" -a -n "${LOCK_KUBECONFIG:-}"; then
_kfs_printf_stderr '# INFO: `LOCK_KUBECONFIG` is set, attempting to deduct `.kubeauth`.\n'
set -- "$(_kfs_find_kubefile "$LOCK_KUBECONFIG" '.kubeauth')" _
else
set -- "$(_kfs_find_kubefile "${1:-.}" '.kubeauth')"
fi
if test -z "$1"; then
_kfs_printf_stderr "# WARNING: Could not find any \`.kubeauth\` in path or parents' paths.\n"
return 1
fi
test -x "$1" || chmod +x "$1"
_kfs_debug '# kubeauth="%s"\n' "$1"
"$1"
}
_kfs_kubectl() (
export KUBECONFIG=$(_kfs_find_any_kubeconfig)
command kubectl "$@"
)
_kfs_cd() {
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
if test -f "$1/.kubeconfig"; then
command cd -- "$1"
else
_kfs_printf_stderr '# INFO: no `.kubeconfig` found in directory `%s`.\n' "$1"
return 0
fi
if
test "${KUBEFS_CD_SESSION_LOCK:-false}" = 'true' &&
test "${LOCK_KUBECONFIG:-}" != "$1"/.kubeconfig
then
_kfs_lock_session_set "$1"
fi
}
_kfs_cmd() {
case ${1:-get} in
ctl|kubectl)
shift
_kfs_kubectl "$@"
;;
g|get)
printf '%s\n' "$(_kfs_find_any_kubeconfig)"
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
find)
case ${2:-kubeconfig} in
kubeauth)
find "${KUBEFS_ROOT:-$HOME/.kube}" -type f -name '.kubeauth' 2>/dev/null | LC_COLLATE=C.UTF-8 sort
;;
kubeconfig)
find "${KUBEFS_ROOT:-$HOME/.kube}" -type f -name '.kubeconfig' 2>/dev/null | LC_COLLATE=C.UTF-8 sort
;;
esac
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
_kfs_which() {
while test $# -gt 0; do
command -v "$1" >/dev/null 2>&1 || return $?
shift
done
}
_kfs_alias() {
alias $1="_kfs_cmd $2"
_kfs_which _kubefs_completions || return 0
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
}
_kfs_init_sourced() {
alias kubefs='_kfs_cmd'
}
_kfs_init_interactive() {
unset KUBECONFIG LOCK_KUBECONFIG
if
test "${KUBEFS_COMPLETION:-true}" = 'true' &&
_kfs_which _get_comp_words_by_ref
then
_kfs_bash_complete
fi
if test "${KUBEFS_RECOMMENDED_ALIAS:-true}" = 'true'; then
alias kubectl='_kfs_kubectl'
alias kf='_kfs_cmd'
_kfs_which _kubefs_completions && complete -F _kubefs_completions kf || :
fi
if test "${KUBEFS_OPTIONAL_ALIAS:-true}" = 'true'; then
_kfs_alias kfg 'lock global toggle'
_kfs_alias kfe 'lock session set'
_kfs_alias kfl 'lock session toggle'
_kfs_alias kfc 'cd'
_kfs_alias kfa 'auth'
_kfs_alias kff 'find'
alias kfls='_kfs_cmd list-all'
for tool in $(printf '%s\n' ${KUBEFS_TOOL:-tk:helm} | tr ':' ' '); do
command -v $tool >/dev/null 2>&1 \
&& alias $tool="KUBECONFIG=\$(kf) command $tool" || continue
done
fi
}
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
if
case "${-:-}" in *i*) true;; *) false;; esac &&
test -t 1 &&
test "${#:-0}" -eq 0
then
_kfs_init_interactive
fi
fi
_KFS_HELP=$(cat <<'EOF'
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

KUBEFS_AUTH_AUTO_CD (default: `false`)
  when using `kubefs auth` with `path` as an argument, cd to that path.

KUBEFS_RECOMMENDED_ALIAS (default: `true`)
  recommended aliases that makes short aliases of long commands. Only turn off
  if you know what you are doing.
    - `kf` -> `kubefs`
    - `kubefs` -> `kubefs`, set `KUBECONFIG` to `.kubeconfig`'s path

KUBEFS_OPTIONAL_ALIAS  (default: `true`)
  recommended aliases that makes short aliases of long commands.
    - `kfg` `kubefs lock global toggle`
    - `kfe` `kubefs lock session set`
    - `kfl` `kubefs lock session toggle`
    - `kfc` `kubefs cd`
    - `kfa` `kubefs auth`
    - `kfls` `kubefs list-all`
    - for each tool in `KUBEFS_TOOL` set `KUBECONFIG` to `.kubeconfig`'s path 

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

`KUBEFS_CD_SESSION`, `KUBEFS_CD_SESSION_LOCK`, `KUBEFS_AUTH_AUTO_CD`: while
`false` by default, `true` is recommended for heavy shell users. Add to your
~/.profile:

```
KUBEFS_CD_SESSION=true
KUBEFS_CD_SESSION_LOCK=true
KUBEFS_AUTH_AUTO_CD=true
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
)
