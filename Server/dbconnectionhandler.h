#ifndef DBCONNECTIONHANDLER_H
#define DBCONNECTIONHANDLER_H

#include <QObject>
#include <QString>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <QDebug>
#include <QStringList>
#include <QSqlQuery>
#include <QSqlDatabase>
#include <QtSql>
#include <QVector>

class DBConnectionHandler : public QObject
{
    Q_OBJECT

    public:
        explicit DBConnectionHandler(QObject *parent = nullptr);
        QJsonDocument command_distributor(QJsonDocument doc);

};

#endif // DBCONNECTIONHANDLER_H
