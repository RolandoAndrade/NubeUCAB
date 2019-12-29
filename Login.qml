import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "components" as UIObjects
import com.nubeucab.clientmanager 1.0

ApplicationWindow
{
    id: mainWindow
    width: 500
    height: 600
    title: qsTr('NubeUCAB')
    flags: Qt.Window | Qt.FramelessWindowHint
    x: screen.width / 2 - width / 2
    y: screen.height / 2 - height / 2
    property int previousX
    property int previousY
    property bool isMaximized: false
    visible: true
    Material.accent: "#fff"
    color: Material.color(Material.LightBlue)

    MouseArea
    {
        anchors.fill: parent
        onClicked: focus = true
    }

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

    UIObjects.PopupMessage
    {
        id: popup
        x: mainWindow.width/2 - width/2
        y: mainWindow.height/2 - height/2
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
            Rectangle
            {
                width: 60
                height: 60
                color: "transparent"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Image
                {
                    anchors.fill: parent
                    source: "qrc:///img/ucab.png"
                }
            }

            RowLayout
            {

                TextField
                {
                    id: ipArea
                    Layout.fillWidth: true
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    background: null
                    selectByMouse: true
                    selectionColor: Material.color(Material.Blue, Material.Shade300)
                    text: "127.0.0.1"


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
                            width: hostLabel.width+20
                            height: 25
                            color: Material.color(Material.LightBlue)
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: -10
                            scale: 0.5
                            Label
                            {
                                id: hostLabel
                                color: "white"
                                text: "Host"
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }

                TextField
                {
                    id: portArea
                    Layout.fillWidth: true
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    background: null
                    selectByMouse: true
                    selectionColor: Material.color(Material.Blue, Material.Shade300)
                    text: "3000"
                    validator: IntValidator {bottom: 2048; top: 65536}


                    Rectangle
                    {
                        anchors.fill: parent
                        border.color: parent.focus?"white":Material.color(Material.Blue)
                        color: "transparent"
                        radius: 5
                        anchors.topMargin: -5

                        Rectangle
                        {
                            width: portLabel.width+20
                            height: 25
                            color: Material.color(Material.LightBlue)
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: -10
                            scale: 0.5
                            Label
                            {
                                id: portLabel
                                color: "white"
                                text: "Puerto"
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }

            }



            TextField
            {
                id: nameArea
                Layout.fillWidth: true
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                background: null
                selectByMouse: true
                selectionColor: Material.color(Material.Blue, Material.Shade300)
                text: "rolandoandrade"

                Rectangle
                {
                    anchors.fill: parent
                    border.color: parent.focus?"white":Material.color(Material.Blue)
                    color: "transparent"
                    radius: 5
                    anchors.topMargin: -5

                    Rectangle
                    {
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
                text: "123456"


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
                    clientManager.signIn();

                }
            }
        }
    }





    ClientManager
    {
        id: clientManager

        function signIn()
        {
            var i = clientManager.login(nameArea.text, passArea.text,ipArea.text, portArea.text);
            if(!i)
            {
                mainWindow.hide();
            }
            else
            {
                popup.message = i===1 ? "Usuario o contraseña incorrectos":"La conexión no se ha podido establecer";
                popup.open();
            }
        }
    }

}
