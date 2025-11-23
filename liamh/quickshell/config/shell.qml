import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

Scope {
    id: root
    
    property string time

    Variants {
        model: Quickshell.screens
        
        PanelWindow {
            required property var modelData
            screen: modelData

            property HyprlandMonitor monitor: Hyprland.monitorFor(modelData)
            property list<HyprlandWorkspace> workspacesForMonitor: Hyprland.workspaces.values.filter(workspace => workspace.monitor && workspace.monitor.name === monitor.name)
            property bool fullscreen: workspacesForMonitor.some(workspace => workspace.toplevels.values.length === 1 && workspace.active)
            
            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 64

            color: "transparent"

            aboveWindows: false
            
            Rectangle {
                anchors {
                    fill: parent
                }

                color: "#cc111111"

                layer.enabled: true
                layer.effect: MultiEffect {
                    maskSource: mask
                    maskEnabled: true
                    maskInverted: true
                    maskThresholdMin: 0.5
                    maskSpreadAtMin: 1
                }

                RowLayout {
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: parent.top
                        bottom: parent.bottom

                        leftMargin: 4
                        rightMargin: 4
                        topMargin: 4
                        bottomMargin: 48
                    }

                    // Rectangle {
                    //     anchors.top: parent.top
                    //     anchors.bottom: parent.bottom

                    //     Item {
                    //         anchors.fill: parent

                    //         Repeater {
                    //             model: CavaService.values.length

                    //             Rectangle {
                    //                 x: index * 8
                    //                 width: 5
                    //                 height: CavaService.values[index] * parent.height
                    //                 y: parent.height - height
                    //                 color: "white"
                    //             }
                    //         }
                    //     }
                    // }

                    Item {
                        Layout.fillWidth: true
                    }

                    Text {
                        text: root.time
                        color: "white"

                        font {
                            weight: 500
                            pixelSize: 12
                        }
                    }
                }
            }

            Item {
                id: mask

                anchors.fill: parent

                layer.enabled: true

                visible: false

                Rectangle {
                    anchors {
                        fill: parent
                        topMargin: 24
                    }

                    topLeftRadius: fullscreen ? 0 : 14
                    topRightRadius: fullscreen ? 0 : 14

                    Behavior on topLeftRadius {
                        NumberAnimation {
                            duration: 200;
                            easing.type: Easing.InOutQuad
                        }
                    }

                    Behavior on topRightRadius {
                        NumberAnimation {
                            duration: 200;
                            easing.type: Easing.InOutQuad
                        }
                    }
                }
            }

            margins {
                bottom: -40
            }
        }
    }

    // PanelWindow {
    //     id: notificationPanel

    //     property var notifications: [ ]

    //     Repeater {
    //         model: notificationPanel.notifications.length

    //         Text {
    //             text: index + notificationPanel.notifications[index].body
    //         }
    //     }
    // }

    // NotificationServer {
    //     onNotification: (notification) => {
    //         notification.tracked = true

    //         console.log(notification)

    //         notifications.push(notification)
    //     }
    // }
 
    Process {
        id: clockProcess
        command: ["date", "+%l:%M"]
        running: true
        
        stdout: StdioCollector {
            onStreamFinished: root.time = text
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clockProcess.running = true
    }

    Launcher {}
}
