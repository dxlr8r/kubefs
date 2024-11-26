#!/usr/bin/env bash

set -eo pipefail

# header attached to `kubefs`
KUBEFS_CREDITS='# https://github.com/dxlr8r/kubefs'

# some helper functions
indent() {
  awk -v I="${2:-  }" '{if (length($0) > 0) {printf "%s%s\n", I, $0} else {print}}' "$1"
}
b64() { 
  if base64 --version 2>&1 | head -n1 | grep -q 'GNU'; then
    base64 -w0 "$1"
  else
    base64 -i "$1"
  fi
}

# converts a script to base64 and enables executable bit
append_script() (
  src=$1
  dest=$(basename "$1")
  printf "printf '%%s\\\n' '"%s"' | base64 --decode > \"%s/%s\"\n" $(b64 "$src") '$BINDIR' "$dest"
  printf 'chmod +x "%s/%s"\n' '$BINDIR' "$dest"
)

# strips comments, empty lines, and indentation
strip() (
  if test "$#" -eq 0; then
    strip "$(cat)"
  fi
  _data="$1"
  _header=$(printf '%s\n' "$_data" | head -n1)

  # do not strip shebang
  printf '%s' "$_header" | cut -b1-2 | grep -Fxq '#!' \
  && { printf '%s\n' "$_header" ; } \
  || { printf '%s\n' "$_header" | _stripper ; }

  printf '%s\n' "$_data" | awk 'NR > 1' | _stripper
)
_stripper() (
  grep -vE '^\s*(#|$)' | sed -E 's/^ +//g' || :
)
add_credits() (
  if test "$#" -eq 0; then
    add_credits "$(cat)"
  fi
  _data="$1"
  printf '%s\n' "$_data" | head -n1
  printf '%s\n' "$KUBEFS_CREDITS"
  printf '%s\n' "$_data" | awk 'NR > 1'
)

# cd to path of script
cd "$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
SRC='../src'
BIN='../bin'
ROOT='..'

# build `kubefs`

COMPLETELY_OUTPUT_PATH="$SRC/kubefs-completions.bash" completely generate

cat << EOF | strip | add_credits > "$BIN/kubefs"
#!/bin/sh
if \\
  test "\${KUBEFS_COMPLETION:-true}" = 'true' \\
  && command -v _get_comp_words_by_ref >/dev/null 2>&1; then
$(indent "$SRC/kubefs-completions.bash")
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
