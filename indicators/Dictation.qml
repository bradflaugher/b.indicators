import QtQuick
import Quickshell.Io
import qs.Ui

BarIndicator {
  id: root

  property string state: "idle"
  property string icon: ""

  active: state === "recording"
  activeText: icon
  inactiveText: "󰍬"
  activeTooltipText: "Recording — click to stop (or release F9)"
  inactiveTooltipText: "Dictate — click, hold F9, or Super+Ctrl+X"

  function update(raw) {
    var data = extractData(raw)

    state = String(data.alt || data.class || "idle")
    if (state === "recording") icon = "󰍬"
    else if (state === "transcribing") icon = "󰔟"
    else icon = ""
  }

  Process {
    command: ["bash", "-c", "omarchy-voxtype-status"]
    running: true
    stdout: SplitParser {
      onRead: function(data) { root.update(data) }
    }
  }

  Process {
    id: toggleProc
    command: ["voxtype", "record", "toggle"]
  }

  onPressed: function() {
    if (toggleProc.running) toggleProc.running = false
    toggleProc.running = true
  }
}
