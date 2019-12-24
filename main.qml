import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import QtQml.Models 2.3

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

        ListView {
            id: headerLabels
            orientation: ListView.Horizontal
            spacing: 5
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 200
            anchors.bottomMargin: 25
            anchors.right: parent.right
            anchors.rightMargin: 0

            model: ListModel
            {

            }
            delegate: UIObjects.PathLabels
            {
                path: patha
            }
        }

    }
    UIObjects.SideBar
    {
        id: drawer
    }

    Component.onCompleted:
    {
        var items =[{thename: "Carpeta 1", thetype: "folder"},{thename: "Carpeta 2", thetype: "folder"},{thename: "Carpeta 3", thetype: "folder"},
                {thename: "Texto.txt", thetype: "document"},{thename: "Archivo", thetype: "file"},
                {thename: "Señorita Merino", thetype: "zip"},{thename: "meme.png", thetype: "image"},{thename: "Libro pirata.pdf", thetype: "pdf"},
                {thename: "Proyecto.docx", thetype: "word"},{thename: "dataset.csv", thetype: "excel"}, {thename: "StarWarsIX.mp4", thetype: "multimedia"}]
        for(var i=0;i<items.length;i++)
        {
            filesContainer.model.append(items[i])
        }

        items = [{patha: "Rolando Andrade"},{patha: "Archivos"}, {patha: "Mis documentos"},{patha: "Prueba"}]
        for(var i=0;i<items.length;i++)
        {
            headerLabels.model.append(items[i])
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
        header: Rectangle{
            height:30
            width: parent.width
            color: "transparent"
        }

        ScrollBar.vertical: ScrollBar
        {
            width: 5
        }

        model: ListModel{
            id: listModel
        }
        delegate: UIObjects.Folder{
            name: thename
            type: thetype
        }

        property int fromIndex: -1
        property int toIndex: -1

        DropArea
        {
            id: dropArea
            anchors.fill: parent
            property int startx
            property int starty
            property int endx
            property int endy

            onDropped:
            {

                var ax = listModel.get(filesContainer.fromIndex);
                var card = {};
                for(var k in ax)
                {
                    card[k]=ax[k];
                }

                filesContainer.toIndex = filesContainer.indexAt(dropArea.endx, dropArea.endy);
                var itema = listModel.get(filesContainer.toIndex);
                if(filesContainer.fromIndex!=filesContainer.toIndex)
                {
                    listModel.remove(filesContainer.fromIndex);
                    listModel.insert(filesContainer.toIndex,card);
                }
                filesContainer.fromIndex = -1;
                filesContainer.toIndex = -1;
            }


        }

    }

   UIObjects.FileBrowser
   {
       id: fileBrowser
   }

    UIObjects.RadiusButton
    {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 20
        anchors.bottomMargin: 20

        function select()
        {
            fileBrowser.open()
        }
    }



}

