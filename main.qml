import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

ApplicationWindow
{
    id: mainWindow
    width: 700
    height: 500
    title: qsTr('NubeUCAB')
    flags: Qt.Window | Qt.FramelessWindowHint
    property int previousX
    property int previousY
    visible: true
    x: Screen.width / 2 - width / 2
    y: Screen.height / 2 - height / 2

    Rectangle
    {
        width: parent.width
        height: 25
        color: "#2196F3"


        anchors.top: parent.top

        Text
        {
            anchors.verticalCenter: parent.verticalCenter
            leftPadding: 8
            text: mainWindow.title
            color: "white"
        }

        MouseArea
        {
            anchors.fill: parent

            onPressed:
            {
                previousX = mouseX
                previousY = mouseY
            }

            onMouseXChanged:
            {
                var dx = mouseX - previousX
                mainWindow.setX(mainWindow.x + dx)
            }

            onMouseYChanged:
            {
                var dy = mouseY - previousY
                mainWindow.setY(mainWindow.y + dy)
            }

        }

    }

    MouseArea
    {
        width: 5

        anchors
        {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        cursorShape: Qt.SizeHorCursor

        onPressed: previousX = mouseX

        onMouseXChanged:
        {
            var dx = mouseX - previousX
            mainWindow.setWidth(parent.width + dx)
        }

    }

    MouseArea
    {
        height: 5
        anchors
        {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        cursorShape: Qt.SizeVerCursor

        onPressed: previousY = mouseY

        onMouseYChanged:
        {
            var dy = mouseY - previousY
            mainWindow.setY(mainWindow.y + dy)
            mainWindow.setHeight(mainWindow.height - dy)

        }
    }
}
