import QtQuick
import QtQuick.Controls.Basic

Rectangle {
    anchors.fill: parent
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.4
        visible: p_visiableErrorConnection
    }

    Rectangle {
        id: _backGroundForError
        anchors.centerIn: parent
        width: 309
        height: 416
        radius: 25
        color: "#33363F"
        visible: p_visiableErrorConnection

        Image {
            id: _WiFi_Error
            source: "qrc:/svg/Not_WiFi.svg"
            width: 177
            height: 177
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 29
            }
            visible: p_visiableErrorConnection
        }

        Text {
            id: _text_Error
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: _WiFi_Error.bottom
                topMargin: 8
            }
            text: "Отсутвует\nподключение\nк серверу"
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignHCenter
            font.pointSize: 20
            lineHeight: 1
            font.family: montserratSemiBoldItalic
            font.bold: true
            font.italic: true
        }

        Rectangle {
            id: _acceptButton
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: _text_Error.bottom
                topMargin: 18
            }
            width: 239
            height: 59
            radius: 20
            color: "white"
            opacity: 0.8
            border.width: 1
            border.color: "black"

            MouseArea {
                anchors.fill: parent
                enabled: p_visiableErrorConnection
                onClicked: {
                    p_enabled_MouseArea_LogIn = true
                    p_visiableErrorConnection = false
                }
            }
        }

        Text {
            id: _acceptButtonText
            anchors.centerIn: _acceptButton
            text: "Повторить"
            color: "black"
            horizontalAlignment: Text.horizontalAlignment
            font.family: montserratSemiBoldItalic
            font.bold: true
            font.italic: true
            font.pointSize: 18
        }
    }
}
