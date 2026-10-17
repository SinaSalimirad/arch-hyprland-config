import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris

PanelWindow {
    id: bar

    anchors {
        top: true
        left: true
        right: true
    }

    margins {
        top: 10
    }

    implicitHeight: 33
    color: "transparent"

    Poller {
        id: clock
        command: "date +%H:%M"
        interval: 1000
    }

    Poller {
        id: date
        command: "date '+%b %d'"
        interval: 60000
    }

    Poller {
        id: vol
        command: "wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf \"%d\", $2 * 100}'"
        interval: 500
    }

    

    Poller {
        id: bluetooth
        command: "bluetoothctl show | grep -q 'Powered: yes' && echo on || echo off"
        interval: 5000
    }

    Poller {
        id: net
        command: "nmcli -t -f NAME connection show --active | head -n1"
        interval: 5000
    }

    Poller {
        id: bat
        command: "cat /sys/class/power_supply/BAT0/capacity"
        interval: 30000
    }

    readonly property var player: Mpris.players.values.find(p => p.isPlaying) ?? Mpris.players.values[0] ?? null

    RowLayout {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 14
        spacing: 8

        Workspaces {}

        Pill {
            icon: "󰃭"
            label: date.value
        }

        Pill {
            icon: "󰝚"
            maxLabelWidth: 400
            label: bar.player
                ? (bar.player.trackArtist || "Unknown Artist") + " - " + (bar.player.trackTitle || "Unknown Title")
                : "Nothing playing"
        }
    }

    RowLayout {
        anchors.centerIn: parent
        spacing: 8

        Pill {
            icon: "󰥔"
            label: clock.value
        }
    }

    RowLayout {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 14
        spacing: 8

        Pill {
            icon: "󰕾"
            label: (vol.value || "0") + "%"
            iconColor: "#ffa478"
        }

        Pill {
            icon: "󰖩"
            label: net.value || "Disconnected"
            iconColor: "#ff6048"
            maxLabelWidth: 180
        }

        Pill {
            icon: "󰂯"
            label: bluetooth.value || "off"
            iconColor: "#5fc8d4"
        }

        Pill {
            icon: "󰁹"
            label: (bat.value || "0") + "%"
            iconColor: "#7ad9a8"
        }
    }
}