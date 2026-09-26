#!/usr/bin/env bash
# headless-shot.sh -- screenshot a local HTML page with whatever browser is available.
#
# Usage: headless-shot.sh <page.html> <out.png> [width=1280] [height=800]
#
# Detection order:
#   1. $HEADLESS_BROWSER (explicit override: path or command name)
#   2. Chromium-family browsers on PATH (Chrome, Edge, Chromium, Brave, Vivaldi, Opera)
#   3. Chromium-family browsers in well-known install locations (Windows/macOS)
#   4. Firefox (last resort: different flag syntax, no --virtual-time-budget)
# Exits 1 with the list of searched locations when nothing is found.

set -euo pipefail

log() { printf '%s\n' "$*"; }
die() { printf 'error: %s\n' "$*" >&2; exit 1; }

[ $# -ge 2 ] || die "usage: headless-shot.sh <page.html> <out.png> [width=1280] [height=800]"

PAGE="$1"
OUT="$2"
WIDTH="${3:-1280}"
HEIGHT="${4:-800}"

case "$WIDTH$HEIGHT" in *[!0-9]*) die "width/height must be integers, got: $WIDTH x $HEIGHT" ;; esac
[ -f "$PAGE" ] || die "page not found: $PAGE"

IS_WIN=0
UNAME_S="$(uname -s)"
case "$UNAME_S" in MINGW*|MSYS*|CYGWIN*) IS_WIN=1 ;; esac

abs_path() {
  (cd "$(dirname "$1")" && printf '%s/%s' "$(pwd)" "$(basename "$1")")
}

mkdir -p "$(dirname "$OUT")"
PAGE_ABS="$(abs_path "$PAGE")"
OUT_ABS="$(abs_path "$OUT")"

BROWSER=""
FAMILY=""
SEARCHED=()

# try_candidate <path-or-command>: resolve to an executable, set BROWSER/FAMILY.
try_candidate() {
  local c="$1" resolved=""
  [ -n "$c" ] || return 1
  SEARCHED+=("$c")
  if [ -f "$c" ] && [ -x "$c" ]; then
    resolved="$c"
  else
    resolved="$(command -v "$c" 2>/dev/null)" || return 1
  fi
  BROWSER="$resolved"
  case "$(basename "$resolved")" in
    [Ff]irefox*) FAMILY="firefox" ;;
    *)           FAMILY="chromium" ;;
  esac
  return 0
}

CHROMIUM_PATH_NAMES=(google-chrome google-chrome-stable chrome chromium chromium-browser \
  microsoft-edge microsoft-edge-stable msedge brave brave-browser vivaldi vivaldi-stable opera)

OS_CHROMIUM=()
OS_FIREFOX=()

if [ "$IS_WIN" = 1 ]; then
  _pf="$(printenv ProgramFiles 2>/dev/null || true)"
  _pfx="$(printenv 'ProgramFiles(x86)' 2>/dev/null || true)"
  _lad="$(printenv LOCALAPPDATA 2>/dev/null || true)"
  for _base in "$_pf" "$_pfx" "$_lad"; do
    [ -n "$_base" ] || continue
    _baseu="$(cygpath -u "$_base")"
    OS_CHROMIUM+=(
      "$_baseu/Google/Chrome/Application/chrome.exe"
      "$_baseu/Microsoft/Edge/Application/msedge.exe"
      "$_baseu/BraveSoftware/Brave-Browser/Application/brave.exe"
      "$_baseu/Chromium/Application/chrome.exe"
      "$_baseu/Vivaldi/Application/vivaldi.exe"
      "$_baseu/Programs/Opera/launcher.exe"
      "$_baseu/Opera/launcher.exe"
    )
    OS_FIREFOX+=("$_baseu/Mozilla Firefox/firefox.exe")
  done
elif [ "$UNAME_S" = "Darwin" ]; then
  for _base in /Applications "$HOME/Applications"; do
    OS_CHROMIUM+=(
      "$_base/Google Chrome.app/Contents/MacOS/Google Chrome"
      "$_base/Microsoft Edge.app/Contents/MacOS/Microsoft Edge"
      "$_base/Brave Browser.app/Contents/MacOS/Brave Browser"
      "$_base/Chromium.app/Contents/MacOS/Chromium"
      "$_base/Vivaldi.app/Contents/MacOS/Vivaldi"
      "$_base/Arc.app/Contents/MacOS/Arc"
      "$_base/Opera.app/Contents/MacOS/Opera"
    )
    OS_FIREFOX+=("$_base/Firefox.app/Contents/MacOS/firefox")
  done
fi

if [ -n "${HEADLESS_BROWSER:-}" ]; then
  try_candidate "$HEADLESS_BROWSER" || die "HEADLESS_BROWSER is set but not executable or on PATH: $HEADLESS_BROWSER"
else
  for _c in "${CHROMIUM_PATH_NAMES[@]}"; do try_candidate "$_c" && break; done
  if [ -z "$BROWSER" ]; then
    for _c in ${OS_CHROMIUM[@]+"${OS_CHROMIUM[@]}"}; do try_candidate "$_c" && break; done
  fi
  if [ -z "$BROWSER" ]; then try_candidate firefox || true; fi
  if [ -z "$BROWSER" ]; then
    for _c in ${OS_FIREFOX[@]+"${OS_FIREFOX[@]}"}; do try_candidate "$_c" && break; done
  fi
fi

if [ -z "$BROWSER" ]; then
  printf 'error: no usable browser found. Searched:\n' >&2
  for _s in ${SEARCHED[@]+"${SEARCHED[@]}"}; do printf '  - %s\n' "$_s" >&2; done
  printf 'Install any Chromium-based browser (Chrome, Edge, Brave, ...) or set HEADLESS_BROWSER to its path.\n' >&2
  exit 1
fi

URL="file://$PAGE_ABS"
if [ "$IS_WIN" = 1 ]; then
  _w="$(cygpath -w "$PAGE_ABS")"
  URL="file:///${_w//\\//}"
fi

TMPD="$(mktemp -d)"
trap 'rm -rf "$TMPD"' EXIT
BLOG="$TMPD/browser.log"

OUT_ARG="$OUT_ABS"
[ "$IS_WIN" = 1 ] && OUT_ARG="$(cygpath -w "$OUT_ABS")"

run_browser() {
  if ! "$@" >"$BLOG" 2>&1; then
    printf 'error: browser exited non-zero (%s). Last output:\n' "$BROWSER" >&2
    tail -n 5 "$BLOG" >&2 || true
    exit 1
  fi
}

if [ "$FAMILY" = "chromium" ]; then
  PROFILE_ARG="$TMPD/profile"
  mkdir -p "$PROFILE_ARG"
  [ "$IS_WIN" = 1 ] && PROFILE_ARG="$(cygpath -w "$PROFILE_ARG")"
  run_browser "$BROWSER" --headless --disable-gpu --hide-scrollbars --no-sandbox \
    --no-first-run --no-default-browser-check --disable-extensions \
    --user-data-dir="$PROFILE_ARG" \
    --window-size="$WIDTH,$HEIGHT" \
    --virtual-time-budget=5000 \
    --screenshot="$OUT_ARG" \
    "$URL"
else
  log "note: Firefox has no --virtual-time-budget; entrance animations may be captured mid-flight."
  FFPROFILE_ARG="$TMPD/ffprofile"
  [ "$IS_WIN" = 1 ] && FFPROFILE_ARG="$(cygpath -w "$FFPROFILE_ARG")"
  run_browser "$BROWSER" --headless -profile "$FFPROFILE_ARG" \
    --window-size="$WIDTH,$HEIGHT" \
    --screenshot "$OUT_ARG" \
    "$URL"
fi

[ -s "$OUT_ABS" ] || die "screenshot file was not created: $OUT_ABS"
log "screenshot saved: $OUT_ABS (browser: $(basename "$BROWSER"))"
