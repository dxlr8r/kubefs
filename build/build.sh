#!/usr/bin/env bash

# Setup script
set -eo pipefail
cd "$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
SRC='../src'
BIN='../bin'
ROOT='..'


# Constants
## header attached to `kubefs`
KUBEFS_CREDITS='# https://github.com/dxlr8r/kubefs'

# some helper functions
## GNU/BSD independent base64 converter
B64() (
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
RmShebang() ( 
  if head -n1 "$1" | cut -b1-2 | grep -Fxq '#!'; then
    awk 'NR > 1' "$1"
  else
    cat "$1"
  fi
)
AddCredits() (
  if head -n1 "$1" | cut -b1-2 | grep -Fxq '#!'; then
    head -n1 "$1"
    printf '%s\n' "$KUBEFS_CREDITS"
    awk 'NR > 1' "$1"
  else
    cat "$1"
  fi
)
StrReplace() {
  awk -v find="$1" -v _repl="$2" -v _input="$3" -v ORS=""  '
  BEGIN {
    repl = ""
    while ((getline line < _repl) > 0) {
        repl = repl line "\n"
    }
    close(_repl)

    input = ""
    while ((getline line < _input) > 0) {
        input = input line "\n"
    }
    close(_input)

    find_l=length(find);
    for(i=1; i <= length(input);) {
      f=0;
      for(j=1; j <= find_l; j++) {
        if (substr(input, i+j-1, 1) == substr(find, j, 1)) {f++}
      }
      if (f==find_l) { print repl; i=i+=find_l }
      else {print substr(input, i, 1); i++}
    }
    printf "\n"
  }'
}
## converts a script to base64
AppendScript() (
  src=$1
  dest=$(basename "$1")
  printf "printf '%%s\\\n' '"%s"' | base64 --decode > \"%s/%s\"\n" $(B64 "$src") "\$$2" "$dest"
  # printf 'chmod +x "%s/%s"\n' '$KUBEFS_DIR' "$dest"
)

# build

completely generate
cp -f completely.bash "$SRC/kubefs-completions.bash"
# B64 completely.bash > "$SRC/kubefs-completions.bash"

## kubefs.sh

### replace $1 with $2 in $3
StrReplace \
  "_HELP_PLACEHOLDER_" \
  "$SRC/kubefs-help.md"\
  "$SRC/kubefs.sh" \
| sponge "$BIN/kubefs.sh"

### replace $1 with $2 in $3
StrReplace \
  "_KUBEFS_BASH_COMPLETE_PLACEHOLDER_" \
  "$SRC/kubefs-completions.bash" \
  "$BIN/kubefs.sh" \
| sponge "$BIN/kubefs.sh"

### add credits
AddCredits "$BIN/kubefs.sh" | sponge "$BIN/kubefs.sh"

## kubefs-addons.sh
### add credits
AddCredits "$SRC/kubefs-addons.sh" | sponge "$BIN/kubefs-addons.sh"

## kubeauth_init.sh
### add credits
AddCredits "$SRC/kubeauth-base.sh" | sponge "$BIN/kubeauth-base.sh"

## install.sh

cat << EOF > "$ROOT/install.sh"
#!/bin/sh
$KUBEFS_CREDITS
if test \${UID:--1} -eq 0; then
  : \${KUBEFS_LIBEXEC_DIR:="/usr/libexec/kubefs"}
  : \${KUBEFS_PROFILE_DIR:="/etc/profile.d"}
else
  : \${KUBEFS_LIBEXEC_DIR:="\$HOME/.local/libexec/kubefs"}
  : \${KUBEFS_PROFILE_DIR:="\$HOME/.local/profile.d"}
fi
mkdir -p "\$KUBEFS_LIBEXEC_DIR" "\$KUBEFS_PROFILE_DIR"
EOF

AppendScript "$BIN/kubefs.sh"        "KUBEFS_PROFILE_DIR" >> "$ROOT/install.sh"
AppendScript "$BIN/kubefs-addons.sh" "KUBEFS_PROFILE_DIR" >> "$ROOT/install.sh"
AppendScript "$BIN/kubeauth-base.sh" "KUBEFS_LIBEXEC_DIR" >> "$ROOT/install.sh"
