import QtQuick
import Quickshell
import qs.Ui

BarIndicator {
  id: root

  active: false
  activeText: "󰢌"
  inactiveText: "󰢌"
  activeTooltipText: "Google Tasks"
  inactiveTooltipText: "Google Tasks"

  function openGoogleTasks() {
    Quickshell.execDetached(["omarchy-launch-or-focus-webapp", "Google Tasks", "https://tasks.google.com/"])
  }

  onPressed: function() {
    root.openGoogleTasks()
  }
}
