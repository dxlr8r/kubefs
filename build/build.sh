#!/usr/bin/env bash

set -eo pipefail

# header attached to `kubefs`
KUBEFS_CREDITS='# https://github.com/dxlr8r/kubefs'

# some helper functions

## indent input
indent() {
  awk -v I="${2:-  }" '{if (length($0) > 0) {printf "%s%s\n", I, $0} else {print}}' "$1"
}

## GNU/BSD independent base64 converter
b64() (
  if test "$#" -eq 0; then
    _data='-'
  else
    _data="$1"
  fi
  if base64 --version 2>&1 | head -n1 | grep -q 'GNU'; then
    base64 -w0 "$_data"
  else
    base64 -i "$_data"
  fi
)

## converts a script to base64
append_script() (
  src=$1
  dest=$(basename "$1")
  printf "printf '%%s\\\n' '"%s"' | base64 --decode > \"%s/%s\"\n" $(b64 "$src") '$KUBEFS_DIR' "$dest"
  # printf 'chmod +x "%s/%s"\n' '$KUBEFS_DIR' "$dest"
)

## strips comments, empty lines, and indentation
strip() (
  if test "$#" -eq 0; then
    strip "$(cat)"
  else
    _data="$1"
    _header=$(printf '%s\n' "$_data" | head -n1)

    # do not strip shebang
    printf '%s' "$_header" | cut -b1-2 | grep -Fxq '#!' \
    && { printf '%s\n' "$_header" ; } \
    || { printf '%s\n' "$_header" | _stripper ; }

    printf '%s\n' "$_data" | awk 'NR > 1' | _stripper
  fi
)
_stripper() (
  grep -vE '^\s*(#|$)' | sed -E 's/^ +//g' || :
)

## add credits to script
add_credits() (
  if test "$#" -eq 0; then
    add_credits "$(cat)"
  else
    _data="$1"
    printf '%s\n' "$_data" | head -n1
    printf '%s\n' "$KUBEFS_CREDITS"
    printf '%s\n' "$_data" | awk 'NR > 1'
  fi
)

# cd to path of script
cd "$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
SRC='../src'
BIN='../bin'
ROOT='..'

# build `kubefs`

completely generate
cat completely.bash | strip | b64 > "$SRC/kubefs-completions.bash"

cat << EOF | strip | add_credits > "$BIN/kubefs.sh"
#!/bin/sh
_kfs_bash_complete() {
  eval "\$(printf '%s\n' $(cat "$SRC/kubefs-completions.bash") | base64 --decode)"
}
$(awk 'NR > 1' "$SRC/kubefs.sh")
EOF

# build rest

cat "$SRC/kubefs_addons.sh" | strip | add_credits > "$BIN/kubefs_addons.sh"
cat "$SRC/kubeauth_init.sh" | add_credits > "$BIN/kubeauth_init.sh"

# build `install.sh`

cat << EOF | add_credits > "$ROOT/install.sh"
#!/bin/sh
if test \${UID:--1} -eq 0; then
  : \${KUBEFS_DIR:="/usr/share/kubefs"}
else
  : \${KUBEFS_DIR:="\$HOME/.local/share/kubefs"}
fi
mkdir -p "\$KUBEFS_DIR"
EOF

append_script "$BIN/kubefs.sh"        >> "$ROOT/install.sh"
append_script "$BIN/kubeauth_init.sh" >> "$ROOT/install.sh"
append_script "$BIN/kubefs_addons.sh" >> "$ROOT/install.sh"
