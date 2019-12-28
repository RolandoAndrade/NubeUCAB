import QtQuick 2.9
import QtQuick.Dialogs 1.0

FileDialog {
    id: fileDialog
    title: "Escoge un archivo"
    folder: shortcuts.home
    sidebarVisible: false

    onAccepted:
    {
        clientManager.upLoadFile(fileDialog.fileUrls[0].substr(7));
        clientManager.retrieveFiles();
    }
    onRejected:
    {
        console.log("Canceled")
    }
    Component.onCompleted: visible = false
}
