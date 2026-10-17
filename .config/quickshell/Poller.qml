import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root

    property string command: ""
    property int interval: 3000
    property string value: ""

    Process {
        id: proc
        command: ["sh", "-c", root.command]

        stdout: StdioCollector {
            onStreamFinished: root.value = this.text.trim()
        }

        onExited: {
            if (root.pending)
                root.refresh()
        }
    }

    property bool pending: false

    function refresh() {
        if (root.command === "")
            return

        if (proc.running) {
            root.pending = true
            return
        }

        root.pending = false
        proc.running = true
    }

    Component.onCompleted: refresh()

    Timer {
        interval: root.interval
        running: true
        repeat: true
        onTriggered: root.refresh()
    }
}