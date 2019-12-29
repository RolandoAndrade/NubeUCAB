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
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.left: parent.left
        spacing: 30
        Layout.alignment: Qt.AlignCenter
        Label
        {
            text: drawer.fileIcon

            font.pointSize: 100
            color: drawer.fileColor
            Layout.alignment: Qt.AlignCenter
        }
        Label
        {
            text: drawer.fileName
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            color: Material.color(Material.Grey)
            font.pointSize: 15
            Layout.alignment: Qt.AlignCenter
        }

        RowLayout
        {
            spacing: 20
            Layout.fillHeight: false
            Layout.alignment: Qt.AlignCenter
            RadiusButton
            {
                visible: fileIcon!="\uf07b";
                Layout.alignment: Qt.AlignCenter
                icon: "\uf019"
                function select()
                {
                    fileSelector.open();
                }
            }
            RadiusButton
            {
                Layout.alignment: Qt.AlignCenter
                icon: "\uf1f8"
                color: Material.color(Material.Red)

                function select()
                {
                    clientManager.deleteFile(fileName);
                    drawer.close();
                    clientManager.retrieveFiles();
                }
            }
        }

    }

    FileBrowser
    {
        id: fileSelector
        selectFolder: true

        function done()
        {
            loadingIndicator.message = "Descargando archivo...";
            drawer.close();
            clientManager.downLoadFile(drawer.fileName,fileSelector.fileUrls[0].substr(7));
        }
    }


}
