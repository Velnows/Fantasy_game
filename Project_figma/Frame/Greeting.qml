import QtQuick
import QtQuick.Controls.Basic

Rectangle {
    color: "transparent"

    Image {
        anchors.fill: parent
        source: "qrc:/images/forGreeting.png"
        fillMode: Image.PreserveAspectCrop
    }

    Text {
        id: _textGreeting
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 150
        }
        text: "Регистрация\nпрошла успешно!"
        font.pointSize: 26
        font.family: montserratSemiBold
        font.bold: true
        color: "black"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Button {
        id: _buttonGreeting
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: _textGreeting.bottom
            topMargin: 75
        }
        width: 200
        height: 60
        text: "Погнали!"
        font.pointSize: 18
        onClicked: {
            _client.slotConnecting()

            if(p_User !== "преподаватель")
            {
                _client.getCurrentTails()
                p_visibleMenuBar = true
                _stack.push(_fairyTalesCom)
            } else {
                _client.getTeacherTails()
                p_visibleMenuBar = false
                _stack.push(_fairyTalesTeacherCom)
            }
            _client.slotDisconnecting()
        }
    }
}
