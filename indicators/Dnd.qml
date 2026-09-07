import QtQuick
import Quickshell

ToggleCommand {
  toggleCommand: "omarchy-toggle-notification-silencing"
  statusCommand: "omarchy-shell notifications dndState"
  watchPath: Quickshell.env("HOME") + "/.local/state/omarchy/notifications.json"
  watchReadsFile: true
  activeText: "󰂛"
  inactiveText: "󰂛"
  activeTooltipText: "Allow Notifications"
  inactiveTooltipText: "Silence Notifications"
}
