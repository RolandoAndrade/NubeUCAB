import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "components" as UIObjects

ApplicationWindow
{
    id: mainWindow
    width: 400
    height: 400
    title: qsTr('NubeUCAB')
    flags: Qt.Window | Qt.FramelessWindowHint
    x: screen.width / 2 - 400 / 2
    y: screen.height / 2 - 400 / 2
    property int previousX
    property int previousY
    property bool isMaximized: false
    visible: true
    Material.accent: "#fff"
    color: Material.color(Material.LightBlue)
    UIObjects.Header
    {
        showMaximize: false
    }

    ColumnLayout
    {
        width: 250
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 30

        TextField
        {
            Layout.fillWidth: true
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            background: null
            selectByMouse: true
            placeholderText: "Nombre"
            selectionColor: Material.color(Material.Blue, Material.Shade300)

            Rectangle
            {
                anchors.fill: parent
                border.color: parent.focus?"white":Material.color(Material.Blue)
                color: "transparent"
                radius: 5
                anchors.topMargin: -5
            }
        }


        TextField
        {
            Layout.fillWidth: true
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            background: null
            echoMode: TextInput.Password
            placeholderText: "Contraseña"
            selectByMouse: true
            selectionColor: Material.color(Material.Blue, Material.Shade300)
            Rectangle
            {
                anchors.fill: parent
                border.color: parent.focus?"white":Material.color(Material.Blue)
                color: "transparent"
                radius: 5
                anchors.topMargin: -5
            }
        }


        Button
        {
            Layout.fillWidth: true
        }
    }

}
