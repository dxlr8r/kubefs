#!/usr/bin/env bash

set -eo pipefail

HEADER='#!/bin/sh
#Simen'

indent() {
  awk -v I="${2:-  }" '{if (length($0) > 0) {printf "%s%s\n", I, $0} else {print}}' "$1"
}

cd "$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
SRC='../src'
ROOT='..'

COMPLETELY_OUTPUT_PATH="$SRC/kubefs-completions.bash" completely generate

cat << EOF | grep -vE '^\s*(#|$)' | sed -E 's/^ +//g' \
| printf '%s\n%s\n' "$HEADER" "$(cat)" > "$ROOT/kubefs"
if \\
  test "\${KUBEFS_COMPLETION:-true}" = 'true' \\
  && command -v _get_comp_words_by_ref >/dev/null 2>&1; then
$(indent "$SRC/kubefs-completions.bash")
fi
$(awk 'NR > 1' "$SRC/kubefs.sh")
EOF
