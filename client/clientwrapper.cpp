#include "clientwrapper.h"

string getNameOfFile(string s)
{
    size_t pos = s.find(":")+4;
    return s.substr(pos);
}

string getTypeOfFile(string s)
{

    return "";
}

vector<map<string,string>> listFiles(FTPClient &client)
{
    vector<map<string,string>> files;
    string v= client.ls();
    string x = "";
    for(char s: v)
    {
        if(s=='\n')
        {
            map<string,string> m;
            m["name"]=getNameOfFile(x);
            m["type"]=getTypeOfFile(x);
            files.push_back(m);
            x="";
        }
        else
        {
            x+=s;
        }

    }
    return files;
}
