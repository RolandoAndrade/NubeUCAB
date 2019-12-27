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
    QVariantList files;
    (*client).cd("Carpeta 1");
    return files;
}

QVariantList ClientManager::getFiles()
{
    QVariantList files;
    vector<map<string,string>> l = listFiles(*client);
    for(auto m: l)
    {
        QVariantMap map;
        map["name"]=m["name"].c_str();
        map["type"]=m["type"].c_str();
        files.append(map);
    }
    return files;
}

QString ClientManager::getActualDir()
{
    return QString((*client).pwd().c_str());
}
