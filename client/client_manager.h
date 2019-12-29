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
        std::thread clientThread;

        void asyncUpload(QString folderName);

    public:
        explicit ClientManager(QQmlApplicationEngine& engine, QObject *parent = nullptr);

        ClientManager(){}

        bool isLoading();

        void setLoading(bool l);


    public slots:
        int login(QString user, QString password, QString host, QString port);

        void retrieveFiles(){}

        void enterToFolder(QString folderName);

        QVariantList getFiles();

        QString getActualDir();



        void upLoadFile(QString fileName);

        void downLoadFile(QString fileName, QString path);

        void deleteFile(QString fileName);

        void createFolder(QString folderName);

    signals:
        void valueChanged(bool);



};



#endif // LOGIN_H
