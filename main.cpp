#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include "login.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQuickStyle::setStyle("Material");

    qmlRegisterType<Login>("com.nubeucab.login",1,0,"Login");

    engine.load(QUrl(QStringLiteral("qrc:/login.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
