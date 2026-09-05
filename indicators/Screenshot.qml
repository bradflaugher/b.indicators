import QtQuick
import qs.Ui

BarIndicator {
  id: root

  active: false
  activeText: "\uf030"
  inactiveText: "\uf030"
  activeTooltipText: "Screenshot"
  inactiveTooltipText: "Screenshot"

  onPressed: function(mouseButton) {
    if (!root.bar) return
    if (mouseButton === Qt.RightButton)
      root.bar.run("omarchy-menu toggle trigger.capture")
    else
      root.bar.run("omarchy-capture-screenshot")
  }
}
