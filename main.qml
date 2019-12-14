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
    x: screen.width / 2 - 700 / 2
    y: screen.height / 2 - 500 / 2
    property int previousX
    property int previousY
    visible: true


    Rectangle
    {
        width: parent.width
        height: 25
        color: Material.color(Material.Blue)


        anchors.top: parent.top

        Text
        {
            anchors.verticalCenter: parent.verticalCenter
            leftPadding: 8
            text: mainWindow.title
            font.weight: Font.Bold
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            renderType: Text.NativeRendering
            fontSizeMode: Text.HorizontalFit
            textFormat: Text.AutoText
            width: parent.width
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
    Rectangle
    {
        y: 25
        width: parent.width
        height: 100
        color: Material.color(Material.LightBlue)
    }
}
