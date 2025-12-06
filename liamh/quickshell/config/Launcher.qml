import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.Controls
import "fuse.basic.js" as FuseModule

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
            command: ["sh", "-c", "nohup firefox </dev/null >/dev/null 2>&1 & disown"]
        },
        {
            label: "Obsidian",
            command: ["sh", "-c", "nohup obsidian </dev/null >/dev/null 2>&1 & disown"]
        },
        {
            label: "Discord",
            command: ["sh", "-c", "nohup discord </dev/null >/dev/null 2>&1 & disown"]
        },
        {
            label: "Claude",
            command: ["sh", "-c", "nohup chromium --app=https://claude.ai --force-dark-mode </dev/null >/dev/null 2>&1 & disown"],
        },
        {
            label: "Kitty",
            command: ["sh", "-c", "nohup kitty </dev/null >/dev/null 2>&1 & disown"]
        },
        {
            label: "Reboot",
            command: "reboot"
        },
        {
            label: "Audio",
            command: "pavucontrol"
        },
        {
            label: "Rnote",
            command: ["sh", "-c", "nohup rnote </dev/null >/dev/null 2>&1 & disown"]
        },
        {
            label: "Krita",
            command: ["sh", "-c", "nohup krita </dev/null >/dev/null 2>&1 & disown"]
        },
        {
            label: "Blender",
            command: ["sh", "-c", "nohup blender </dev/null >/dev/null 2>&1 & disown"]
        },
        {
            label: "Bluetooth",
            command: ["sh", "-c", "nohup blueman-manager </dev/null >/dev/null 2>&1 & disown"]
        }
    ]

    readonly property var fuse: new FuseModule.Fuse(items, { keys: ['label'], includeScore: true })

    FloatingWindow {
        id: panel

        color: "black"

        Rectangle {
            anchors.fill: parent

            color: "transparent"

            border {
                color: "#2C2C2C"
                width: 1
            }
        }

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
            anchors.margins: 24
            spacing: 16

            TextField {
                id: search

                Layout.fillWidth: true

                implicitHeight: 64
                background: null

                onTextChanged: searchText = text

                Keys.onReturnPressed: {
                    const search = fuse.search(searchText).filter(search => search.score <= 0.3)

                    if(search[0]) {
                        const action = search[0].item

                        let process = Qt.createQmlObject('import Quickshell.Io; Process { }', parent);
                        process.command = typeof action.command === "string" ? [ action.command ] : action.command
                        process.running = true

                        display = false
                    }
                }

                Keys.onEscapePressed: {
                    display = false
                }

                color: "#ffffff"

                placeholderText: "Let's Go..."
                placeholderTextColor: "#2C2C2C"

                font {
                    weight: 500
                    pixelSize: 16
                    family: "JetBrains Mono"
                }

                padding: 24
                topPadding: 26
                bottomPadding: 22
                leftPadding: 40

                Rectangle {
                    anchors.fill: parent

                    color: "transparent"

                    border.color: "#2C2C2C"
                    border.width: 1
                }

                Text {
                    anchors {
                        left: parent.left
                        leftMargin: 24
                        verticalCenter: parent.verticalCenter
                    }
                    
                    text: ">"
                    color: "white"
                    
                    font {
                        weight: 500
                        pixelSize: 16
                        family: "JetBrains Mono"
                    }
                }
            }

            ListView {
                id: listView
                
                model: fuse.search(searchText).filter(search => search.score <= 0.3).length === 0 ? items : fuse.search(searchText).filter(search => search.score <= 0.3).map(item => item.item)
                spacing: 8

                Layout.fillWidth: true
                Layout.fillHeight: true

                clip: true
                
                delegate: Rectangle {
                    width: listView.width
                    height: 40
                    color: "transparent"
                    
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
                            family: "JetBrains Mono"
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
