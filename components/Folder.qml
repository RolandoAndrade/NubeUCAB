import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

Rectangle
{
    id: folderCard
    FontLoader
    {
        id: fontname
        source: "qrc:///fonts/font.ttf"
        name: "FontAwesome"
    }
    color: "#fff"
    width: 220
    height: 50
    radius: 5
    border.color: "#eee"

    Text
    {
        id: icono
        color: Material.color(Material.Grey)
        text: "\uf07b"
        font.pointSize: 30
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 10
    }
}
