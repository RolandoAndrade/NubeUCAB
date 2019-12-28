#ifndef CLIENTWRAPPER_H
#define CLIENTWRAPPER_H

#include "NubeUCAB-cliente/FTPClient.h"
#include <vector>
#include <map>
#include <string>

string getNameOfFile(string);

string getTypeOfFile(string);

void insertNewDirectory(vector<map<string,string>> &v,map<string,string>map);

vector<map<string,string>> listFiles(FTPClient &client);

#endif // CLIENTWRAPPER_H