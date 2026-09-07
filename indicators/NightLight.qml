import QtQuick

ToggleCommand {
  toggleCommand: "omarchy-toggle-nightlight"
  statusCommand: "omarchy-toggle-nightlight --status"
  statusInterval: 2000
  statusRetryMs: 1500
  activeText: "󰔎"
  inactiveText: "󰔎"
  activeTooltipText: "Day Light"
  inactiveTooltipText: "Night Light"
}
