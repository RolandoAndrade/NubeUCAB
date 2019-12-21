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


    ScrollView
    {
        id: scrollFiles
        spacing: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.topMargin: 125
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        ColumnLayout
        {
            anchors.fill: parent
            property int themargin: (mainWindow.width - parseInt((mainWindow.width)/300)*300 - 10*parseInt((mainWindow.width)/300))/2
            anchors.leftMargin: themargin
            anchors.rightMargin: themargin
            Layout.alignment: Qt.AlignCenter
            Rectangle
            {
                width: mainWindow.width
                height: 30
            }

            GridLayout
            {
                id: filesContainer
                property int themargin: (mainWindow.width - parseInt((mainWindow.width)/300)*300 - 10*parseInt((mainWindow.width)/300))/2
                columnSpacing: 10
                rowSpacing: 10
                columns: parseInt((mainWindow.width)/300)

                UIObjects.Folder
                {
                    name: "Carpeta 1"
                }
                UIObjects.Folder
                {
                    name: "Carpeta 2"
                }
                UIObjects.Folder
                {
                    name: "Carpeta 3"
                }
                UIObjects.Folder
                {
                    name: "Archivo.dat"
                    type: "document"
                }
                UIObjects.Folder
                {
                    name: "Datos"
                    type: "file"
                }
                UIObjects.Folder
                {
                    name: "Proyecto.docx"
                    type: "word"
                }
                UIObjects.Folder
                {
                    name: "Libro Pirata.pdf"
                    type: "pdf"
                }
                UIObjects.Folder
                {
                    name: "Meme.png"
                    type: "image"
                }
                UIObjects.Folder
                {
                    name: "Carbon.zip"
                    type: "zip"
                }
                UIObjects.Folder
                {
                    name: "Notas.csv"
                    type: "excel"
                }
                UIObjects.Folder
                {
                    name: "StarWarsIX.mp4"
                    type: "multimedia"
                }
                UIObjects.Folder
                {
                    name: "Pan que habla.dat"
                    type: "document"
                }
                UIObjects.Folder
                {
                    name: "Datos"
                    type: "file"
                }
                UIObjects.Folder
                {
                    name: "Proyecto.docx"
                    type: "word"
                }
                UIObjects.Folder
                {
                    name: "Libro Pirata.pdf"
                    type: "pdf"
                }
                UIObjects.Folder
                {
                    name: "Nudes.png"
                    type: "image"
                }
                UIObjects.Folder
                {
                    name: "Packs.rar"
                    type: "zip"
                }
                UIObjects.Folder
                {
                    name: "Notas.csv"
                    type: "excel"
                }
                UIObjects.Folder
                {
                    name: "StarWarsIX.mp4"
                    type: "multimedia"
                }
                UIObjects.Folder
                {
                    name: "StarWarsIX.mp4"
                    type: "multimedia"
                }


            }
            Rectangle
            {
                width: mainWindow.width
                height: 30
            }

        }


    }
}

