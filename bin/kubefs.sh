#!/bin/sh
# https://github.com/dxlr8r/kubefs
if \
test "${KUBEFS_COMPLETION:-true}" = 'true' \
&& case "${-:-}" in *i*) true;; *) false;; esac \
&& test -t 1 \
&& command -v _get_comp_words_by_ref >/dev/null 2>&1; then
eval "$(printf '%s\n' X2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIoKSB7CmxvY2FsIHdvcmRzPSIkMSIKbG9jYWwgY3VyPSR7Q09NUF9XT1JEU1tDT01QX0NXT1JEXX0KbG9jYWwgcmVzdWx0PSgpCmlmIFtbICIke2N1cjowOjF9IiA9PSAiLSIgXV07IHRoZW4KZWNobyAiJHdvcmRzIgplbHNlCmZvciB3b3JkIGluICR3b3JkczsgZG8KW1sgIiR7d29yZDowOjF9IiAhPSAiLSIgXV0gJiYgcmVzdWx0Kz0oIiR3b3JkIikKZG9uZQplY2hvICIke3Jlc3VsdFsqXX0iCmZpCn0KX2t1YmVmc19jb21wbGV0aW9ucygpIHsKbG9jYWwgY3VyPSR7Q09NUF9XT1JEU1tDT01QX0NXT1JEXX0KbG9jYWwgY29tcHdvcmRzPSgiJHtDT01QX1dPUkRTW0BdOjE6JENPTVBfQ1dPUkQtMX0iKQpsb2NhbCBjb21wbGluZT0iJHtjb21wd29yZHNbKl19IgpjYXNlICIkY29tcGxpbmUiIGluCidsb2NrIHNlc3Npb24gdG9nZ2xlJyopCndoaWxlIHJlYWQgLXI7IGRvIENPTVBSRVBMWSs9KCIkUkVQTFkiKTsgZG9uZSA8IDwoY29tcGdlbiAtVyAiJChfa3ViZWZzX2NvbXBsZXRpb25zX2ZpbHRlciAiJChmaW5kICIke0tVQkVGU19ST09UOi0kSE9NRS8ua3ViZX0iIC10eXBlIGYgLW5hbWUgJy5rdWJlY29uZmlnJyAyPi9kZXYvbnVsbCkiKSIgLS0gIiRjdXIiKQo7OwonbG9jayBnbG9iYWwgdG9nZ2xlJyopCndoaWxlIHJlYWQgLXI7IGRvIENPTVBSRVBMWSs9KCIkUkVQTFkiKTsgZG9uZSA8IDwoY29tcGdlbiAtVyAiJChfa3ViZWZzX2NvbXBsZXRpb25zX2ZpbHRlciAiJChmaW5kICIke0tVQkVGU19ST09UOi0kSE9NRS8ua3ViZX0iIC10eXBlIGYgLW5hbWUgJy5rdWJlY29uZmlnJyAyPi9kZXYvbnVsbCkiKSIgLS0gIiRjdXIiKQo7OwonbG9jayBzZXNzaW9uIGxpc3QnKikKd2hpbGUgcmVhZCAtcjsgZG8gQ09NUFJFUExZKz0oIiRSRVBMWSIpOyBkb25lIDwgPChjb21wZ2VuIC1XICIkKF9rdWJlZnNfY29tcGxldGlvbnNfZmlsdGVyICIiKSIgLS0gIiRjdXIiKQo7OwonbG9jayBnbG9iYWwgbGlzdCcqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgIiIpIiAtLSAiJGN1ciIpCjs7Cidsb2NrIHNlc3Npb24gc2V0JyopCndoaWxlIHJlYWQgLXI7IGRvIENPTVBSRVBMWSs9KCIkUkVQTFkiKTsgZG9uZSA8IDwoY29tcGdlbiAtVyAiJChfa3ViZWZzX2NvbXBsZXRpb25zX2ZpbHRlciAiJChmaW5kICIke0tVQkVGU19ST09UOi0kSE9NRS8ua3ViZX0iIC10eXBlIGYgLW5hbWUgJy5rdWJlY29uZmlnJyAyPi9kZXYvbnVsbCkiKSIgLS0gIiRjdXIiKQo7OwonbG9jayBzZXNzaW9uIGRlbCcqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgIiIpIiAtLSAiJGN1ciIpCjs7Cidsb2NrIHNlc3Npb24gZ2V0JyopCndoaWxlIHJlYWQgLXI7IGRvIENPTVBSRVBMWSs9KCIkUkVQTFkiKTsgZG9uZSA8IDwoY29tcGdlbiAtVyAiJChfa3ViZWZzX2NvbXBsZXRpb25zX2ZpbHRlciAiIikiIC0tICIkY3VyIikKOzsKJ2xvY2sgZ2xvYmFsIHNldCcqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgIiQoZmluZCAiJHtLVUJFRlNfUk9PVDotJEhPTUUvLmt1YmV9IiAtdHlwZSBmIC1uYW1lICcua3ViZWNvbmZpZycgMj4vZGV2L251bGwpIikiIC0tICIkY3VyIikKOzsKJ2xvY2sgZ2xvYmFsIGRlbCcqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgIiIpIiAtLSAiJGN1ciIpCjs7Cidsb2NrIGdsb2JhbCBnZXQnKikKd2hpbGUgcmVhZCAtcjsgZG8gQ09NUFJFUExZKz0oIiRSRVBMWSIpOyBkb25lIDwgPChjb21wZ2VuIC1XICIkKF9rdWJlZnNfY29tcGxldGlvbnNfZmlsdGVyICIiKSIgLS0gIiRjdXIiKQo7OwonbG9jayBzZXNzaW9uJyopCndoaWxlIHJlYWQgLXI7IGRvIENPTVBSRVBMWSs9KCIkUkVQTFkiKTsgZG9uZSA8IDwoY29tcGdlbiAtVyAiJChfa3ViZWZzX2NvbXBsZXRpb25zX2ZpbHRlciAic2V0IHRvZ2dsZSBkZWwgZ2V0IGxpc3QiKSIgLS0gIiRjdXIiKQo7OwonbG9jayBnbG9iYWwnKikKd2hpbGUgcmVhZCAtcjsgZG8gQ09NUFJFUExZKz0oIiRSRVBMWSIpOyBkb25lIDwgPChjb21wZ2VuIC1XICIkKF9rdWJlZnNfY29tcGxldGlvbnNfZmlsdGVyICJzZXQgdG9nZ2xlIGRlbCBnZXQgbGlzdCIpIiAtLSAiJGN1ciIpCjs7CidsaXN0LWFsbCcqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgIiIpIiAtLSAiJGN1ciIpCjs7CidsaXN0JyopCndoaWxlIHJlYWQgLXI7IGRvIENPTVBSRVBMWSs9KCIkUkVQTFkiKTsgZG9uZSA8IDwoY29tcGdlbiAtVyAiJChfa3ViZWZzX2NvbXBsZXRpb25zX2ZpbHRlciAiIikiIC0tICIkY3VyIikKOzsKJ2F1dGgnKikKd2hpbGUgcmVhZCAtcjsgZG8gQ09NUFJFUExZKz0oIiRSRVBMWSIpOyBkb25lIDwgPChjb21wZ2VuIC1XICIkKF9rdWJlZnNfY29tcGxldGlvbnNfZmlsdGVyICIkKGZpbmQgIiR7S1VCRUZTX1JPT1Q6LSRIT01FLy5rdWJlfSIgLXR5cGUgZiAtbmFtZSAnLmt1YmVhdXRoJyAyPi9kZXYvbnVsbCkiKSIgLS0gIiRjdXIiKQo7OwonbG9jaycqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgImdsb2JhbCBzZXNzaW9uIikiIC0tICIkY3VyIikKOzsKJ2dldCcqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgIiIpIiAtLSAiJGN1ciIpCjs7CidjZCcqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgIiQoZmluZCAiJHtLVUJFRlNfUk9PVDotJEhPTUUvLmt1YmV9IiAtdHlwZSBmIC1uYW1lICcua3ViZWNvbmZpZycgLWV4ZWMgZGlybmFtZSB7fSBcOyAyPi9kZXYvbnVsbCkiKSIgLS0gIiRjdXIiKQo7OwoqKQp3aGlsZSByZWFkIC1yOyBkbyBDT01QUkVQTFkrPSgiJFJFUExZIik7IGRvbmUgPCA8KGNvbXBnZW4gLVcgIiQoX2t1YmVmc19jb21wbGV0aW9uc19maWx0ZXIgImdldCBjZCBsaXN0IGxpc3QtYWxsIGF1dGggbG9jayIpIiAtLSAiJGN1ciIpCjs7CmVzYWMKfSAmJgpjb21wbGV0ZSAtRiBfa3ViZWZzX2NvbXBsZXRpb25zIGt1YmVmcwo= | base64 --decode)"
fi
_kfs_printf_stderr() {
if test "$#" -eq 0; then
_kfs_printf_stderr '%s\n' "$(cat)"
else
printf -- "$@" >/dev/stderr
fi
}
_kfm_iprintf() {
if case "${-:-}" in *i*) true;; *) false;; esac || test -n "${KUBEFS_DEBUG:-}"; then
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
_kfs_cmd() {
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
if test -z "${1:-}"; then
_kfs_cmd get
else
_kfs_cd "$1"
fi
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
_kfs_which() {
while test "$#" -gt 0; do
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
complete -o default -F _kubefs_completions_$1 $1
")"
}
_kfs_init_sourced() {
alias kubefs='_kfs_cmd'
}
_kfs_init_interactive() {
unset KUBECONFIG LOCK_KUBECONFIG
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
alias kfls='_kfs_cmd list-all'
alias kfa='_kfs_cmd auth'
for tool in $(printf '%s\n' ${KUBEFS_TOOL:-helm} | tr ':' ' '); do
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
