#!/usr/bin/env bash
set -euo pipefail

root=$(cd "$(dirname "$0")/.." && pwd)

if grep -RIn --include='*.qml' 'firstPartyServiceFor' "$root/indicators"; then
  echo "error: cloned bar-widgets must not call firstPartyServiceFor" >&2
  echo "use ToggleCommand / Quickshell.execDetached / bar.run instead" >&2
  exit 1
fi

if ! grep -q 'ToggleCommand' "$root/indicators/StayAwake.qml" \
  || ! grep -q 'ToggleCommand' "$root/indicators/NightLight.qml" \
  || ! grep -q 'ToggleCommand' "$root/indicators/Dnd.qml"; then
  echo "error: StayAwake, NightLight, and Dnd must use ToggleCommand" >&2
  exit 1
fi

omarchy plugin validate "$root"
echo "ok"
