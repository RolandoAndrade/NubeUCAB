import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "components" as UIObjects
import com.nubeucab.login 1.0

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

    FontLoader
    {
        id: fontname
        source: "qrc:///fonts/font.ttf"
        name: "FontAwesome"
    }

    Popup
    {
        id: popup
        x: 75
        y: 75
        width: 250
        height: 250
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

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
                text: "Usuario o contraseña incorrectos";
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

    Rectangle
    {
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 25
        anchors.top: parent.top
        color: "transparent"

        ColumnLayout
        {
            width: 250
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 30

            TextField
            {
                id: nameArea
                Layout.fillWidth: true
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                background: null
                selectByMouse: true
                selectionColor: Material.color(Material.Blue, Material.Shade300)


                Rectangle
                {
                    id: rectangle
                    anchors.fill: parent
                    border.color: parent.focus?"white":Material.color(Material.Blue)
                    color: "transparent"
                    radius: 5
                    anchors.topMargin: -5

                    Rectangle
                    {
                        id: rectangle1
                        width: nameLabel.width+20
                        height: 25
                        color: Material.color(Material.LightBlue)
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: -10
                        scale: 0.5
                        Label
                        {
                            id: nameLabel
                            color: "white"
                            text: "Nombre"
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter



                        }
                    }


                }

            }

            TextField
            {
                id: passArea
                echoMode: TextInput.Password
                Layout.fillWidth: true
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                background: null
                selectByMouse: true
                selectionColor: Material.color(Material.Blue, Material.Shade300)


                Rectangle
                {
                    anchors.fill: parent
                    border.color: parent.focus?"white":Material.color(Material.Blue)
                    color: "transparent"
                    radius: 5
                    anchors.topMargin: -5

                    Rectangle
                    {
                        width: passLabel.width+20
                        height: 25
                        color: Material.color(Material.LightBlue)
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: -10
                        scale: 0.5
                        Label
                        {
                            id: passLabel
                            color: "white"
                            text: "Contraseña"
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter

                        }

                    }

                }
            }

            Button
            {
                Layout.fillWidth: true
                text: "Iniciar sesión"
                flat: true
                Material.background: Material.color(Material.Blue)
                Material.foreground: "#fff"
                padding: 20
                onPressed: {

                    if(loginHandler.login(nameArea.text, passArea.text))
                    {
                        mainWindow.hide();
                    }
                    else
                    {
                        popup.open();
                    }
                }
            }
        }
    }



    Login
    {
        id: loginHandler
    }

}
