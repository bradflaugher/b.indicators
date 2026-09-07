import QtQuick
import Quickshell

ToggleCommand {
  toggleCommand: "omarchy-toggle-idle"
  statusCommand: "omarchy-toggle-idle status"
  watchPath: Quickshell.env("HOME") + "/.local/state/omarchy/indicators"
  activeText: "󰅶"
  inactiveText: "󰅶"
  activeTooltipText: "Allow Idle Lock & Screensaver"
  inactiveTooltipText: "Stay Awake"
}
