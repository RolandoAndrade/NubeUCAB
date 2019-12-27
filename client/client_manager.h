#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include <QQmlApplicationEngine>
#include "clientwrapper.h"


class ClientManager : public QObject
{
    Q_OBJECT

    private:
        QQmlApplicationEngine engine;
        static FTPClient *client;

    public:
        explicit ClientManager(QQmlApplicationEngine& engine, QObject *parent = nullptr);

        ClientManager(){}


    public slots:
        int login(QString user, QString password, QString host, QString port);

        QVariantList enterToFolder(QString folderName);

        QVariantList getFiles();

};



#endif // LOGIN_H
