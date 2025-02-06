#ifndef CONNECTIONTOSERVER_H
#define CONNECTIONTOSERVER_H

#include <QObject>
#include <QString>
#include <QTcpSocket>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QFile>
#include <QTextStream>
#include <QDir> // Для отображения текущий директории (нужно при работе с путями к файлу)

class ConnectionToServer : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString myString READ myString WRITE setMyString NOTIFY myStringChanged) // Для передачи пароля из QML
    Q_PROPERTY(QString idPlayer READ idPlayer WRITE setIdPlayer NOTIFY idPlayerChanged) // Для передачи id игрока из БД
    Q_PROPERTY(QString namePlayer READ namePlayer WRITE setNamePlayer NOTIFY namePlayerChanged)
    Q_PROPERTY(QString surnamePlayer READ surnamePlayer WRITE setSurnamePlayer NOTIFY surnamePlayerChanged)
    Q_PROPERTY(QString errorConnection READ errorConnection WRITE setErrorConnection NOTIFY errorConnectionChanged) // Для определения ошибки при входе
    Q_PROPERTY(QString squadCode READ squadCode WRITE setSquadCode NOTIFY squadCodeChanged)
    Q_PROPERTY(QString squadName READ squadName WRITE setSquadName NOTIFY squadNameChanged)
    Q_PROPERTY(QString classPlayer READ classPlayer WRITE setClassPlayer NOTIFY classPlayerChanged)
    Q_PROPERTY(bool regSuccess READ regSuccess WRITE setRegSuccess NOTIFY regSuccessChanged)
    Q_PROPERTY(bool result READ result WRITE setResult NOTIFY resultChanged)
    Q_PROPERTY(QString isHeadman READ isHeadman WRITE setIsHeadman NOTIFY isHeadmanChanged)
    Q_PROPERTY(QString isTeacher READ isTeacher WRITE setIsTeacher NOTIFY isTeacherChanged)
    Q_PROPERTY(QVariant currentTailsArr READ currentTailsArr WRITE setCurrentTailsArr NOTIFY currentTailsArrChanged)
    Q_PROPERTY(QVariant archiveTailsArr READ archiveTailsArr WRITE setArchiveTailsArr NOTIFY archiveTailsArrChanged)
    Q_PROPERTY(QVariant tailChaptersArr READ tailChaptersArr WRITE setTailChaptersArr NOTIFY tailChaptersArrChanged)
    Q_PROPERTY(QVariant tailRaceArr READ tailRaceArr WRITE setTailRaceArr NOTIFY tailRaceArrChanged)
    Q_PROPERTY(QVariant squadsRatingArr READ squadsRatingArr WRITE setSquadsRatingArr NOTIFY squadsRatingArrChanged)
    Q_PROPERTY(QVariant playerRatingArr READ playerRatingArr WRITE setPlayerRatingArr NOTIFY playerRatingArrChanged)
    Q_PROPERTY(QVariant allSquadsArr READ allSquadsArr WRITE setAllSquadsArr NOTIFY allSquadsArrChanged)
    Q_PROPERTY(QVariant tailSquadsArr READ tailSquadsArr WRITE setTailSquadsArr NOTIFY tailSquadsArrChanged)
    Q_PROPERTY(QVariant racesArr READ racesArr WRITE setRacesArr NOTIFY racesArrChanged)
    Q_PROPERTY(QVariant allStagesStepsArr READ allStagesStepsArr WRITE setAllStagesStepsArr NOTIFY allStagesStepsArrChanged)
    Q_PROPERTY(QVariant allPlayersRatingArr READ allPlayersRatingArr WRITE setAllPlayersRatingArr NOTIFY allPlayersRatingArrChanged)
    Q_PROPERTY(QString allPointsStage READ allPointsStage WRITE setAllPointsStage NOTIFY allPointsStageChanged)
    Q_PROPERTY(QVariant squadCheckArr READ squadCheckArr WRITE setSquadCheckArr NOTIFY squadCheckArrChanged)

public:
    explicit ConnectionToServer(QObject *parent = nullptr);

    Q_INVOKABLE void logInToClient();
    Q_INVOKABLE void signInToClient();
    Q_INVOKABLE void getCurrentTails();
    Q_INVOKABLE void getArchiveTails();
    Q_INVOKABLE void getTailChapters();
    Q_INVOKABLE void getTailRace();
    Q_INVOKABLE void getSquadsRating();
    Q_INVOKABLE void setSquad();
    Q_INVOKABLE void getPlayerSquad();
    Q_INVOKABLE void getPlayerRating(int number);
    Q_INVOKABLE void getTeacherTails();
    Q_INVOKABLE void setTail();
    Q_INVOKABLE void changeTailName(QString str_old, QString str_new);
    Q_INVOKABLE void deleteTail();
    Q_INVOKABLE void addSquadToTail(QString squad_name);
    Q_INVOKABLE void setChapter(QString chapter_name);
    Q_INVOKABLE void deleteChapter(QString chapter_name);
    Q_INVOKABLE void setStage(QString stage_name, QString chapter_name, QString tail_name);
    Q_INVOKABLE void getSquadsInTail(QString tail_name);
    Q_INVOKABLE void beginLection(QString step_type, QString stage_name, QString chapter_name, QString tail_name);
    Q_INVOKABLE void getRaces();
    Q_INVOKABLE void getPlayerTailClass();
    Q_INVOKABLE void setPlayerTailClass(QString class_name);
    Q_INVOKABLE void getLection(QString tail_name, QString chapter_name);
    Q_INVOKABLE void getChapterStagesSteps(QString chapter_name, QString tail_name);
    Q_INVOKABLE void getAllPlayersRating(QString tail_name);
    Q_INVOKABLE void getPlayerStagePoints(QString stage_name, QString chapter_name, QString tail_name);
    Q_INVOKABLE void getSquadApointed(QString tail_name, QString squad_name);
    Q_INVOKABLE void getAllSquads();
    Q_INVOKABLE void updatePlayerStepStats(QString points, QString player_name, QString player_surname, QString step_type, QString stage_name, QString chapter_name,QString tail_name);
    Q_INVOKABLE void chageAccount(QString name, QString surname, bool is_teacher);

    QJsonDocument send(QJsonDocument send_data);
    QJsonValue input_distributor(QJsonDocument doc);

    QString myString() const { return m_myString; } // Для передачи пароля из QML
    void setMyString(const QString &value) {
        if (m_myString != value) {
            m_myString = value;
            emit myStringChanged();
        }
    }

    QString idPlayer() const { return m_idPlayer; } // Для передачи id игрока из БД
    void setIdPlayer(const QString &value) {
        if (m_idPlayer != value) {
            m_idPlayer = value;
            emit idPlayerChanged();
        }
    }

    QString namePlayer() const { return m_namePlayer; }
    void setNamePlayer(const QString &value) {
        if (m_namePlayer != value) {
            m_namePlayer = value;
            emit namePlayerChanged();
        }
    }

    QString surnamePlayer() const { return m_surnamePlayer; }
    void setSurnamePlayer(const QString &value) {
        if (m_surnamePlayer != value) {
            m_surnamePlayer = value;
            emit surnamePlayerChanged();
        }
    }

    QString errorConnection() const { return m_errorConnection; }
    void setErrorConnection(const QString &value) {
        if (m_errorConnection != value) {
            m_errorConnection = value;
            emit errorConnectionChanged();
        }
    }

    QString squadCode() const { return m_squadCode; }
    void setSquadCode(const QString &value) {
        if (m_squadCode != value) {
            m_squadCode = value;
            emit squadCodeChanged();
        }
    }

    QString squadName() const { return m_squadName; }
    void setSquadName(const QString &value) {
        if (m_squadName != value) {
            m_squadName = value;
            emit squadNameChanged();
        }
    }

    QString classPlayer() const { return m_classPlayer; }
    void setClassPlayer(const QString &value) {
        if (m_classPlayer != value) {
            m_classPlayer = value;
            emit classPlayerChanged();
        }
    }

    bool regSuccess() const { return m_regSuccess; }
    void setRegSuccess(const bool &value) {
        if (m_regSuccess != value) {
            m_regSuccess = value;
            emit regSuccessChanged();
        }
    }

    bool result() const { return m_result; }
    void setResult(const bool &value) {
        if (m_result != value) {
            m_result = value;
            emit resultChanged();
        }
    }

    QString isHeadman() const { return m_isHeadman; }
    void setIsHeadman(const QString &value) {
        if (m_isHeadman != value) {
            m_isHeadman = value;
            emit isHeadmanChanged();
        }
    }

    QString isTeacher() const { return m_isTeacher; }
    void setIsTeacher(const QString &value) {
        if (m_isTeacher != value) {
            m_isTeacher = value;
            emit isTeacherChanged();
        }
    }

    QVariant currentTailsArr() const { return m_currentTailsArr; }
    void setCurrentTailsArr(const QVariant &value) {
        if (m_currentTailsArr != value) {
            m_currentTailsArr = value;
            emit currentTailsArrChanged();
        }
    }

    QVariant archiveTailsArr() const { return m_archiveTailsArr; }
    void setArchiveTailsArr(const QVariant &value) {
        if (m_archiveTailsArr != value) {
            m_archiveTailsArr = value;
            emit archiveTailsArrChanged();
        }
    }

    QVariant tailChaptersArr() const { return m_tailChaptersArr; }
    void setTailChaptersArr(const QVariant &value) {
        if (m_tailChaptersArr != value) {
            m_tailChaptersArr = value;
            emit tailChaptersArrChanged();
        }
    }

    QVariant tailRaceArr() const { return m_tailRaceArr; }
    void setTailRaceArr(const QVariant &value) {
        if (m_tailRaceArr != value) {
            m_tailRaceArr = value;
            emit tailRaceArrChanged();
        }
    }

    QVariant squadsRatingArr() const { return m_squadsRatingArr; }
    void setSquadsRatingArr(const QVariant &value) {
        if (m_squadsRatingArr != value) {
            m_squadsRatingArr = value;
            emit squadsRatingArrChanged();
        }
    }

    QVariant playerRatingArr() const { return m_playerRatingArr; }
    void setPlayerRatingArr(const QVariant &value) {
        if (m_playerRatingArr != value) {
            m_playerRatingArr = value;
            emit playerRatingArrChanged();
        }
    }

    QVariant tailSquadsArr() const { return m_tailSquadsArr; }
    void setTailSquadsArr(const QVariant &value) {
        if (m_tailSquadsArr != value) {
            m_tailSquadsArr = value;
            emit tailSquadsArrChanged();
        }
    }

    QVariant racesArr() const { return m_racesArr; }
    void setRacesArr(const QVariant &value) {
        if (m_racesArr != value) {
            m_racesArr = value;
            emit racesArrChanged();
        }
    }
    QVariant allStagesStepsArr() const { return m_allStagesSteps; }
    void setAllStagesStepsArr(const QVariant &value)
    {
        if(m_allStagesSteps != value){
            m_allStagesSteps = value;
            emit allStagesStepsArrChanged();
        }
    }
    QVariant allPlayersRatingArr() const { return m_allPlayersRatingArr; }
    void setAllPlayersRatingArr(const QVariant &value) {
        if (m_allPlayersRatingArr != value){
            m_allPlayersRatingArr = value;
            emit allPlayersRatingArrChanged();
        }
    }
    QString allPointsStage() const { return m_isPointsStage; }
    void setAllPointsStage(const QString &value) {
        if (m_isPointsStage != value) {
            m_isPointsStage = value;
            emit allPointsStageChanged();
        }
    }
    QVariant squadCheckArr() const { return m_squadCheckArr; }
    void setSquadCheckArr(const QVariant &value) {
        if (m_squadCheckArr != value){
            m_squadCheckArr = value;
            emit squadCheckArrChanged();
        }
    }

    QVariant allSquadsArr() const { return m_allSquadsArr; }
    void setAllSquadsArr(const QVariant &value) {
        if (m_allSquadsArr != value) {
            m_allSquadsArr = value;
            emit allSquadsArrChanged();
        }
    }

    void functionForLogIn(QString Path)
    {
        QFile file(Path);
        if(!file.open(QIODevice::ReadOnly | QIODevice::Text))
        {
            qDebug() << "Ошибка при открытии файла: " << file.errorString();
        }
        QTextStream in(&file);
        QString str = in.readAll();
        if(Path == "NamePlayer.txt")
        {
            setNamePlayer(str);
        }
        else if(Path == "SurnamePlayer.txt")
        {
            setSurnamePlayer(str);
        }
        else if(Path == "Teacher.txt")
        {
            if(str == "false")
            {
                setIsTeacher("false");
            } else {setIsTeacher("true");}
        }
        file.close();
    }

    void functionForSignIn(QString Path, QString str)
    {
        QFile file(Path);
        if(!file.open(QIODevice::WriteOnly | QIODevice::Text))
        {
            qDebug() << "Ошибка при открытии файла: " << file.errorString();
        } else {
            qDebug() << "Данные записаны в файл";
        }
        QTextStream out(&file);
        out << str;
        file.close();
    }

public slots:
    void slotConnecting();
    void slotDisconnecting();

private:
    bool p_error = false;
    QTcpSocket* socket  = new QTcpSocket(this);

    QString m_myString; // Для передачи пароля из QML
    QString m_idPlayer; // Для передачи id игрока из БД
    QString m_namePlayer;
    QString m_surnamePlayer;
    QString m_errorConnection;
    QString m_squadCode;
    QString m_squadName;
    QString m_classPlayer;
    bool m_regSuccess;
    bool m_result;
    QString m_isHeadman;
    QString m_isTeacher;
    QVariant m_currentTailsArr;
    QVariant m_archiveTailsArr;
    QVariant m_tailChaptersArr;
    QVariant m_tailRaceArr;
    QVariant m_squadsRatingArr;
    QVariant m_playerRatingArr;
    QVariant m_allSquadsArr;
    QVariant m_tailSquadsArr;
    QVariant m_racesArr;
    QVariant m_allStagesSteps;
    QVariant m_allPlayersRatingArr;
    QString m_isPointsStage;
    QVariant m_squadCheckArr;


private slots:
    void slotReadyRead();
    void slotConnected();
    void slotDisconnected();

signals:
    void connectionSuccess();
    void connectionError(const QString &errorString);

    void myStringChanged(); // Для передачи пароля из QML
    void idPlayerChanged(); // Для передачи id игрока из БД
    void namePlayerChanged();
    void surnamePlayerChanged();
    void errorConnectionChanged();
    void squadCodeChanged();
    void squadNameChanged();
    void classPlayerChanged();
    void regSuccessChanged();
    void resultChanged();
    void isHeadmanChanged();
    void isTeacherChanged();
    void currentTailsArrChanged();
    void archiveTailsArrChanged();
    void tailChaptersArrChanged();
    void tailRaceArrChanged();
    void squadsRatingArrChanged();
    void playerRatingArrChanged();
    void allSquadsArrChanged();
    void tailSquadsArrChanged();
    void racesArrChanged();
    void allStagesStepsArrChanged();
    void allPlayersRatingArrChanged();
    void allPointsStageChanged();
    void squadCheckArrChanged();
};

#endif // CONNECTIONTOSERVER_H
