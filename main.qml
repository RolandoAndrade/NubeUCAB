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
        z: 20
        Flow {
            id: flow1
            spacing: 5
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 200
            UIObjects.PathLabels
            {
                path: "Rolando Andrade"
            }
            UIObjects.PathLabels
            {
               path: "Archivos"
            }
            UIObjects.PathLabels
            {
                path: "Mis documentos"
            }
            UIObjects.PathLabels
            {
                path: "Prueba"
            }
        }
    }
    UIObjects.SideBar
    {
        id: drawer
    }

    Component.onCompleted:
    {
        for(var i=0;i<20;i++)
        {
            filesContainer.model.append({nombre: "Carpeta 1"})
        }
    }



    GridView
    {
        id: filesContainer
        property int themargin: (mainWindow.width - parseInt((mainWindow.width)/320)*320)/2
        Layout.alignment: Qt.AlignCenter
        anchors.fill: parent
        anchors.topMargin: 125
        anchors.leftMargin: themargin
        cellWidth: 320
        cellHeight: 70
        clip: true
        header: Rectangle{
            height:30
            width: parent.width
        }

        ScrollBar.vertical: ScrollBar {}

        model: ListModel{}
        delegate: UIObjects.Folder{
            name: nombre
        }


    }

}

