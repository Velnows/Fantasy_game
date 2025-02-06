import QtQuick
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects
import "../Canvas"

Rectangle {
    color: "transparent"

    Image {
        id: _imageFon
        anchors.fill: parent
        source: "qrc:/images/yandexart-fbvmb2523t3qi5diukok.png"
        fillMode: Image.PreserveAspectCrop
    }

    Image {
        id: _backGroundForDobro
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: _greetingText.top
            topMargin: -12
        }
        source: "qrc:/images/forDobro.png"
        fillMode: Image.Stretch
    }

    Text {
        id: _greetingText
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 155
        }
        width: 213
        height: 91
        text: "Добро\nпожаловать\nв игру"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignHCenter
        color: "white"
        font.pointSize: 24
        font.letterSpacing: 6
        lineHeight: 0.8
        font.family: montserratMedium
    }

    Image {
        id: _backGroundForVolsheb
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: _nameOfGameText.top
            topMargin: -13
        }
        source: "qrc:/images/forVolsheb.png"
        fillMode: Image.Stretch
    }

    Text {
        id: _nameOfGameText
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 280
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

    Text {
        id: _signUpTxt
        anchors {
            top: _log_In_Button_HomePage.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
        text: "Регистрация"
        color: "white"
        font.pixelSize: 20
        font.underline: true
        font.family: montserratMediumItalic
        font.italic: true
        font.letterSpacing: 2
        style: Text.Outline
        styleColor: "black"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                _stack.push(_signInStudentCom)
                _root.title = "Регистрация студента"
            }
        }
    }

    Text {
        id: _changeAccauntTxt
        anchors {
            top: _signUpTxt.bottom
            topMargin: 8
            horizontalCenter: parent.horizontalCenter
        }
        text: "Смена аккаунта"
        color: "white"
        font.pixelSize: 20
        font.underline: true
        font.family: montserratMediumItalic
        font.italic: true
        font.letterSpacing: 2
        style: Text.Outline
        styleColor: "black"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                _popupChangeAccaunt.open()
            }
        }
    }

    Popup
    {
        id: _popupChangeAccaunt
        parent: Overlay.overlay
        x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
        y: -height // Начальная позиция выше экрана
        width: 280
        height: 400
        visible: false
        modal: true
        closePolicy: Popup.NoAutoClose

        Behavior on y
        {
            NumberAnimation
            {
                duration: 300
                easing.type: Easing.InOutQuad // Тип сглаживания
            }
        }

        onOpened:
        {
            y = Math.round((parent.height - height) / 2) // Центрирование по вертикали при открытии
        }

        onClosed: {
            _nameChangeAccTextField.focus = false
            _surnameChangeAccTextField.focus = false
            _nameChangeAccTextField.clear()
            _surnameChangeAccTextField.clear()
            _nameChangeAccTextField.font.pointSize = 13
            _surnameChangeAccTextField.font.pointSize = 13
            y = -height // Уводим за пределы экрана вверх
        }



        Rectangle
        {
            anchors.centerIn: parent
            width: 313
            height: 419
            radius: 25
            color: "#C3748F"
            border.color: "black"
            border.width: 1

            CanvasTwo
            {
                p_width: 300
                p_height: 70

                anchors.top: parent.top
                anchors.topMargin: 30

                p_text1: "Смена"
                p_text2: "аккаунта"
                p_colorStroke: "#E6D1D1"
                p_colorText: "#33363F"
                p_font: "bold italic 32px '" + montserratBoldItalic + "'"
                p_lineWidth: 4
                p_textHeight: 26
                p_canvasTwo_visiable: true
            }

            MouseArea {
                anchors.centerIn: parent
                width: p_rootWidth
                height: p_rootHeight
                onClicked: {
                    _nameChangeAccTextField.focus = false
                    _surnameChangeAccTextField.focus = false
                }
            }

            TextField {
                id: _nameChangeAccTextField
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: _surnameChangeAccTextField.top
                    bottomMargin: 20
                }
                width: 285
                height: 53
                placeholderText: "Введите ваше имя"
                horizontalAlignment: TextEdit.AlignHCenter
                verticalAlignment: TextEdit.AlignVCenter
                color: "#5c5c5c"
                placeholderTextColor: "#5c5c5c"
                font.family: montserratSemiBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 13
                validator: RegularExpressionValidator {regularExpression: /[А-Я][а-я]{1,11}/}
                background: Rectangle {
                    color: "white"
                    radius: 10
                    width: 285
                    height: 53
                }

                onEditingFinished: {
                    _nameChangeAccTextField.color = "#2b2b2b"
                    _nameChangeAccTextField.font.pointSize = 15
                }

                onTextEdited: {
                    _nameChangeAccTextField.color = "#5c5c5c"
                    _nameChangeAccTextField.font.pointSize = 13
                }
            }

            TextField {
                id: _surnameChangeAccTextField
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: 161
                }
                width: 285
                height: 53
                placeholderText: "Введите вашу фамилию"
                horizontalAlignment: TextEdit.AlignHCenter
                verticalAlignment: TextEdit.AlignVCenter
                color: "#5c5c5c"
                placeholderTextColor: "#5c5c5c"
                font.family: montserratSemiBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 13
                validator: RegularExpressionValidator {regularExpression: /[А-Я][а-я]{1,11}/}
                background: Rectangle {
                    color: "white"
                    radius: 10
                    width: 285
                    height: 53
                }

                onEditingFinished: {
                    _surnameChangeAccTextField.color = "#2b2b2b"
                    _surnameChangeAccTextField.font.pointSize = 15
                }

                onTextEdited: {
                    _surnameChangeAccTextField.color = "#5c5c5c"
                    _surnameChangeAccTextField.font.pointSize = 13
                }
            }

            Text {
                anchors {
                    top: _surnameChangeAccTextField.bottom
                    topMargin: 33
                    left: parent.left
                    leftMargin: 34
                }
                text: "Вы преподаватель?"
                color: "#33363F"
                font.pixelSize: 18
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                style: Text.Outline
                styleColor: "white"

                CheckBox {
                    id: _changeAccCheckBox
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.right
                        leftMargin: 13
                    }
                }
            }

            Rectangle
            {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.right: parent.right
                anchors.rightMargin: 14
                width: 150
                height: 42
                radius: 15
                color: "#D9D9D9"
                visible: (_nameChangeAccTextField.text !== "" && _surnameChangeAccTextField.text !== "") ? true : false
                Text
                {
                    anchors.centerIn: parent
                    text: "Подтвердить"
                    color: "#33363F"
                    font.family: montserratBoldItalic
                    font.bold: true
                    font.italic: true
                    font.pixelSize: 18
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        _client.chageAccount(_nameChangeAccTextField.text, _surnameChangeAccTextField.text, _changeAccCheckBox.checked)
                        _changeAccCheckBox.checked = false
                        _popupChangeAccaunt.close()
                    }
                }
            }

            Rectangle
            {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 17
                width: 115
                height: 42
                radius: 15
                color: "#D9D9D9"
                Text
                {
                    anchors.centerIn: parent
                    text: "Отмена"
                    color: "#33363F"
                    font.family: montserratBoldItalic
                    font.bold: true
                    font.italic: true
                    font.pixelSize: 18
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        _changeAccCheckBox.checked = false
                        _popupChangeAccaunt.close()
                    }
                }
            }
        }
    }
}
