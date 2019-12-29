import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

Rectangle
{
    id: loadingIndicator
    property string message: "Descargando..."
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
    ColumnLayout
    {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 20
        BusyIndicator
        {
            running: true;
            z: 50
            Material.accent: Material.Blue
            Layout.alignment: Qt.AlignHCenter
        }

        Text
        {
            text: loadingIndicator.message
            font.bold: true
            color: Material.color(Material.Blue)
            Layout.alignment: Qt.AlignHCenter
        }
    }


    MouseArea
    {
        anchors.fill: parent
    }

    onVisibleChanged:
    {
        if(!loadingIndicator.visible)
        {
            clientManager.retrieveFiles();
        }
    }
}
