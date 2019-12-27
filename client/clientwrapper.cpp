#include "clientwrapper.h"

vector<map<string,string>> listFiles(FTPClient &client)
{
    vector<map<string,string>> files;
    vector<string> a;
    vector<string> v = client.ls(a,a);
    return files;
}
