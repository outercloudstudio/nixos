import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.Controls

Scope {
    id: root
    
    property bool display: false
    property string searchText: ""
    property var items: [
        {
            label: "VS Code",
            command: "code"
        },
        {
            label: "Firefox",
            command: "firefox"
        },
        {
            label: "Obsidian",
            command: "obsidian"
        },
        {
            label: "Discord",
            command: "discord"
        },
        {
            label: "Claude",
            command: ["chromium","--app=https://claude.ai","--force-dark-mode"],
        },
        {
            label: "Kitty",
            command: "kitty"
        },
        {
            label: "Reboot",
            command: "reboot"
        },
        {
            label: "Audio",
            command: "pavucontrol"
        }
    ]

    FloatingWindow {
        id: panel

        color: "#111111"

        visible: display

        title: "QML Launcher"

        Timer {
            interval: 1000
            running: panel.visible

            onTriggered: {
                check.running = true
            }
        }

        Timer {
            id: check

            interval: 100
            running: false
            repeat: true
            onTriggered: {
                for(const workspace of Hyprland.workspaces.values) {
                    for(const toplevel of workspace.toplevels.values) {
                        if(toplevel.title !== 'org.quickshell') continue

                        if(toplevel.activated) continue

                        display = false
                        running = false
                    }
                }
            }
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 8
            spacing: 8

            TextField {
                id: search

                Layout.fillWidth: true

                implicitHeight: 40
                background: null

                onTextChanged: searchText = text

                Keys.onReturnPressed: {
                    const filteredActions = items.filter(item => item.label.toLowerCase().includes(searchText.toLowerCase()))
                    
                    if(filteredActions[0]) {
                        let process = Qt.createQmlObject('import Quickshell.Io; Process { }', parent);
                        process.command = typeof filteredActions[0].command === "string" ? [ filteredActions[0].command ] : filteredActions[0].command
                        process.running = true

                        display = false
                    }
                }

                color: "#ffffff"

                placeholderText: "Search..."
                placeholderTextColor: "#ffffff"

                font {
                    weight: 500
                    pixelSize: 16
                }

                padding: 8

                Rectangle {
                    anchors.fill: parent

                    color: "transparent"
                    radius: 4

                    border.color: "#1f1f1f"
                    border.width: 2
                }
            }

            ListView {
                id: listView
                
                model: items.filter(item => item.label.toLowerCase().includes(searchText.toLowerCase()))
                spacing: 8

                Layout.fillWidth: true
                Layout.fillHeight: true
                
                delegate: Rectangle {
                    width: listView.width
                    height: 40
                    color: "#171717"
                    radius: 4
                    
                    Text {
                        anchors {
                            left: parent.left
                            leftMargin: 8
                            verticalCenter: parent.verticalCenter
                        }

                        text: modelData.label
                        color: "#ffffff"

                        font {
                            weight: 500
                            pixelSize: 16
                        }
                    }
                    
                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            let process = Qt.createQmlObject('import Quickshell.Io; Process { }', parent);
                            process.command = typeof modelData.command === "string" ? [ modelData.command ] : modelData.command
                            process.running = true

                            display = false
                        }
                    }
                }
            }
        }
    }

    GlobalShortcut {
        name: "launch"
        description: qsTr("Opens App Launcher")

        onPressed: {        
            display = !display

            if(display) {
                search.forceActiveFocus()
                search.text = ""
            }
        }
    }
}
