import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
Drawer
{
    id: drawer
    x: 0
    y: 25
    width: 400

    Material.elevation: 0
    z: 0
    height: mainWindow.height-25
    dragMargin: -1
    property string fileIcon: "\uf07b"
    property string fileName: "Carpeta X"
    property color fileColor: Material.color(Material.Grey)
    ColumnLayout
    {
        anchors.centerIn: parent
        Layout.alignment: Qt.AlignCenter
        Label {
            text: drawer.fileIcon

            font.pointSize: 100
            color: drawer.fileColor
            Layout.alignment: Qt.AlignCenter
        }
        Label {
            text: drawer.fileName
            color: Material.color(Material.Grey)
            font.pointSize: 15
            Layout.alignment: Qt.AlignCenter
        }
    }


}
