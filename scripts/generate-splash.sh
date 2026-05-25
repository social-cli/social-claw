#!/usr/bin/env bash
# Generate the setup splash from assets/Logo Icon 3.png + figlet wordmark.
# Pre-generated at build time — committed to repo. End users never run this.
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

# Helper: pad a line so it's centered in an 80-column terminal
center_line() {
  local line="$1"
  local visible_width="$2"  # number of visible chars (excluding ANSI codes)
  local term_width=80
  local pad=$(( (term_width - visible_width) / 2 ))
  [ "$pad" -lt 0 ] && pad=0
  printf '%*s%s\n' "$pad" "" "$line"
}

# ─── Build splash ─────────────────────────────────────────────────────
{
  echo ""
  echo ""

  # Logo as block pixel art — centered in 80-col terminal
  # Render at 24 wide so we can center with ~28 cols of padding on each side
  ICON_LINES=$(chafa --format=symbols --symbols=block --size=24x12 --colors=truecolor "$ICON_SRC")
  while IFS= read -r line; do
    printf '%*s%s\n' 28 "" "$line"
  done <<< "$ICON_LINES"

  echo ""

  # Wordmark in terracotta — figlet outputs known widths per font
  # "Social Claw" in 'slant' font is ~62 chars wide → pad by 9
  printf '\033[38;2;217;95;43m\033[1m'
  WORDMARK=$(figlet -f slant -w 80 "Social Claw" 2>/dev/null || figlet -w 80 "Social Claw")
  while IFS= read -r line; do
    # Center each figlet line based on its visible length
    local_width=${#line}
    pad=$(( (80 - local_width) / 2 ))
    [ "$pad" -lt 0 ] && pad=0
    printf '%*s%s\n' "$pad" "" "$line"
  done <<< "$WORDMARK"
  printf '\033[22m\033[39m'

  echo ""

  # Tagline — centered (visible: "Secure agents · Runs on your machine · Yours to modify" = 53 chars)
  TAGLINE_TEXT="Secure agents · Runs on your machine · Yours to modify"
  TAGLINE_PAD=$(( (80 - 54) / 2 ))
  printf '%*s\033[2m%s\033[22m\n' "$TAGLINE_PAD" "" "$TAGLINE_TEXT"

  echo ""

  # Separator — 60 chars wide, centered
  SEP=$(printf '═%.0s' $(seq 1 60))
  SEP_PAD=$(( (80 - 60) / 2 ))
  printf '%*s\033[38;2;217;95;43m%s\033[39m\n' "$SEP_PAD" "" "$SEP"

  echo ""
} > "$SPLASH_OUT"

echo "✓ Generated $SPLASH_OUT ($(wc -c < "$SPLASH_OUT") bytes)"
echo ""
echo "─── Preview ───"
cat "$SPLASH_OUT"
