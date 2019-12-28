import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import QtQml.Models 2.3

import "components" as UIObjects

import com.nubeucab.clientmanager 1.0

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
                cdRoute: cd
            }
        }

    }
    UIObjects.SideBar
    {
        id: drawer
    }

    Component.onCompleted:
    {
        clientManager.startUrl();
        clientManager.retrieveFiles();
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


    UIObjects.RadiusButton
    {
        id: backButton
        property string route;
        icon: "\uf060"
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        visible: false

        function select()
        {
            clientManager.cdRoute(route);
            headerLabels.model.remove(headerLabels.model.count-1);
        }

        SequentialAnimation
        {
            running: backButton.visible
            NumberAnimation { target: backButton; property: "scale"; from:0; to: 1.2; duration: 100}
            NumberAnimation { target: backButton; property: "scale"; to: 0.8; duration: 100}
            NumberAnimation { target: backButton; property: "scale"; to: 1.0; duration: 100}
        }
    }

    Rectangle
    {
        visible: clientManager.isLoading
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 25
        anchors.top: parent.top
        z: 50
        color: "#b3ffffff"
        BusyIndicator
        {

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            running: true;
            z: 50
            Material.accent: Material.Blue
        }
        MouseArea
        {
            anchors.fill: parent
        }
    }



    ClientManager
    {
        id: clientManager
        property string primaryRoute;
        property string originalRoute;

        function startUrl()
        {
            var a = clientManager.getActualDir();
            primaryRoute = a.substr(0,a.lastIndexOf("\""));
            originalRoute = primaryRoute;
            a = a.substr(a.lastIndexOf("/")+1,a.lastIndexOf("\"")-a.lastIndexOf("/")-1);
            headerLabels.model.append({patha: a, cd: primaryRoute});
        }

        function retrieveFiles()
        {
            filesContainer.model.clear();
            var a = clientManager.getFiles();
            for(var i = 0;i<a.length;i++)
            {
                filesContainer.model.append(a[i])
            }
        }

        function cdRoute(route)
        {
            clientManager.enterToFolder(route);
            primaryRoute = route;
            backButton.route = route.substr(0,route.lastIndexOf("/"));
            backButton.visible = backButton.route.length>=originalRoute.length;
            clientManager.retrieveFiles();
        }

        function cdFolder(folder)
        {
            clientManager.enterToFolder(folder);
            backButton.route = primaryRoute;
            backButton.visible = true;
            primaryRoute+="/"+folder;
            headerLabels.model.append({patha: folder, cd: primaryRoute});
            clientManager.retrieveFiles();
        }
    }



}

