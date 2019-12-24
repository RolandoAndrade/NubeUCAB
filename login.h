#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>

using namespace std;

class Login : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(double best READ best WRITE setBest NOTIFY bestchanged)
    public:
        //explicit Login(QObject *parent = nullptr);

    public slots:
        bool login(QString user, QString password)
        {
            return user == "rolandoandrade" && password == "123456";
        }

};
#endif // LOGIN_H
