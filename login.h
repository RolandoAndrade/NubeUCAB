#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include <QQmlApplicationEngine>

class Login : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(double best READ best WRITE setBest NOTIFY bestchanged)

    private:
        QQmlApplicationEngine engine;
    public:
        explicit Login(QQmlApplicationEngine& engine, QObject *parent = nullptr);

        Login()
        {

        }

    public slots:
        bool login(QString user, QString password)
        {
            bool loggedIn = user == "rolandoandrade" && password == "123456";
            if(loggedIn)
            {
                engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
            }

            return loggedIn;
        }

};
#endif // LOGIN_H
