import QtQuick
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Rectangle {

    color: "transparent"

    Image {
        id: _imageFon
        anchors.fill: parent
        source: "qrc:/images/Step_locked_background.png"
        fillMode: Image.PreserveAspectCrop
    }
    Rectangle
    {
        id: _stepName_rect
        anchors
        {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            topMargin: 102
        }
        width: 310
        height: 70
        color: "transparent"
        radius: 20

        Rectangle
        {
            anchors.fill: parent
            radius: 20
            opacity: 0.9
            color: "#D9D9D9"
        }

        Image {
            id: _imageLocked
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10

            source: "qrc:/svg/locked.svg"
            fillMode: Image.PreserveAspectCrop
        }

        Rectangle
        {
            anchors
            {
                right: parent.right
            }

            width: 70
            height: 70
            radius: 20
            color: "#858C87"
        }
    }
    Rectangle
    {
        id: _stepTask_rect
        anchors
        {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            topMargin: 490
        }
        width: 310
        height: 70
        color: "transparent"
        radius: 20

        Rectangle
        {
            anchors.fill: parent
            radius: 20
            opacity: 0.9
            color: "#D9D9D9"
        }

        Text
        {
            id: _stepTask_text1
            anchors
            {
                top: parent.top
                left: parent.left
                topMargin: 8
                leftMargin: 67
                horizontalCenter: parent.horizontalCenter
            }

            text: "Битва еще не"
            color: "#000000"
            font.bold: true
            font.italic: true
            font.pointSize: 18
            font.family: montserratBoldItalic
            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 5
                color: "#B5B5B5"
                radius: 10
                samples: 25
                spread: 0
            }
        }
        Text
        {
            id: _stepTask_text2
            anchors
            {
                top: _stepTask_text1.bottom
                left: parent.left
                leftMargin: 98
            }

            text: "началась"
            color: "#000000"
            font.bold: true
            font.italic: true
            font.pointSize: 18
            font.family: montserratBoldItalic
            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 5
                color: "#B5B5B5"
                radius: 10
                samples: 25
                spread: 0
            }
        }
    }
    Rectangle
    {
        id: _buttonBack
        width: 245
        height: 47
        radius: 20
        anchors
        {
            bottom: parent.bottom
            bottomMargin: 68
            horizontalCenter: parent.horizontalCenter
        }
        color: "transparent"

        Rectangle
        {
            anchors.fill: parent
            radius: 20
            opacity: 0.9
            border.color: "black"
            border.width: 1
            color: "#FFFFFF"

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    _stack.pop()
                    _root.title = "Карта"
                }
            }
        }

        Text
        {
            anchors.centerIn: parent
            text: "Назад"
            font.family: montserratBoldItalic
            font.bold: true
            font.italic: true
            font.pointSize: 22
            color: "black"
            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 5
                color: "#B5B5B5"
                radius: 10
                samples: 25
                spread: 0
            }
        }
    }
}
