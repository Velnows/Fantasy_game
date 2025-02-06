import QtQuick
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Rectangle {

    property bool p_connecting
    property int p_width
    property int p_height
    property int p_radius
    property int p_bottomMargin
    property bool p_enabled_MouseArea
    property string p_rootTitle
    property Component p_stackPush

    anchors {
        horizontalCenter: parent.horizontalCenter
        bottom: parent.bottom
        bottomMargin: p_bottomMargin
    }
    width: p_width
    height: p_height
    color: "transparent"

    Rectangle {
        id: _buttonLogIn
        anchors.fill: parent
        visible: false
        color: "transparent"

        LinearGradient {
            anchors.fill: parent
            start: Qt.point(0, 0)
            end: Qt.point(parent.width, parent.height)
            gradient: Gradient {
                GradientStop {position: 0.0; color: "#C79553"}
                GradientStop {position: 1.0; color: "#161619"}
            }
        }
    }

    OpacityMask {
        id: _buttonLogInMask
        anchors.fill: _buttonLogIn
        source: _buttonLogIn
        opacity: 0.8
        maskSource: Rectangle {
            width: p_width
            height: p_height
            radius: p_radius
        }
    }

    MouseArea {
        id: _buttonLogInMaskMouseArea
        anchors.fill: _buttonLogInMask
        enabled: p_enabled_MouseArea
        onClicked: {

            if(p_connecting === false)
            {
                _stack.push(p_stackPush)
                _root.title = p_rootTitle
            }

            if(arr_1.length < 4 && p_connecting === true)
            {
                console.log("Пароль набран не до конца")
            }

            if(arr_1.length === 4 && p_connecting === true)
            {
                _client.slotConnecting()
                _client.myString = password.join("")
                _client.logInToClient()
                _client.slotDisconnecting()

                if(_client.idPlayer != "")
                {
                    if(_client.isTeacher === "true")
                    {
                        p_User = "преподаватель"
                        _stack.push(_menuTeacherCom)
                        _root.title = "Меню преподавателя"
                        p_visibleMenuBar = false

                    } else {

                        if(_client.isHeadman === "true")
                        {
                            p_User = "староста"
                        } else {p_User = "студент"}

                        _client.slotConnecting()
                        _client.getCurrentTails()
                        _client.getPlayerSquad()
                        _client.slotDisconnecting()
                        _stack.push(_fairyTalesCom)
                        _root.title = p_rootTitle
                        p_visibleMenuBar = true
                    }

                    console.log(p_User)
                    arr_1 = []
                    password = []

                } else if(_client.errorConnection === "Ошибка подключения")
                {
                    console.log("Ошибка подключения к серверу\nВведен пороль: " + _client.myString)
                    p_visiableErrorConnection = true
                    p_enabled_MouseArea_LogIn = false

                } else if (_client.errorConnection === "Пустой ответ") {
                    console.log("Игрок не найден");
                }                
            }
        }
    }

    Rectangle {
        id: _borderForButtonLogIn
        anchors.centerIn: _buttonLogIn
        width: _buttonLogIn.width + 2
        height: _buttonLogIn.height + 2
        color: "transparent"
        border.color: "black"
        border.width: 1
        radius: p_radius
    }

    Text {
        id: _logInTxt
        anchors.centerIn: _buttonLogIn
        text: "Вход"
        color: "white"
        font.pointSize: 24
        font.family: montserratMedium
        font.letterSpacing: 0
        style: Text.Outline
        styleColor: "black"
        layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: 2.5
            color: "#000000"
            radius: 8
            samples: 25
            spread: 0
        }
    }
}
