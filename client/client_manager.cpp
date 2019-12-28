#include "client_manager.h"

FTPClient *ClientManager::client = nullptr;

int ClientManager::login(QString user, QString password, QString host, QString port)
{
    client = new FTPClient(host.toStdString(), port.toInt(), user.toStdString(), password.toStdString());
    int r = (*client).start();

    if(!r)
    {
        engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));
    }

    return r;
}

QVariantList ClientManager::enterToFolder(QString folderName)
{
    QVariantList files;
    (*client).cd(folderName.toStdString());
    return files;
}

QVariantList ClientManager::getFiles()
{
    QVariantList files;
    vector<map<string,string>> l = listFiles(*client);
    for(auto m: l)
    {
        QVariantMap map;
        map["thename"]=m["name"].c_str();
        map["thetype"]=m["type"].c_str();
        files.append(map);
    }


    return files;
}

QString ClientManager::getActualDir()
{
    return QString((*client).pwd().c_str());
}

bool ClientManager::isLoading()
{
    return m_isLoading;
}

void ClientManager::setLoading(bool l)
{
    m_isLoading = l;
    emit valueChanged(l);
}

void ClientManager::upLoadFile(QString fileName)
{
    putFile(*client,&m_isLoading,fileName.toStdString());
}


void ClientManager::downLoadFile(QString fileName, QString path)
{
    getFile(*client,&m_isLoading,fileName.toStdString(), path.toStdString());
}
