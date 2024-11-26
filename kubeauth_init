#!/bin/sh
# having `.kubelogin` and `.kubeconfig` in the same directory is a good practice. But not required by kubefs.

EMPTY_KUBECONFIG='apiVersion: v1
kind: Config
clusters: []
contexts: []
current-context: ""
users: []'

SPATH=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
# check if .kubeconfig exist in the same directory as kubelogin_init is called/sourced
if ! test -f "${SPATH}/.kubeconfig"; then
  printf '%s\n' "$EMPTY_KUBECONFIG" > "${SPATH}/.kubeconfig"
  chmod 600 "${SPATH}/.kubeconfig"
fi
export KUBECONFIG="${SPATH}/.kubeconfig"

kubectl auth can-i --list >/dev/null 2>&1 \
&& KUBE_AUTHENTICATED=true \
|| unset KUBE_AUTHENTICATED
