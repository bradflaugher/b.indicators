import QtQuick
import Quickshell
import Quickshell.Io
import qs.Ui

// Shared click/status path for cloned indicators. Third-party bar-widgets do
// not receive first-party service proxies, so actions go through public
// commands the same way Screenshot and Reminder do.
BarIndicator {
  id: root

  property string toggleCommand: ""
  property string statusCommand: ""
  property string watchPath: ""
  property bool watchReadsFile: false
  property int statusInterval: 0
  property int statusRetryMs: 400
  property bool on: false

  active: on

  function refresh() {
    if (!statusCommand || statusProc.running) return
    statusProc.running = true
  }

  function applyStatus(raw) {
    var data = extractData(raw)
    if (data.dnd === true || data.dnd === false) {
      root.on = data.dnd === true
      return
    }
    if (data.enabled === true || data.enabled === false) {
      root.on = data.enabled === true
      return
    }
    var state = String(raw || "").trim().toLowerCase()
    if (state === "on" || state === "yes" || state === "true") root.on = true
    else if (state === "off" || state === "no" || state === "false") root.on = false
  }

  function toggle() {
    if (!toggleCommand) return
    Quickshell.execDetached(["bash", "-lc", toggleCommand])
    statusRetry.interval = Math.max(0, root.statusRetryMs)
    statusRetry.restart()
  }

  Component.onCompleted: refresh()
  onBarChanged: refresh()

  Connections {
    target: root.indicatorHost
    ignoreUnknownSignals: true
    function onRefreshRequested() { root.refresh() }
  }

  Timer {
    id: statusRetry
    interval: 400
    repeat: false
    onTriggered: root.refresh()
  }

  Timer {
    interval: Math.max(0, root.statusInterval)
    running: root.statusInterval > 0
    repeat: true
    onTriggered: root.refresh()
  }

  Process {
    id: statusProc
    command: ["bash", "-lc", root.statusCommand]
    stdout: StdioCollector {
      waitForEnd: true
      onStreamFinished: root.applyStatus(text)
    }
  }

  FileView {
    path: root.watchPath
    watchChanges: root.watchPath !== ""
    printErrors: false
    onLoaded: if (root.watchReadsFile) root.applyStatus(text())
    onFileChanged: {
      if (!root.watchPath) return
      if (root.watchReadsFile) reload()
      else root.refresh()
    }
  }

  onPressed: function() { root.toggle() }
}
