#!/bin/sh

_kfs_addons_kubectl_alias_complete() {
  # skip if requested
  test "${KUBEFS_COMPLETION:-true}" = 'true' || return 0
  # not executed as a subshell, prefixed to a pipe, etc.
  test -t 1 || return 0
  # bash completion not setup
  command -v _get_comp_words_by_ref >/dev/null 2>&1 || return 0
  # kubectl completion not sourced
  command -v __start_kubectl >/dev/null 2>&1 || return 0

  eval "$(printf "
  _kubectl_completions_$1() {
    local compl
    compl=\${COMP_WORDS[@]:1}
    (( COMP_CWORD += 2 ))
    COMP_WORDS=( kubectl $2 \"\${compl:- }\" )
    __start_kubectl
  }
  complete -o default -F _kubectl_completions_$1 $1
  ")"
}

# get current context or set
_kfs_addons_kubectl_alias_complete kx 'config use-context'
kx() (
  if command -v kubefs >/dev/null 2>&1; then
    export KUBECONFIG=$(kubefs)
  fi

  # switch to named context
  if test "$1"; then
    kubectl config use-context "$1"
  # I probably went overboard here to reformat `kubectl config get-contexts`
  else
    _rctx=$(kubectl config get-contexts)
    _header=$(printf '%s\n' "$_rctx" | head -n1)
    _max_len=$(printf '%s\n' "$_rctx" | awk '{print length}' | sort -rn | head -n1)
    _sep=$'\t'

    # CURRENT NAME CLUSTER AUTHINFO NAMESPACE
    _columns=${KX_COLUMNS:-'NAME,NAMESPACE,CLUSTER,CURRENT'}

    # filter and format _rctx to _columns using _sep
    _ctx=$(printf '%s\n' "$_rctx" \
    | awk -v SEP="$_sep" -v COLUMNS="$_columns" \
    -v HEAD="$_header" -v MAXLEN="$_max_len" \
    'BEGIN {
      split(COLUMNS, TCOL, ",")
      TCOL_LEN=0; for(COL in TCOL){ TCOL_LEN++ }
      GAP=3;

      CURRENT_START=0;
      CURRENT_LEN=index(HEAD, "NAME")-1;

      NAME_START=CURRENT_LEN+1;
      NAME_LEN=index(HEAD, "CLUSTER")-NAME_START;

      CLUSTER_START=NAME_START+NAME_LEN
      CLUSTER_LEN=index(HEAD, "AUTHINFO")-CLUSTER_START;

      AUTHINFO_START=CLUSTER_START+CLUSTER_LEN
      AUTHINFO_LEN=index(HEAD, "NAMESPACE")-AUTHINFO_START;

      NAMESPACE_START=AUTHINFO_START+AUTHINFO_LEN
      NAMESPACE_LEN=MAXLEN-NAMESPACE_START;
    }
    {
      DCOL["CURRENT"]=substr($0, CURRENT_START, CURRENT_LEN-GAP);
      DCOL["NAME"]=substr($0, NAME_START, NAME_LEN-GAP);
      DCOL["CLUSTER"]=substr($0, CLUSTER_START, CLUSTER_LEN-GAP);
      DCOL["AUTHINFO"]=substr($0, AUTHINFO_START, AUTHINFO_LEN-GAP);

      _NAMESPACE=substr($0, NAMESPACE_START);
      for (i = 0; i <= (MAXLEN-length($0)-1); i++) { _NAMESPACE=_NAMESPACE " " }
      DCOL["NAMESPACE"]=_NAMESPACE

      for(i=1; i <= TCOL_LEN; i++) {
        printf "%s", DCOL[TCOL[i]]
        if(i < TCOL_LEN) { printf "%s", SEP }
      }
      printf "\n"
    }')

    # find column number where CURRENT is
    _current_col=$(\
    printf '%s' "$_columns" \
    | tr , '\n'\
    | awk '{if($1 == "CURRENT") {print NR} }')

    # only print header (line 1) if not redirecting stdout
    if test -t 1; then
      printf '%s\n' "$_ctx" | head -n1
    fi
    printf '%s\n' "$_ctx" \
    | awk '{if(NR > 1) {print}}' \
    | sort -t "$_sep" -k${_current_col}r
  fi
)

# get current namespace or set
_kfs_addons_kubectl_alias_complete kn 'get ns --no-headers -o custom-columns=":.metadata.name"'
kn() (
  if command -v kubefs >/dev/null 2>&1; then
    export KUBECONFIG=$(kubefs)
  fi

  if test "$1"; then
    kubectl config set-context $1
  else
    _current=$(kubectl config view --minify -o jsonpath="{..namespace}")
    _all=$(kubectl get ns -o name | cut -d/ -f2)

    _max_len=$(printf '%s\n' "$_all" | awk '{print length}' | sort -rn | head -n1)
    _sep=$'\t'

    _ns=$(printf '%s\n' "$_all" \
    | printf '%s\t%s\n%s\n' 'NAME' 'CURRENT' "$(cat)" \
    | awk -v CURRENT="$_current" -v SEP="$_sep" -v MAXLEN="$_max_len" '
    {
      printf "%s", $1
      for(i = 1; i <= (MAXLEN-length($1)); i++) {
        printf " "
      }
      printf "%s",SEP
      if($1 == CURRENT) { printf "%s", "*" }
      else { printf "%s", $2 }
      printf "\n"
    }')

    if test -t 1; then
      printf '%s\n' "$_ns" | head -n1
    fi
    printf "%s\n" "$_ns" \
    | awk '{if(NR > 1) {print}}' \
    | sort -t "$_sep" -k2r
  fi
)

kubeauth_init() {
  if test -e "${1:-$(pwd)}/.kubeauth"; then
    printf 'ERROR: `%s` already exists.\n' "${1:-}/.kubeauth" > /dev/stderr
    return 1
  else
    # needs to be escaped, otherwise `build.sh` will strip comments and leading whitespace
    printf '%b' '#!/bin/sh\nset -e\n\n# source kubeauth_init.sh\n. $HOME/.local/share/kubefs/kubeauth_init.sh 2>/dev/null || \\\n. /usr/share/kubefs/kubeauth_init.sh\n\n# if already athenticated, exit\ntest -n "${KUBE_AUTHENTICATED:-}" && exit || :\n\n# myauth_cmd\n' > "${1:-$(pwd)}/.kubeauth"
  fi
}
