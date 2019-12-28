import QtQuick 2.9
import QtQuick.Dialogs 1.0

FileDialog {
    id: fileDialog
    title: "Escoge un archivo"
    folder: shortcuts.home
    sidebarVisible: false

    function done()
    {

    }

    onAccepted:
    {
        fileDialog.done();
    }
    onRejected:
    {
        console.log("Canceled")
    }
    Component.onCompleted: visible = false
}
