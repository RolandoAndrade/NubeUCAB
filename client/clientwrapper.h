#ifndef CLIENTWRAPPER_H
#define CLIENTWRAPPER_H

#include "NubeUCAB-cliente/FTPClient.h"
#include <vector>
#include <map>
#include <string>
#include <thread>

string getNameOfFile(string);

string getTypeOfFile(string);

void insertNewDirectory(vector<map<string,string>> &v,map<string,string>map);

vector<map<string,string>> listFiles(FTPClient &client);

void putFile(FTPClient &client, string fileName);

void getFile(FTPClient &client, string fileName, string path);

void rmFile(FTPClient &client, string fileName);

void mkFolder(FTPClient &client, string folderName);

#endif // CLIENTWRAPPER_H
