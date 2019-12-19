import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4

Pane
{
    id: header
    y: 25
    width: parent.width
    height: 100
    Material.background: Material.LightBlue
    z: 1
    Image
    {
        x: 50
        width: 80
        height: 80
        source: "qrc:///img/ucab.png"
    }
    layer.enabled: true
    layer.effect: DropShadow
    {

        anchors.fill: header
        horizontalOffset: 0
        verticalOffset: 1
        radius: 10.0
        samples: 15
        color: "#80000000"
        source: header
    }


    TextField
    {
        x: 300
        y: 20
        font.pointSize: 10
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 200
        anchors.rightMargin: 75
        padding: 20
        height: 30
        background: Rectangle
        {
            color: "white"
            radius: 50
        }
        transformOrigin: Item.Center


    }
}
