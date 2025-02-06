#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <threadsocket.h>
#include <QThread>

class Server : public QTcpServer
{

    public:
        Server();
        void startServer();

    private:
        void incomingConnection(qintptr descriptor) override;

};
#endif // MYSERVER_H
