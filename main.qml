import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "components" as UIObjects

ApplicationWindow
{
    id: mainWindow
    width: 700
    height: 500
    title: qsTr('NubeUCAB')
    flags: Qt.Window | Qt.FramelessWindowHint
    x: screen.width / 2 - 700 / 2
    y: screen.height / 2 - 500 / 2
    property int previousX
    property int previousY
    property bool isMaximized: false
    visible: true

    UIObjects.Header
    {

    }

    UIObjects.HeaderBar
    {
        id: header
    }

    Pane
    {
        id: sidebar
        width: 200
        anchors.top: header.bottom
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        Material.background: Material.LightBlue
        z: 0
        layer.enabled: true
        layer.effect: DropShadow
        {

            anchors.fill: sidebar
            horizontalOffset: 1
            verticalOffset: 0
            radius: 10.0
            samples: 15
            color: "#80000000"
            source: sidebar
        }
    }

    GridLayout {
        id: gridLayout
        x: 200
        y: 150
        columns: 2
        width: 185
        height: 221
        Text
        {
            text: "Lorem ipsum sit ammet conquetur"
        }
        Text
        {
            text: "Lorem ipsum sit ammet conquetur"
        }
        Text
        {
            text: "Lorem ipsum sit ammet conquetur"
        }

        Text
        {
            text: "Lorem ipsum sit ammet conquetur"
        }
        Text
        {
            text: "Lorem ipsum sit ammet conquetur"
        }
        Text
        {
            text: "Lorem ipsum sit ammet conquetur"
        }







    }
}

