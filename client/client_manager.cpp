#include "client_manager.h"

FTPClient *ClientManager::client = nullptr;

void ClientManager::asyncUpload(QString fileName)
{
    setLoading(true);
    putFile(*client, fileName.toStdString());
    setLoading(false);
}

void ClientManager::asyncDownload(QString fileName, QString path)
{
    setLoading(true);
    getFile(*client, fileName.toStdString(),path.toStdString());
    setLoading(false);
}

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

void ClientManager::enterToFolder(QString folderName)
{
    (*client).cd(folderName.toStdString());
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
    std::thread t(&ClientManager::asyncUpload, this, fileName);
    t.detach();
}


void ClientManager::downLoadFile(QString fileName, QString path)
{
    std::thread t(&ClientManager::asyncDownload, this, fileName, path);
    t.detach();
}

void ClientManager::deleteFile(QString fileName)
{
    rmFile(*client,fileName.toStdString());
}

void ClientManager::createFolder(QString folderName)
{
    mkFolder(*client,folderName.toStdString());
}

void ClientManager::moveFile(QString file, QString route)
{

}
