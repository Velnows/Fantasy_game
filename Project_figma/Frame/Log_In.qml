import QtQuick
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Rectangle {

    color: "transparent"

    function counterAdd(number)
    {
        if(arr_1.length < 4)
        {
            arr_1.push(1)
            password.push(number)
            if(arr_1.length>= 5)
            {
                arr_1 = []
                arr_1.push(1)
            }
            updateCounter()
            // console.log(arr_1.length)
        }
    }

    function counterMinus()
    {
        arr_1.pop()
        password.pop()
        updateCounter()
    }

    function updateCounter() {

        switch(arr_1.length) {
        case 0: _cricle1.color = "black"
            _cricle2.color = "black"
            _cricle3.color = "black"
            _cricle4.color = "black";
            break;
        case 1: _cricle1.color = "white"
            _cricle2.color = "black"
            _cricle3.color = "black"
            _cricle4.color = "black";
            break;
        case 2: _cricle1.color = "white"
            _cricle2.color = "white"
            _cricle3.color = "black"
            _cricle4.color = "black";
            break;
        case 3: _cricle1.color = "white"
            _cricle2.color = "white"
            _cricle3.color = "white"
            _cricle4.color = "black";
            break;
        case 4: _cricle1.color = "white"
            _cricle2.color = "white"
            _cricle3.color = "white"
            _cricle4.color = "white";
            break;
        }
    }

    Image {
        id: _imageFon
        anchors.fill: parent
        source: "qrc:/images/yandexart-fbvmb2523t3qi5diukok.png"
        fillMode: Image.PreserveAspectCrop
    }

    Image {
        id: _backGroundForVolshebNew
        anchors.horizontalCenter: parent.horizontalCenter
        y: 105
        source: "qrc:/images/forVolsheb.png"
        fillMode: Image.Stretch

        Text {
            id: _nameOfGameTextNew
            anchors {
                left: parent.left
                leftMargin: 20
                top: parent.top
                topMargin: 13
            }
            text: "Волшебные\nсущества"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "white"
            font.pointSize: 24
            font.letterSpacing: 1
            lineHeight: 0.7
            font.family: montserratBoldItalic
            font.bold: true
            font.italic: true
        }
    }

    Grid {
        id: _gridTheDial
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: _log_In_Button_LogInStudent.top
            bottomMargin: 50
        }
        enabled: p_enabled_MouseArea_LogIn
        columns: 3
        rows: 4
        rowSpacing: 10
        columnSpacing: 16

        Rectangle {
            id: _rect1
            width: 64
            height: 64
            radius: 15
            color: "#575757"
            opacity: 0.9
            Text {
                id: _rect1Text
                anchors.centerIn: parent
                text: "1"
                color: "white"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 24
                style: Text.Outline
                styleColor: "black"
            }
            MouseArea {
                id: _rectMouseArea1
                anchors.fill: parent
                onClicked: {
                    counterAdd(1)
                }
                onPressed: {
                    _rect1.color = "white"
                    _rect1Text.color = "black"
                }
                onReleased: {
                    _rect1.color = "#575757"
                    _rect1Text.color = "white"
                }
            }
        }

        Rectangle {
            id: _rect2
            width: 64
            height: 64
            radius: 15
            color: "#575757"
            opacity: 0.9
            Text {
                id: _rect2Text
                anchors.centerIn: parent
                text: "2"
                color: "white"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 24
                style: Text.Outline
                styleColor: "black"
            }
            MouseArea {
                id: _rectMouseArea2
                anchors.fill: parent
                onClicked: {
                    counterAdd(2)
                }
                onPressed: {
                    _rect2.color = "white"
                    _rect2Text.color = "black"
                }
                onReleased: {
                    _rect2.color = "#575757"
                    _rect2Text.color = "white"
                }
            }
        }

        Rectangle {
            id: _rect3
            width: 64
            height: 64
            radius: 15
            color: "#575757"
            opacity: 0.9
            Text {
                id: _rect3Text
                anchors.centerIn: parent
                text: "3"
                color: "white"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 24
                style: Text.Outline
                styleColor: "black"
            }
            MouseArea {
                id: _rectMouseArea3
                anchors.fill: parent
                onClicked: {
                    counterAdd(3)
                }
                onPressed: {
                    _rect3.color = "white"
                    _rect3Text.color = "black"
                }
                onReleased: {
                    _rect3.color = "#575757"
                    _rect3Text.color = "white"
                }
            }
        }

        Rectangle {
            id: _rect4
            width: 64
            height: 64
            radius: 15
            color: "#575757"
            opacity: 0.9
            Text {
                id: _rect4Text
                anchors.centerIn: parent
                text: "4"
                color: "white"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 24
                style: Text.Outline
                styleColor: "black"
            }
            MouseArea {
                id: _rectMouseArea4
                anchors.fill: parent
                onClicked: {
                    counterAdd(4)
                }
                onPressed: {
                    _rect4.color = "white"
                    _rect4Text.color = "black"
                }
                onReleased: {
                    _rect4.color = "#575757"
                    _rect4Text.color = "white"
                }
            }
        }

        Rectangle {
            id: _rect5
            width: 64
            height: 64
            radius: 15
            color: "#575757"
            opacity: 0.9
            Text {
                id: _rect5Text
                anchors.centerIn: parent
                text: "5"
                color: "white"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 24
                style: Text.Outline
                styleColor: "black"
            }
            MouseArea {
                id: _rectMouseArea5
                anchors.fill: parent
                onClicked: {
                    counterAdd(5)
                }
                onPressed: {
                    _rect5.color = "white"
                    _rect5Text.color = "black"
                }
                onReleased: {
                    _rect5.color = "#575757"
                    _rect5Text.color = "white"
                }
            }
        }

        Rectangle {
            id: _rect6
            width: 64
            height: 64
            radius: 15
            color: "#575757"
            opacity: 0.9
            Text {
                id: _rect6Text
                anchors.centerIn: parent
                text: "6"
                color: "white"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 24
                style: Text.Outline
                styleColor: "black"
            }
            MouseArea {
                id: _rectMouseArea6
                anchors.fill: parent
                onClicked: {
                    counterAdd(6)
                }
                onPressed: {
                    _rect6.color = "white"
                    _rect6Text.color = "black"
                }
                onReleased: {
                    _rect6.color = "#575757"
                    _rect6Text.color = "white"
                }
            }
        }

        Rectangle {
            id: _rect7
            width: 64
            height: 64
            radius: 15
            color: "#575757"
            opacity: 0.9
            Text {
                id: _rect7Text
                anchors.centerIn: parent
                text: "7"
                color: "white"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 24
                style: Text.Outline
                styleColor: "black"
            }
            MouseArea {
                id: _rectMouseArea7
                anchors.fill: parent
                onClicked: {
                    counterAdd(7)
                }
                onPressed: {
                    _rect7.color = "white"
                    _rect7Text.color = "black"
                }
                onReleased: {
                    _rect7.color = "#575757"
                    _rect7Text.color = "white"
                }
            }
        }

        Rectangle {
            id: _rect8
            width: 64
            height: 64
            radius: 15
            color: "#575757"
            opacity: 0.9
            Text {
                id: _rect8Text
                anchors.centerIn: parent
                text: "8"
                color: "white"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 24
                style: Text.Outline
                styleColor: "black"
            }
            MouseArea {
                id: _rectMouseArea8
                anchors.fill: parent
                onClicked: {
                    counterAdd(8)
                }
                onPressed: {
                    _rect8.color = "white"
                    _rect8Text.color = "black"
                }
                onReleased: {
                    _rect8.color = "#575757"
                    _rect8Text.color = "white"
                }
            }
        }

        Rectangle {
            id: _rect9
            width: 64
            height: 64
            radius: 15
            color: "#575757"
            opacity: 0.9
            Text {
                id: _rect9Text
                anchors.centerIn: parent
                text: "9"
                color: "white"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 24
                style: Text.Outline
                styleColor: "black"
            }
            MouseArea {
                id: _rectMouseArea9
                anchors.fill: parent
                onClicked: {
                    counterAdd(9)
                }
                onPressed: {
                    _rect9.color = "white"
                    _rect9Text.color = "black"
                }
                onReleased: {
                    _rect9.color = "#575757"
                    _rect9Text.color = "white"
                }
            }
        }

        Rectangle {
            id: _rectHelp
            width: 64
            height: 64
            radius: 15
            color: "#575757"
            opacity: 0.9
            Text {
                id: _rectHelpText
                anchors.centerIn: parent
                text: "Help"
                color: "white"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 12
                font.letterSpacing: 1
                style: Text.Outline
                styleColor: "black"
            }
        }

        Rectangle {
            id: _rect0
            width: 64
            height: 64
            radius: 15
            color: "#575757"
            opacity: 0.9
            Text {
                id: _rect0Text
                anchors.centerIn: parent
                text: "0"
                color: "white"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 24
                style: Text.Outline
                styleColor: "black"
            }
            MouseArea {
                id: _rectMouseArea0
                anchors.fill: parent
                onClicked: {
                    counterAdd(0)
                }
                onPressed: {
                    _rect0.color = "white"
                    _rect0Text.color = "black"
                }
                onReleased: {
                    _rect0.color = "#575757"
                    _rect0Text.color = "white"
                }
            }
        }

        Rectangle {
            id: _rectBack
            width: 64
            height: 64
            radius: 15
            color: "#575757"
            opacity: 0.9
            Text {
                id: _rectBackText
                anchors.centerIn: parent
                text: "Back"
                color: "white"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 12
                font.letterSpacing: 1
                style: Text.Outline
                styleColor: "black"
            }
            MouseArea {
                id: _rectBackMouseArea
                anchors.fill: parent
                onClicked: {
                    counterMinus()
                }
                onPressed: {
                    _rectBack.color = "white"
                    _rectBackText.color = "black"
                }
                onReleased: {
                    _rectBack.color = "#575757"
                    _rectBackText.color = "white"
                }
            }
        }
    }

    Row {
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: _gridTheDial.top
            bottomMargin: 21
        }
        spacing: 6

        Rectangle {
            id: _cricle1
            width: 20
            height: 20
            radius: 10
            color: "black"
        }
        Rectangle {
            id: _cricle2
            width: 20
            height: 20
            radius: 10
            color: "black"
        }
        Rectangle {
            id: _cricle3
            width: 20
            height: 20
            radius: 10
            color: "black"
        }
        Rectangle {
            id: _cricle4
            width: 20
            height: 20
            radius: 10
            color: "black"
        }
    }

    Rectangle {
        id: _cancelButton
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: _log_In_Button_LogInStudent.bottom
            topMargin: 16
        }
        width: 174
        height: 38
        radius: 20
        color: "#7E7E7E"
        opacity: 0.75
        border.color: "black"
        border.width: 1

        MouseArea {
            id: _cancelButtonMouseArea
            anchors.fill: parent
            onClicked: {
                arr_1 = []
                _stack.pop()
                _root.title = "Начальное окно"
                password = [];
            }
            enabled: p_enabled_MouseArea_LogIn
        }
    }

    Text {
        id: _cancelButtonText
        anchors.centerIn: _cancelButton
        text: "отмена"
        font.family: montserratSemiBold
        font.bold: true
        font.pointSize: 18
        color: "white"
        opacity: 0.75
        style: Text.Outline
        styleColor: "black"
    }
}
