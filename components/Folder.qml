import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

Rectangle
{
    property string name
    property string type: "folder"

    id: folderCard
    FontLoader
    {
        id: fontname
        source: "qrc:///fonts/font.ttf"
        name: "FontAwesome"
    }
    color: "#fff"
    width: 300

    height: 50
    radius: 5
    border.color: "#eee"
    z: 5


    Text
    {
        id: icono
        color: Material.color(Material.Grey)
        text: {
            if(parent.type == "folder")
            {
                return "\uf07b";
            }
            else if(parent.type == "document")
            {
                icono.color = Material.color(Material.BlueGrey)
                return "\uf15c";
            }
            else if(parent.type == "file")
            {
                icono.color = Material.color(Material.Grey,Material.Shade600)
                return "\uf15b";
            }
            else if(parent.type == "zip")
            {
                icono.color = Material.color(Material.Cyan)
                return "\uf1c6";
            }
            else if(parent.type == "image")
            {
                icono.color = Material.color(Material.Orange)
                return "\uf1c5";
            }
            else if(parent.type == "pdf")
            {
                icono.color = Material.color(Material.Red)
                return "\uf1c1";
            }
            else if(parent.type == "word")
            {
                icono.color = Material.color(Material.LightBlue)
                return "\uf1c2";
            }
            else if(parent.type == "excel")
            {
                icono.color = Material.color(Material.Green)
                return "\uf1c3";
            }
            else if(parent.type == "multimedia")
            {
                icono.color = Material.color(Material.DeepPurple)
                return "\uf1c8";
            }
        }

        font.pointSize: 30
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 10
    }

    Text
    {
        id: nombre
        color: Material.color(Material.Grey)
        text: parent.name?parent.name:"Lorem ipsum sit ammet conquetur sit ammet";
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        font.pointSize: 10
        anchors.fill: parent
        anchors.leftMargin: 50
    }

    Drag.active: dropFile.drag.active
    Drag.hotSpot.x: width/2
    Drag.hotSpot.y: height/2

    MouseArea
    {
        id: dropFile
        anchors.fill: parent
        drag.target: parent
        hoverEnabled: true

        onHoveredChanged:
        {
            if(dropFile.containsMouse)
            {
                folderCard.opacity = 0.8
                folderCard.border.color = "#ccc"
            }
            else
            {
                folderCard.opacity = 1
                folderCard.border.color = "#eee"
            }


        }


        drag.onActiveChanged:
        {

            if(dropFile.drag.active)
            {
                dropArea.startx = folderCard.x
                dropArea.starty = folderCard.y
                filesContainer.fromIndex = index;
            }

            else
            {
                dropArea.endx = dropArea.drag.x
                dropArea.endy = dropArea.drag.y
                folderCard.x = dropArea.startx
                folderCard.y = dropArea.starty
            }
            folderCard.Drag.drop();
        }

        onEntered:
        {

        }


        onClicked:
        {
            if(folderCard.type === "folder")
            {
                return;
            }
            else
            {
                drawer.fileIcon = icono.text
                drawer.fileName = parent.name
                drawer.fileColor = icono.color
                drawer.open();
            }
        }

        onPressed:
        {
            folderCard.z = 15
            folderCard.opacity = 0.5
        }

        onReleased:
        {
            folderCard.z = 5
            folderCard.opacity = 1
        }
    }

    MouseArea
    {
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        onClicked:
        {
            drawer.fileIcon = icono.text
            drawer.fileName = parent.name
            drawer.fileColor = icono.color
            drawer.open();
        }

    }


}
