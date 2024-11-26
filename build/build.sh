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

## converts a script to base64 and enables executable bit
append_script() (
  src=$1
  dest=$(basename "$1")
  printf "printf '%%s\\\n' '"%s"' | base64 --decode > \"%s/%s\"\n" $(b64 "$src") '$BINDIR' "$dest"
  printf 'chmod +x "%s/%s"\n' '$BINDIR' "$dest"
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

cat << EOF | strip | add_credits > "$BIN/kubefs"
#!/bin/sh
if \\
  test "\${KUBEFS_COMPLETION:-true}" = 'true' \\
  && command -v _get_comp_words_by_ref >/dev/null 2>&1 \\
  && test -t 1; then
  eval "\$(printf '%s\n' $(cat "$SRC/kubefs-completions.bash") | base64 --decode)"
fi
$(awk 'NR > 1' "$SRC/kubefs.sh")
EOF

# build rest

cat "$SRC/kubefs_addons.sh" | strip | add_credits > "$BIN/kubefs_addons"
cat "$SRC/kubeauth_init.sh" | add_credits > "$BIN/kubeauth_init"

# build `install.sh`

cat << EOF | add_credits > "$ROOT/install.sh"
#!/bin/sh
BINDIR=\${BINDIR:-"\$HOME/.local/bin"}
mkdir -p "\$BINDIR"
EOF

append_script "$BIN/kubefs"        >> "$ROOT/install.sh"
append_script "$BIN/kubeauth_init" >> "$ROOT/install.sh"
append_script "$BIN/kubefs_addons" >> "$ROOT/install.sh"
