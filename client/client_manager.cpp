#include "client_manager.h"

FTPClient *ClientManager::client = nullptr;

void ClientManager::asyncUpload(QString fileName)
{
    setLoading(true);
    putFile(*client, fileName.toStdString());
    retrieveFiles();
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
    clientThread = std::thread(&ClientManager::asyncUpload, this, fileName);
}


void ClientManager::downLoadFile(QString fileName, QString path)
{
    //clientThread = std::thread(getFile, ref(*client), ref(m_isLoading), fileName.toStdString(), path.toStdString());
}

void ClientManager::deleteFile(QString fileName)
{
    rmFile(*client,fileName.toStdString());
}

void ClientManager::createFolder(QString folderName)
{
    mkFolder(*client,folderName.toStdString());
    retrieveFiles();
}
