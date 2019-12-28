import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

Popup
{
    id: popup
    x: 100
    y: 150
    width: 300
    height: 300
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    property string message: "error"

    ColumnLayout
    {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10

        Text
        {
            text: "\uf06a"
            color: Material.color(Material.Red)
            Layout.alignment: Qt.AlignHCenter
            opacity: 0.8
            font.pointSize: 50
        }

        Text
        {
            text: "Error";
            Layout.alignment: Qt.AlignHCenter
            font.pointSize: 20
            color: Material.color(Material.Grey)

        }


        Text
        {
            text: popup.message;
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAnywhere
            Layout.alignment: Qt.AlignHCenter
            font.pointSize: 10
            color: Material.color(Material.Grey)
            width: 150
        }

        Button
        {
            text: "Ok"
            flat: true
            Material.background: Material.color(Material.Blue)
            Layout.alignment: Qt.AlignHCenter
            Material.foreground: "#fff"
            padding: 20
            onPressed: popup.close()
            font.pointSize: 10
        }
    }


}
