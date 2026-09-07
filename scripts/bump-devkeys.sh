#!/bin/bash
# Updates Casks/devkeys.rb to a new version + the commit SHA of its git tag.
# Usage: scripts/bump-devkeys.sh 1.1.0
set -euo pipefail

VERSION="${1:?usage: bump-devkeys.sh <version>}"
REPO="git@github.com:FagundesCristianoF/devkeys.git"
CASK="$(dirname "$0")/../Casks/devkeys.rb"

echo "==> Resolving commit for tag v$VERSION..."
SHA="$(git ls-remote "$REPO" "refs/tags/v$VERSION" | cut -f1)"
if [ -z "$SHA" ]; then
    echo "error: tag v$VERSION not found on $REPO (push it first with devkeys' scripts/release.sh)" >&2
    exit 1
fi

sed -i '' \
    -e "s/version \".*\"/version \"$VERSION\"/" \
    -e "s/revision: \".*\"/revision: \"$SHA\"/" \
    "$CASK"

echo "==> Updated $CASK to version $VERSION @ $SHA"
echo "==> Verify with: brew style --cask $CASK && brew audit --cask $CASK"
