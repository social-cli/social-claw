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

# ─── Build splash ─────────────────────────────────────────────────────
{
  echo ""
  echo ""
  # Logo as block pixel art in truecolor (preserves logo's actual colors)
  chafa --format=symbols --symbols=block --size=36x16 --colors=truecolor "$ICON_SRC" | sed 's/^/    /'
  echo ""
  # Wordmark in terracotta
  printf '\033[38;2;217;95;43m\033[1m'
  figlet -f slant -w 80 "Social Claw" 2>/dev/null || figlet -w 80 "Social Claw"
  printf '\033[22m\033[39m'
  echo ""
  # Tagline — Social Claw's core promise (not skill-specific)
  printf '\033[2m              Secure agents · Runs on your machine · Yours to modify\033[22m\n'
  echo ""
  # Separator
  printf '\033[38;2;217;95;43m═══════════════════════════════════════════════════════════════════\033[39m\n'
  echo ""
} > "$SPLASH_OUT"

echo "✓ Generated $SPLASH_OUT ($(wc -c < "$SPLASH_OUT") bytes)"
echo ""
echo "─── Preview ───"
cat "$SPLASH_OUT"
