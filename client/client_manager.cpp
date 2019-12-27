#include "client_manager.h"

FTPClient *ClientManager::client = nullptr;

int ClientManager::login(QString user, QString password, QString host, QString port)
{
    client = new FTPClient(host.toStdString(), port.toInt(), user.toStdString(), password.toStdString());
    int r = (*client).start();

    if(!r&&(*client).pasv()==227)
    {
        engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));
    }

    return r;
}

QVariantList ClientManager::enterToFolder(QString folderName)
{
    return getFiles();
}

QVariantList ClientManager::getFiles()
{
    QVariantList files;
    //listFiles(*client);
    return files;
}
