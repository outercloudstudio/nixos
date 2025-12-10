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
    
    property string searchText: ""

    Variants {
        model: Quickshell.screens
        
        PanelWindow {
            required property var modelData
            screen: modelData

            aboveWindows: false

            implicitWidth: 800
            implicitHeight: 400

            color: "transparent"

            Text {
                id: mainText

                anchors.centerIn: parent
                anchors.verticalCenterOffset: -60

                text: "Welcome Back Liam"

                color: "white"

                font {
                    weight: 500
                    pixelSize: 32
                    family: "JetBrains Mono"
                }
            }

            Text {
                id: subText
                
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 0

                text: "What shall we do today?"

                color: "white"

                font {
                    weight: 500
                    pixelSize: 16
                    family: "JetBrains Mono"
                }
            }

            Timer {
                interval: 10000
                running: true
                repeat: true
                onTriggered: {
                    const mainTexts = ["Welcome Back Liam!", "Hewoo!", "Hoi!", "Great to see you again!"]
                    const subTexts = ["What shall we do today?", "For the love of the game", "Thanks for playing", "What do you want to be when you grow up?", "I want to be kind", "Despite everything, it's still you", "What kind of universe will you make?", "Today you change the world."]

                    mainText.text = mainTexts[Math.floor(Math.random() * mainTexts.length)]
                    subText.text = subTexts[Math.floor(Math.random() * subTexts.length)]
                }
            }

            Component.onCompleted: {
                const mainTexts = ["Welcome Back Liam!", "Hewoo Liam!", "Hoi!", "Great to see you again Liam!"]
                const subTexts = ["What shall we do today?", "For the love of the game", "Thanks for playing", "What do you want to be when you grow up?", "I want to be kind", "Despite everything, it's still you", "What kind of universe will you make?", "Today you change the world."]

                mainText.text = mainTexts[Math.floor(Math.random() * mainTexts.length)]
                subText.text = subTexts[Math.floor(Math.random() * subTexts.length)]
            }
        }
    }
}