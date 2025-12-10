import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Services.UPower

Scope {
    id: root
    
    property string time

    Variants {
        model: Quickshell.screens
        
        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 25

            color: "transparent"

            aboveWindows: false
            
            Rectangle {
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                height: 1
                color: "#2C2C2C"
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
                    bottomMargin: 4
                }

                height: 24

                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Text {
                        text: Notifications.values.length > 0 ? Notifications.values[Notifications.values.length - 1] : "Nothing Yet"
                        color: Notifications.values.length > 0 ? "white" : "#2C2C2C"

                        width: parent.width
                        
                        elide: Text.ElideRight

                        font {
                            weight: 500
                            pixelSize: 12
                            family: "JetBrains Mono"
                        }
                    }
                }

                Item {
                    Layout.fillHeight: true
                    Layout.preferredWidth: childrenRect.width

                    Text {
                        text: "|"
                        color: "#2C2C2C"

                        font {
                            weight: 500
                            pixelSize: 12
                            family: "JetBrains Mono"
                        }
                    }
                }

                Repeater {
                    model: Hyprland.workspaces.values.length

                    Item {
                        Layout.fillHeight: true
                        Layout.preferredWidth: childrenRect.width

                        Text {
                            text: Hyprland.workspaces.values[index].id
                            color: Hyprland.focusedWorkspace.id === Hyprland.workspaces.values[index].id ? "white" : "#2C2C2C"

                            font {
                                weight: 500
                                pixelSize: 12
                                family: "JetBrains Mono"
                            }
                        }
                    }
                }

                Item {
                    Layout.fillHeight: true
                    Layout.preferredWidth: childrenRect.width

                    Text {
                        text: "|"
                        color: "#2C2C2C"

                        font {
                            weight: 500
                            pixelSize: 12
                            family: "JetBrains Mono"
                        }
                    }
                }

                Item {
                    Layout.fillHeight: true
                    Layout.preferredWidth: childrenRect.width

                    Text {
                        text: `${Math.round(UPower.devices.values.find(device => device.type === UPowerDeviceType.Battery).percentage * 100)}%`
                        color: "white"

                        font {
                            weight: 500
                            pixelSize: 12
                            family: "JetBrains Mono"
                        }
                    }
                }

                Item {
                    Layout.fillHeight: true
                    Layout.preferredWidth: childrenRect.width

                    Text {
                        text: "|"
                        color: "#2C2C2C"

                        font {
                            weight: 500
                            pixelSize: 12
                            family: "JetBrains Mono"
                        }
                    }
                }

                Item {
                    Layout.fillHeight: true
                    Layout.preferredWidth: childrenRect.width

                    Text {
                        text: root.time
                        color: "white"

                        font {
                            weight: 500
                            pixelSize: 12
                            family: "JetBrains Mono"
                        }
                    }
                }
            }
        }
    }
 
    Process {
        id: clockProcess
        command: ["date", "+%a %e, %l:%M"]
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
}