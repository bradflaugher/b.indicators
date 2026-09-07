#!/usr/bin/env bash
set -euo pipefail

root=$(cd "$(dirname "$0")" && pwd)
dest="${XDG_CONFIG_HOME:-$HOME/.config}/omarchy/plugins/b.indicators"

"$root/scripts/check.sh"

mkdir -p "$dest"
rsync -a --delete --exclude '.git' --exclude '.git/' "$root/" "$dest/"

# Hot-reload is not enough for Loader-cached indicator QML. Restart the shell
# so the deployed files are what the bar actually runs. A locked session
# refuses that restart; rescan instead and tell the caller to restart later.
if omarchy restart shell; then
  exit 0
fi

echo "shell restart skipped; rescanning plugins instead" >&2
omarchy-shell shell rescanPlugins
echo "run \`omarchy restart shell\` after unlocking so Loader-cached QML is dropped" >&2
