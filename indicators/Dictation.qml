import QtQuick
import Quickshell.Io
import qs.Ui

BarIndicator {
  id: root

  property string state: "idle"
  property string icon: ""

  active: state === "recording" || state === "transcribing"
  activeText: icon
  inactiveText: "\U000f036c"
  activeTooltipText: state === "transcribing" ? "Transcribing" : "Recording — click to stop"
  inactiveTooltipText: "Dictate · click to start · right-click settings"

  function update(raw) {
    var data = extractData(raw)

    state = String(data.alt || data.class || "idle")
    if (state === "recording") icon = "\U000f036c"
    else if (state === "transcribing") icon = "\U000f051f"
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

  onPressed: function(button) {
    if (button === Qt.RightButton) {
      if (root.bar) root.bar.run("omarchy-voxtype-config")
      return
    }
    if (toggleProc.running) toggleProc.running = false
    toggleProc.running = true
  }
}
