#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include <QQmlApplicationEngine>
#include "clientwrapper.h"


class ClientManager : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool isLoading READ isLoading WRITE setLoading NOTIFY valueChanged)

    private:
        QQmlApplicationEngine engine;
        static FTPClient *client;
        bool m_isLoading = false;

    public:
        explicit ClientManager(QQmlApplicationEngine& engine, QObject *parent = nullptr);

        ClientManager(){}

        bool isLoading();

        void setLoading(bool l);


    public slots:
        int login(QString user, QString password, QString host, QString port);

        QVariantList enterToFolder(QString folderName);

        QVariantList getFiles();

        QString getActualDir();

        void upLoadFile(QString fileName);

        void downLoadFile(QString fileName, QString path);

    signals:
        void valueChanged(bool);



};



#endif // LOGIN_H
