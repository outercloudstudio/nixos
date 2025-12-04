pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

Singleton {
    id: root
    
    property var values: []

    NotificationServer {
        id: server

        keepOnReload: false
        actionsSupported: true
        bodyHyperlinksSupported: true
        bodyImagesSupported: true
        bodyMarkupSupported: true
        imageSupported: true
        persistenceSupported: true

        Component.onCompleted: {
            console.log("NotificationServer created and ready")
        }

        onNotification: notification => {
            console.log(JSON.stringify(notification))

            values = [...values, `${notification.summary}: ${notification.body}`]

            console.log(JSON.stringify(values))
        }
    }
}