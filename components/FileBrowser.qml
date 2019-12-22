import QtQuick 2.9
import QtQuick.Dialogs 1.0

FileDialog {
    id: fileDialog
    title: "Escoge un archivo"
    folder: shortcuts.home
    sidebarVisible: false

    onAccepted:
    {
        console.log("You chose: " + fileDialog.fileUrls)
        Qt.quit()
    }
    onRejected:
    {
        console.log("Canceled")
        Qt.quit()
    }
    Component.onCompleted: visible = false
}
