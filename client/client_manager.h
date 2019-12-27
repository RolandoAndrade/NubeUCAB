#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include <QQmlApplicationEngine>
#include "clientwrapper.h"


class ClientManager : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(double best READ best WRITE setBest NOTIFY bestchanged)

    private:
        QQmlApplicationEngine engine;
        FTPClient *client;
    public:
        explicit ClientManager(QQmlApplicationEngine& engine, QObject *parent = nullptr);

        ClientManager()
        {

        }

    public slots:
        int login(QString user, QString password, QString host, QString port)
        {
            client = new FTPClient(host.toStdString(), port.toInt(), user.toStdString(), password.toStdString());
            int r = (*client).start();
            if(!r)
                engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
            return r;
        }

        QVariantList enterToFolder(QString folderName)
        {
            return getFiles();
        }

        QVariantList getFiles()
        {
            QVariantList files;
            listFiles(*client);
            return files;
        }

};
#endif // LOGIN_H
