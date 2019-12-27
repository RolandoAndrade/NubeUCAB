#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include <QQmlApplicationEngine>
#include "NubeUCAB-cliente/FTPClient.h"


class Login : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(double best READ best WRITE setBest NOTIFY bestchanged)

    private:
        QQmlApplicationEngine engine;
    public:
        explicit Login(QQmlApplicationEngine& engine, QObject *parent = nullptr);

        Login()
        {

        }

    public slots:
        int login(QString user, QString password, QString host, QString port)
        {
            FTPClient client(host.toStdString(), port.toInt(), user.toStdString(), password.toStdString());
            int r = client.start();
            if(!r)
                engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
            return r;
        }

};
#endif // LOGIN_H
