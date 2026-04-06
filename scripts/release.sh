#!/bin/zsh

set -euo pipefail

ROOT_DIR=$(cd -- "$(dirname "$0")/.." && pwd)
cd "$ROOT_DIR"

usage() {
  cat <<'EOF'
Usage:
  ./scripts/release.sh <tag> [--title "<title>"] [--notes-file <file>] [--draft] [--prerelease]

Behavior:
  - Reads assets from release/<tag>/*.zip
  - Creates the GitHub release if it does not exist
  - Uploads or overwrites all zip assets in that folder

Examples:
  ./scripts/release.sh 2026-04-06
  ./scripts/release.sh 2026-04-06 --title "fonts-TW 2026-04-06"
  ./scripts/release.sh 2026-04-06 --notes-file /tmp/release-notes.md
EOF
}

if [[ $# -eq 0 ]]; then
  usage
  exit 1
fi

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  usage
  exit 0
fi

TAG="$1"
shift

TITLE="fonts-TW $TAG"
NOTES_FILE=""
DRAFT=0
PRERELEASE=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --title)
      TITLE="$2"
      shift 2
      ;;
    --notes-file)
      NOTES_FILE="$2"
      shift 2
      ;;
    --draft)
      DRAFT=1
      shift
      ;;
    --prerelease)
      PRERELEASE=1
      shift
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

ASSET_DIR="$ROOT_DIR/release/$TAG"
if [[ ! -d "$ASSET_DIR" ]]; then
  echo "Missing release directory: $ASSET_DIR" >&2
  exit 1
fi

ZIP_FILES=("$ASSET_DIR"/*.zip(N))
if [[ ${#ZIP_FILES[@]} -eq 0 ]]; then
  echo "No zip assets found in: $ASSET_DIR" >&2
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI is required. Install it with: brew install gh" >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "GitHub CLI is not authenticated. Run: gh auth login" >&2
  exit 1
fi

REPO=$(git remote get-url origin | sed -E 's#^https://github.com/##; s#\.git$##')
if [[ -z "$REPO" ]]; then
  echo "Unable to determine GitHub repository from origin remote." >&2
  exit 1
fi

EXTRA_ARGS=()
if [[ -n "$NOTES_FILE" ]]; then
  if [[ ! -f "$NOTES_FILE" ]]; then
    echo "Notes file not found: $NOTES_FILE" >&2
    exit 1
  fi
  EXTRA_ARGS+=(--notes-file "$NOTES_FILE")
else
  DEFAULT_NOTES=$(cat <<'EOF'
用途

- 電子閱讀器或電子書 App 要使用：請下載 `*-ebook-<tag>.zip`
  適用 Kindle、BOOX、Meebook、Pubu、Kobo 等裝置或閱讀 App。解壓後請安裝裡面的 `.ttf` 字體檔。

- 偽直排閱讀要使用：請下載 `*-rotated90-<tag>.zip`
  這包是給需要 `Rotated90偽直排` 的使用情境，只旋轉 Han 漢字，不會把英文數字一起轉向。

- 網頁嵌入要使用：請下載 `*-webfont-<tag>.zip`
  內含 `.woff2` 與 `fonts.css`，適合網站、部落格或前端專案直接引用。

檔名怎麼看

- `888Roundhand-*`：888Roundhand圓體
- `888LXGW-*`：888LXGW文楷
- `888Cute-*`：888cute可愛體
- `888Zen-*`：888zen禪體
EOF
)
  DEFAULT_NOTES=${DEFAULT_NOTES//<tag>/$TAG}
  EXTRA_ARGS+=(--notes "$DEFAULT_NOTES")
fi

if [[ $DRAFT -eq 1 ]]; then
  EXTRA_ARGS+=(--draft)
fi

if [[ $PRERELEASE -eq 1 ]]; then
  EXTRA_ARGS+=(--prerelease)
fi

if gh release view "$TAG" --repo "$REPO" >/dev/null 2>&1; then
  echo "Updating existing release: $TAG"
  gh release upload "$TAG" "${ZIP_FILES[@]}" --repo "$REPO" --clobber
else
  echo "Creating release: $TAG"
  gh release create "$TAG" "${ZIP_FILES[@]}" --repo "$REPO" --title "$TITLE" "${EXTRA_ARGS[@]}"
fi

gh release view "$TAG" --repo "$REPO" --json url --jq '.url'
