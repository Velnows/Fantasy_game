import QtQuick
import QtQuick.Controls.Basic

Rectangle {

    color: "transparent"

    Image {
        id: _imageFon
        anchors.fill: parent
        source: "qrc:/images/Adventures.png"
        fillMode: Image.PreserveAspectCrop
    }
    Popup {
        id: _popup_create_adventure
        parent: Overlay.overlay
        x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
        y: -height // Начальная позиция выше экрана
        width: 299
        height: 255
        visible: false

        Behavior on y {
            NumberAnimation {
                duration: 300
                easing.type: Easing.InOutQuad // Тип сглаживания
            }
        }

        onOpened: {
            y = Math.round((parent.height - height) / 2) // Центрирование по вертикали при открытии
        }

        onClosed: {
            y = -height // Уводим за пределы экрана вверх
        }
        Rectangle {
            anchors.centerIn: parent
            width: 339
            height: 275
            color: "#E0B267"
            radius: 20
            opacity: 1
            Text {
                id: _textCreateAdventure
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Добавить путешествие"
                color: "#33363F"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 16
                style: Text.Outline
                styleColor: "#E6D1D1"
            }
            Rectangle {
                id: _nameAdventure
                anchors.top: _textCreateAdventure.bottom
                anchors.topMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter
                width: 275
                height: 40
                radius: 15
                color: "white"
                opacity: 1
                border.color: "black"
                border.width: 1

                TextField {
                    id: _nameAdventureInput
                    anchors.centerIn: parent
                    width: 265
                    height: 30
                    horizontalAlignment: TextEdit.AlignHCenter
                    verticalAlignment: TextEdit.AlignVCenter
                    color: "#5c5c5c"
                    placeholderText: "Введите название"
                    placeholderTextColor: "#5c5c5c"
                    font.family: montserratSemiBoldItalic
                    font.bold: true
                    font.italic: true
                    font.pointSize: 13
                    validator: RegularExpressionValidator {regularExpression: /[А-Я][ а-я]{1,11}/}
                    background: Rectangle {
                        color: "transparent"
                    }

                    onEditingFinished: {
                        str = _nameAdventureInput.text
                        console.log(str)
                        _nameAdventureInput.color = "#2b2b2b"
                        _nameAdventureInput.font.pointSize = 14
                    }

                    onTextEdited: {
                        _nameAdventureInput.color = "#5c5c5c"
                        _nameAdventureInput.font.pointSize = 13
                    }
                }
            }
            ComboBox {
                id: _chooseRec
                anchors.top: _nameAdventure.bottom
                anchors.topMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter
                width: 230
                height: 40
                opacity: 1
                model: ["Малый амулет", "Средний амулет", "Большой амулет"]
                // Стилизация ComboBox
                background: Rectangle {
                    width: 275
                    height: 40
                    radius: 15
                    color: "white"
                    border.color: "black"
                    border.width: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                //Стилизация выпадающего списка
                delegate: ItemDelegate {
                    width: _chooseRec.width
                    height: 40


                    background: Rectangle {
                        width: _chooseRec.width
                        height: 50

                        color: "white"
                        //border.color: "black"
                        //border.width: 1
                        //radius: 15
                    }
                    Text {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        text: modelData
                        font.family: montserratSemiBoldItalic
                        font.bold: true
                        font.italic: true
                        font.pointSize: 13
                        color: "#5c5c5c"
                        horizontalAlignment: Text.AlignHCenter
                    }
                }


                // Стилизация контента ComboBox (выбранного элемента)
                contentItem: Text {
                    id: _contentItemText
                    text: _chooseRec.currentText
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "#5c5c5c"  // Начальный цвет
                    font.family: montserratSemiBoldItalic
                    font.bold: true
                    font.italic: true
                    font.pointSize: 13  // Начальный размер
                }

                onActivated: {
                    _contentItemText.color = "#2b2b2b" // Измененный цвет
                    _contentItemText.font.pointSize = 14 // Измененный размер
                }
            }
            Item {
                width: 265
                height: 37
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors. horizontalCenter: parent.horizontalCenter
                Rectangle {
                    anchors.left: parent.left
                    width: 110
                    height: 37
                    radius: 20
                    border.color: "black"
                    border.width: 1
                    color: "white"
                    Text {
                        anchors.centerIn: parent
                        text: "Ок"
                        font.family: montserratSemiBoldItalic
                        font.bold: true
                        font.italic: true
                        font.pointSize: 14
                        color: "black"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            _popup_create_adventure.close()
                        }
                    }
                }
                Rectangle {
                    anchors.right: parent.right
                    width: 110
                    height: 37
                    radius: 20
                    border.color: "black"
                    border.width: 1
                    color: "white"
                    Text {
                        anchors.centerIn: parent
                        text: "Отмена"
                        font.family: montserratSemiBoldItalic
                        font.bold: true
                        font.italic: true
                        font.pointSize: 14
                        color: "black"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            _popup_create_adventure.close()
                        }
                    }
                }
            }
        }
    }
    Popup {
        id: _popup_close_adventure
        parent: Overlay.overlay
        x:Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        width: 319
        height: 255
        modal: true
        visible: false

        Behavior on x {
            NumberAnimation {
                duration: 300
                easing.type: Easing.InOutQuad // Тип сглаживания
            }
        }

        onOpened: {
            x = Math.round((parent.width - width) / 2)
        }

        onClosed: {
            x = -width
        }

        Rectangle {
            anchors.centerIn: parent
            width: 339
            height: 279
            color:"#DEF9FA"
            opacity: 1
            radius: 20
            Text {
                id: _view_party_teacher
                text: "Посещение мероприятия"
                color: "black"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 16
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
            }
            Text {
                id: _name_party_teacher
                text: "<<.......>>"
                color: "black"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 16
                anchors.top: _view_party_teacher.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
            }
            Rectangle {
                id: _cancelRec
                anchors.bottom: _endRec.top
                anchors.bottomMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                width: 169
                height: 49
                color:"#42F769"
                opacity: 1
                radius: 20
                Text {
                    text: "Отмененить"
                    color: "black"
                    font.family: montserratBoldItalic
                    font.italic: true
                    font.bold: true
                    font.pointSize: 16
                    anchors.centerIn: parent
                    wrapMode: Text.WordWrap
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _popup_close_adventure.close()
                    }
                }
            }
            Rectangle {
                id: _endRec
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                width: 169
                height: 49
                color:"#42F769"
                opacity: 1
                radius: 20
                Text {
                    text: "Завершить"
                    color: "black"
                    font.family: montserratBoldItalic
                    font.italic: true
                    font.bold: true
                    font.pointSize: 16
                    anchors.centerIn: parent
                    wrapMode: Text.WordWrap
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _popup_close_adventure.close()
                    }
                }
            }
        }
    }
    Popup {
        id:_popup_first
        parent: Overlay.overlay
        x:Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        width: 319
        height: 277
        modal: true
        visible: false

        Behavior on x {
            NumberAnimation {
                duration: 300
                easing.type: Easing.InOutQuad // Тип сглаживания
            }
        }

        onOpened: {
            x = Math.round((parent.width - width) / 2)
        }

        onClosed: {
            x = -width
        }

        Rectangle {
            anchors.centerIn: parent
            width: 339
            height: 297
            color:"#DEF9FA"
            opacity: 1
            radius: 20
            Text {
                id: _view_party
                text: "Посещение мероприятия"
                color: "black"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 16
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
            }
            Text {
                id: _name_party
                text: "<<.......>>"
                color: "black"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 16
                anchors.top: _view_party.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
            }
            Text {
                id: _date_party_title
                text: "Дата:"
                color: "black"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 16
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: _name_party.bottom
                anchors.topMargin: 10
                wrapMode: Text.WordWrap
            }
            Text {
                id: _date_party
                text: "10.02.25"
                color: "black"
                font.family: montserratMedium
                font.italic: true
                //font.Medium: true
                font.pointSize: 16
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.top: _date_party_title.bottom
                //anchors.topMargin: 10
                wrapMode: Text.WordWrap
            }
            Text {
                id: _place_party_title
                text: "Место проведения:"
                color: "black"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 16
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: _date_party.bottom
                anchors.topMargin: 20
                wrapMode: Text.WordWrap
            }
            Text {
                id: _place_party
                text: "ауд.7225"
                color: "black"
                font.family: montserratMedium
                font.italic: true
                //font.Medium: true
                font.pointSize: 16
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.top: _place_party_title.bottom
                //anchors.topMargin: 10
                wrapMode: Text.WordWrap
            }
            Rectangle {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter
                width: 169
                height: 49
                color:"#42F769"
                opacity: 1
                radius: 20

                Text {
                    text: "записаться"
                    color: "black"
                    font.family: montserratBoldItalic
                    font.italic: true
                    font.bold: true
                    font.pointSize: 16
                    anchors.centerIn: parent
                    wrapMode: Text.WordWrap
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _popup_second.open()
                    }
                }
            }
        }
    }
    Popup {
        id:_popup_second
        parent: Overlay.overlay
        x:Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        width: 319
        height: 277
        modal: true
        visible: false
        Rectangle {
            anchors.centerIn: parent
            width: 339
            height: 297
            color:"#DEF9FA"
            opacity: 1
            radius: 20
            Text {
                id: _complete_party1
                text: "Вы успешно записались на"
                color: "black"
                font.family: montserratMedium
                //font.bold: true
                //font.italic: true
                font.pointSize: 16
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
            }
            Text {
                id: _complete_party2
                text: "мероприятие"
                color: "black"
                font.family: montserratMedium
                //font.bold: true
                //font.italic: true
                font.pointSize: 16
                anchors.top: _complete_party1.bottom
                //anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
            }
            Text {
                id: _complete_party3
                text: "После его посещения"
                color: "black"
                font.family: montserratMedium
                //font.bold: true
                //font.italic: true
                font.pointSize: 16
                anchors.top: _complete_party2.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
            }
            Text {
                id: _complete_party4
                text: "вы получите"
                color: "black"
                font.family: montserratMedium
                //font.bold: true
                //font.italic: true
                font.pointSize: 16
                anchors.top:  _complete_party3.bottom
                //anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
            }
            Image {
                id:_amulet_second_popup_image
                source: "qrc:/svg/Small_amulet.svg"
                width: 55
                height: 55
                anchors.top: _complete_party4.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Rectangle {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                width: 84
                height: 49
                color:"#42F769"
                opacity: 1
                radius: 20
                Text {
                    text: "ок"
                    color: "black"
                    font.family: montserratBoldItalic
                    font.italic: true
                    font.bold: true
                    font.pointSize: 16
                    anchors.centerIn: parent
                    wrapMode: Text.WordWrap
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _popup_second.close()
                        _popup_first.close()
                    }
                }
            }
        }
    }
    Item {

        anchors.fill: parent

        Item {
            anchors.centerIn: parent
            width: 310
            height: 250

            Rectangle {
                id:_firstRec
                width: 310
                height: 70
                color: "#DEF9FA"
                radius: 20
                anchors.top: parent.top

                Rectangle {
                    width: 70
                    height: 70
                    color: "#66E782"
                    radius: 20
                    anchors.right: parent.right
                    Image {
                        id:_amulet_first_image
                        source: "qrc:/svg/Small_amulet.svg"
                        width: 55
                        height: 55
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            _stack.push(_amulets_Com)
                        }
                    }
                }
                Text {
                    text: "  Посещение\nмероприятия"
                    color: "black"
                    font.family: montserratBoldItalic
                    font.bold: true
                    font.italic: true
                    font.pointSize: 16
                    anchors.left: parent.left
                    anchors.leftMargin: 60
                    anchors.verticalCenter: parent.verticalCenter
                    wrapMode: Text.WordWrap

                }
                MouseArea {
                    width: 240
                    height: 70
                    anchors.left: parent.left
                    onClicked: {
                        if (p_User === "преподаватель") {_popup_close_adventure.open()}
                        else {_popup_first.open()}
                    }
                }
            }
            Rectangle {
                id:_secondRec

                width: 310
                height: 70
                color: "#DEF9FA"
                radius: 20
                anchors.top: _firstRec.bottom
                anchors.topMargin: 20

                Rectangle {
                    width: 70
                    height: 70
                    color: "#66E782"
                    radius: 20
                    anchors.right: parent.right
                    Image {
                        id:_amulet_second_image
                        source: "qrc:/svg/Average_amulet.svg"
                        width: 45
                        height: 55
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            _stack.push(_amulets_Com)
                        }
                    }
                }
                Text {
                    text: "  Принести\nхолодильник"
                    color: "black"
                    font.family: montserratBoldItalic
                    font.bold: true
                    font.italic: true
                    font.pointSize: 16
                    anchors.left: parent.left
                    anchors.leftMargin: 60
                    anchors.verticalCenter: parent.verticalCenter
                    wrapMode: Text.WordWrap

                }
                // MouseArea {
                //  width: 240
                //  height: 70
                //  anchors.left: parent.left
                //     onClicked: {
                //         _popup_first.open()
                //     }
                // }
            }
            Rectangle {
                id:_thirdRec

                width: 310
                height: 70
                color: "#DEF9FA"
                radius: 20
                anchors.top: _secondRec.bottom
                anchors.topMargin: 20

                Rectangle {
                    width: 70
                    height: 70
                    color: "#66E782"
                    radius: 20
                    anchors.right: parent.right
                    Image {
                        id:_amulet_third_image
                        source: "qrc:/svg/Large_amulet.svg"
                        width: 55
                        height: 55
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            _stack.push(_amulets_Com)
                        }
                    }
                }
                Text {
                    text: "Сходить за\nминералкой"
                    color: "black"
                    font.family: montserratBoldItalic
                    font.bold: true
                    font.italic: true
                    font.pointSize: 16
                    anchors.left: parent.left
                    anchors.leftMargin: 60
                    anchors.verticalCenter: parent.verticalCenter
                    wrapMode: Text.WordWrap

                }
                // MouseArea {
                //  width: 240
                //  height: 70
                //  anchors.left: parent.left
                //     onClicked: {
                //         _popup_first.open()
                //     }
                // }
            }
        }
        Rectangle {
            width: 310
            height: 40
            color: "#DEF9FA"
            radius: 20
            visible: (p_User === "преподаватель") ? true : false
            anchors {
                bottom: _back_Button.top
                bottomMargin: 20
                horizontalCenter: parent.horizontalCenter
            }
            Text {
                text: "Добавить путешествие"
                color: "black"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 16
                anchors.centerIn: parent
                wrapMode: Text.WordWrap
            }
            MouseArea {
             anchors.fill: parent
                onClicked: {
                    _popup_create_adventure.open()
                }
            }
        }
        Rectangle {
            id: _back_Button
            width: 260
            height: 47
            color: "#DEF9FA"
            radius: 20
            anchors {
                bottom: parent.bottom
                bottomMargin: 80
                horizontalCenter: parent.horizontalCenter
            }
            Text {
                text: "Назад"
                color: "black"
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 18
                anchors.centerIn: parent
                wrapMode: Text.WordWrap
            }
            MouseArea {
             anchors.fill: parent
                onClicked: {
                    _stack.pop()
                }
            }
        }
    }
}
