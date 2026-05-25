#!/usr/bin/env bash
# Generate the setup splash from assets/Logo Icon 3.png + figlet wordmark.
# Pre-generated at build time — committed to repo. End users never run this.
#
# The output file uses a NULL-byte sentinel \0 at the start of every line.
# socialclaw.sh strips \0 and re-pads each line for the user's actual
# terminal width — so the splash always looks centered regardless of
# terminal size.
#
# To regenerate: bash scripts/generate-splash.sh
# Requires: chafa, figlet (sudo apt install -y chafa figlet)

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

ICON_SRC="assets/Logo Icon 3.png"
SPLASH_OUT="assets/setup-splash.txt"

if [ ! -f "$ICON_SRC" ]; then
  echo "Error: $ICON_SRC not found" >&2
  exit 1
fi

if ! command -v chafa >/dev/null 2>&1; then
  echo "Error: chafa not installed. Run: sudo apt install -y chafa" >&2
  exit 1
fi

if ! command -v figlet >/dev/null 2>&1; then
  echo "Error: figlet not installed. Run: sudo apt install -y figlet" >&2
  exit 1
fi

# ─── Build splash (no padding — socialclaw.sh centers at display time) ────
{
  echo ""
  echo ""

  # Logo as block pixel art (24 cols wide) — pad each line to exactly 24 cols
  # so chafa's variable-length output doesn't break our centering.
  ICON_WIDTH=24
  while IFS= read -r line; do
    # Strip ANSI codes to measure visible width, then pad to ICON_WIDTH
    stripped=$(printf '%s' "$line" | sed 's/\x1b\[[0-9;]*m//g')
    visible_len=${#stripped}
    pad=$(( ICON_WIDTH - visible_len ))
    [ "$pad" -lt 0 ] && pad=0
    printf '%s%*s\n' "$line" "$pad" ""
  done < <(chafa --format=symbols --symbols=block --size=${ICON_WIDTH}x12 --colors=truecolor "$ICON_SRC")

  echo ""

  # Wordmark in terracotta
  printf '\033[38;2;217;95;43m\033[1m'
  figlet -f slant -w 80 "Social Claw" 2>/dev/null || figlet -w 80 "Social Claw"
  printf '\033[22m\033[39m'

  echo ""

  # Tagline (dim)
  printf '\033[2mSecure agents · Runs on your machine · Yours to modify\033[22m\n'

  echo ""

  # Separator (60 chars)
  printf '\033[38;2;217;95;43m'
  printf '═%.0s' $(seq 1 60)
  printf '\033[39m\n'

  echo ""
} > "$SPLASH_OUT"

echo "✓ Generated $SPLASH_OUT ($(wc -c < "$SPLASH_OUT") bytes)"
