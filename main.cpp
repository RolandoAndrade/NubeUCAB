#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include "client/client_manager.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Material");

    qmlRegisterType<ClientManager>("com.nubeucab.clientmanager",1,0,"ClientManager");

    QQmlApplicationEngine engine;

    engine.load(QUrl(QStringLiteral("qrc:/Login.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
