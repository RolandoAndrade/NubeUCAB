#ifndef CLIENTWRAPPER_H
#define CLIENTWRAPPER_H

#include "NubeUCAB-cliente/FTPClient.h"
#include <vector>
#include <map>
#include <string>

string getNameOfFile(string);

string getTypeOfFile(string);

vector<map<string,string>> listFiles(FTPClient);

#endif // CLIENTWRAPPER_H
