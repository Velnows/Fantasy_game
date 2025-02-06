#ifndef THREADSOCKET_H
#define THREADSOCKET_H

#include <QObject>
#include <QTcpSocket>
#include <QJsonDocument>
#include <QSqlDatabase>
#include <QtSql>
#include <QSqlQuery>
#include "dbconnectionhandler.h"

class ThreadSocket : public QObject
{
    Q_OBJECT
    QTcpSocket* socket;
    qintptr descriptor;
    DBConnectionHandler database;

    public:
        explicit ThreadSocket(qintptr descriptorIn, QObject *parent = nullptr);

    private slots:
        void slotReadyRead();
        void slotDisconnected();

    signals:
        void clientDisconnected();

};

#endif // THREADSOCKET_H
