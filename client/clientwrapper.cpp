#include "clientwrapper.h"

string getNameOfFile(string s)
{
    size_t pos = s.find(":")+4;
    return s.substr(pos);
}

string getTypeOfFile(string s)
{
    if(s.size())
    {
        if(s[0]=='d')
        {
            return "folder";
        }
        else
        {
            size_t pos = s.find_last_of(".");
            if(pos==string::npos)
            {
                return "file";
            }
            else
            {
                string et = s.substr(pos);
                for(char &c: et)
                    c=tolower(c);
                if(et==".txt"||et==".md")
                {
                    return "document";
                }
                else if(et==".doc"||et==".docx")
                {
                    return "word";
                }
                else if(et==".pdf")
                {
                    return "pdf";
                }
                else if(et==".jpg"||et==".png"||et==".gif"||et==".jpeg")
                {
                    return "image";
                }
                else if(et==".mp4"||et==".mov"||et==".avi"||et==".wmp"||et==".mp3"||et==".wav")
                {
                    return "multimedia";
                }
                else if(et==".zip"||et==".tar"||et==".rar")
                {
                    return "zip";
                }
                else if(et==".xls"||et==".xlsx"||et==".csv"||et==".xml"||et==".json")
                {
                    return "excel";
                }
            }

        }
    }

    return "file";
}

void insertNewDirectory(vector<map<string,string>> &v,map<string,string>map)
{
    int i = 0;
    for(auto m: v)
    {
        if(m["name"]>map["name"]||m["type"]!="folder")
        {
            v.insert(v.begin()+i,map);
            return;
        }
        i++;
    }
    v.push_back(map);
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
            if(m["type"]=="folder")
            {
                insertNewDirectory(files, m);
            }
            else
            {
                files.push_back(m);
            }
            x="";
        }
        else
        {
            x+=s;
        }

    }
    return files;
}

void getFile(FTPClient &client, bool *isLoading, string fileName, string path)
{
    *isLoading = true;
    string command = "get "+fileName+" "+path;
    cout<<command<<endl;
    client.clientCall("get \""+fileName+"\" \""+path+"\"");
    *isLoading = false;
}

void putFile(FTPClient &client, bool *isLoading, string fileName)
{
    *isLoading = true;
    cout<<"\""+fileName+"\""<<endl;
    client.put(fileName);
    *isLoading = false;
}
