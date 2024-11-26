#!/usr/bin/env bash

set -eo pipefail

# header attached to `kubefs`
KUBEFS_HEADER='#!/bin/sh
# https://github.com/dxlr8r/kubefs'

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
append_script() (
  src=$1
  dest=$(basename "$1")
  printf "printf '%%s\\\n' '"%s"' | base64 --decode > \"%s/%s\"\n" $(b64 "$src") '$BINDIR' "$dest"
  printf 'chmod +x "%s/%s"\n' '$BINDIR' "$dest"
)

# cd to path of script
cd "$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
SRC='../src'
ROOT='..'

# build `kubefs`

COMPLETELY_OUTPUT_PATH="$SRC/kubefs-completions.bash" completely generate

cat << EOF | grep -vE '^\s*(#|$)' | sed -E 's/^ +//g' \
| printf '%s\n%s\n' "$KUBEFS_HEADER" "$(cat)" > "$ROOT/kubefs"
if \\
  test "\${KUBEFS_COMPLETION:-true}" = 'true' \\
  && command -v _get_comp_words_by_ref >/dev/null 2>&1; then
$(indent "$SRC/kubefs-completions.bash")
fi
$(awk 'NR > 1' "$SRC/kubefs.sh")
EOF

# build `install.sh`

cat > "$ROOT/install.sh" << EOF
#!/bin/sh
BINDIR=\${BINDIR:-"\$HOME/.local/bin"}
mkdir -p "\$BINDIR"
EOF

append_script "$SRC/kubefs.sh" >> "$ROOT/install.sh"
append_script "$ROOT/kubeauth_init" >> "$ROOT/install.sh"
append_script "$ROOT/addons.sh" >> "$ROOT/install.sh"
