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

    Rectangle
    {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.topMargin: 125
        anchors.leftMargin: 200
        anchors.rightMargin: 0
        ScrollView
        {
            anchors.fill: parent
            GridLayout
            {
                anchors.fill: parent
                columns: parseInt((mainWindow.width - 300)/200)
                anchors.rightMargin: 30
                anchors.leftMargin: 30
                anchors.topMargin: 30
                UIObjects.Folder
                {
                    nombre: "Carpeta 1"
                }
                UIObjects.Folder
                {
                    nombre: "Carpeta 2"
                }
                UIObjects.Folder
                {

                }
                UIObjects.Folder
                {

                }
                UIObjects.Folder
                {

                }
                UIObjects.Folder
                {

                }
                UIObjects.Folder
                {

                }
                UIObjects.Folder
                {

                }
                UIObjects.Folder
                {

                }
                UIObjects.Folder
                {

                }
                UIObjects.Folder
                {

                }
                UIObjects.Folder
                {

                }
                UIObjects.Folder
                {

                }
                UIObjects.Folder
                {

                }
                UIObjects.Folder
                {

                }
                UIObjects.Folder
                {

                }
                UIObjects.Folder
                {

                }
            }
        }


    }


}

