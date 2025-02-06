import QtQuick
import QtQuick.Controls.Basic

Rectangle {

    color: "transparent"

    Image {
        id: _imageFon
        anchors.fill: parent
        source: "qrc:/images/Fairy_tales.png"
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        anchors {
            top: parent.top
            topMargin: 40
            bottom: parent.bottom
            bottomMargin: 285
        }
        anchors.horizontalCenter: parent.horizontalCenter
        width: 355
        height: 750
        color: "transparent"

        ListView {
            id: _listViewFairyTales
            anchors.fill: parent
            model: _client.currentTailsArr.length
            spacing: 30
            clip: true
            delegate: Button {
                width: 355
                height: 86
                text: _client.currentTailsArr[index]
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 24
                onClicked: {
                    currentTail = _client.currentTailsArr[index]
                    _client.myString = currentTail
                    _client.slotConnecting()
                    _client.getTailChapters()
                    _client.getSquadsInTail(currentTail)
                    _client.slotDisconnecting()
                    _stack.push(_chaptersTeacherCom)
                }
                background: Rectangle {
                    color: "#D9D9D9"
                    radius: 25
                    border.width: 1
                    border.color: "black"
                    opacity: 0.6
                }
            }
            footer: Item {
                width: 355
                height: 116

                Rectangle {
                    anchors.bottom: parent.bottom
                    width: 355
                    height: 86
                    radius: 25
                    color: "transparent"
                    border.color: "white"
                    border.width: 2

                    Rectangle {
                        anchors.fill: parent
                        width: 355
                        height: 86
                        radius: 25
                        color: "#BACEAD"
                        opacity: 0.3
                    }

                    Image
                    {
                        anchors.centerIn: parent
                        source: "qrc:/svg/Plus_on_tales.svg"
                        visible: true
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {

                            _popup_add.open()

                            _client.slotConnecting()
                            _client.getAllSquads()
                            _client.slotDisconnecting()

                            for(let i = 0; i <= _client.allSquadsArr.length-1; i++)
                            {
                                _listModelAllGroup.append({"l_name" : _client.allSquadsArr[i], "l_choose":false})
                                console.log(_listModelAllGroup.get(i).l_name)
                            }

                        }
                    }
                }
            }
            Popup
            {
                id: _popup_add
                parent: Overlay.overlay
                x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
                y: -height // Начальная позиция выше экрана
                width: 320
                height: 290
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
                    _listViewFairyTales.enabled = false
                    y = Math.round((parent.height - height) / 2) // Центрирование по вертикали при открытии
                }

                onClosed:
                {
                    _talesTextInput.focus = false
                    _listViewFairyTales.enabled = true
                    y = -height // Уводим за пределы экрана вверх
                    _listModelAllGroup.clear()
                }

                Rectangle
                {
                    id: _rectForPopupAdd
                    anchors.centerIn: parent
                    width: 340
                    height: 300
                    radius: 30
                    color: "#B487AF"
                    opacity: 1
                    border.color: "black"
                    border.width: 1

                    Canvas
                    {
                        id: _canvasNamePopupAdd
                        width: 250
                        height: 90
                        anchors.top: parent.top
                        anchors.topMargin: 13
                        anchors.left: parent.left
                        anchors.leftMargin: 50
                        onPaint:
                        {
                            var ctx = getContext("2d");
                            ctx.clearRect(0, 0, _canvasNamePopupAdd.width, _canvasNamePopupAdd.height);

                            // var gradient = ctx.createLinearGradient(0, 30, 40, 100); // задаем координаты начала и конца градиента
                            // gradient.addColorStop(0, "#39DE2B");
                            // gradient.addColorStop(1, "#239219");

                            // Настройка шрифта
                            ctx.font = "bold italic 32px '" + montserratBoldItalic + "'";
                            ctx.textAlign = "center";
                            ctx.textBaseline = "middle";

                            var x = _canvasNamePopupAdd.width / 2;
                            var y = _canvasNamePopupAdd.height / 2;

                            ctx.lineJoin = "round";
                            ctx.miterLimit = 65;

                            // Рисуем границу
                            var textHeight = 16;
                            ctx.lineWidth = 8;
                            ctx.strokeStyle = "#2D292D";

                            ctx.fillStyle = "#FFFFFF";
                            ctx.strokeText("Добавление", x, y );
                            ctx.fillText("Добавление", x, y);
                            ctx.strokeText("сказки", x , y + 30 );
                            ctx.fillText("сказки", x, y + 30);
                        }
                    }

                    Rectangle
                    {
                        id: _talesInput
                        anchors
                        {
                            top: parent.top
                            topMargin: 120
                            horizontalCenter: parent.horizontalCenter
                        }
                        width: 290
                        height: 53
                        radius: 15
                        border.color: "black"
                        border.width: 1

                        color: "transparent"

                        Rectangle
                        {
                            anchors.fill: parent
                            radius: 15
                            opacity: 0.85
                            color: "white"
                            border.color: "black"
                            border.width: 1
                        }
                        TextField
                        {
                            id: _talesTextInput
                            anchors.fill: parent
                            width: 285
                            height: 53
                            horizontalAlignment: TextEdit.AlignHCenter
                            verticalAlignment: TextEdit.AlignVCenter
                            color: "#5c5c5c"
                            placeholderText: "Введите название сказки"
                            placeholderTextColor: "#5c5c5c"
                            font.family: montserratSemiBoldItalic
                            font.bold: true
                            font.italic: true
                            font.pointSize: 13
                            validator: RegularExpressionValidator {regularExpression: /[А-Яа-я]{2}[А-Я а-я0-9]{0, 18}/}
                            background: Rectangle {
                                color: "transparent"
                            }

                            onEditingFinished:
                            {
                                _talesTextInput.text = text
                                _talesTextInput.color = "#2b2b2b"
                                _talesTextInput.font.pointSize = 15
                            }

                            onTextEdited:
                            {
                                _talesTextInput.color = "#5c5c5c"
                                _talesTextInput.font.pointSize = 13
                            }
                        }
                    }
                    Rectangle
                    {
                        id: _button_aproved
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 17
                        anchors.right: parent.right
                        anchors.rightMargin: 17

                        width: 145
                        height: 45
                        radius: 10
                        color: "#D9D9D9"
                        border.color: "black"
                        border.width: 1

                        Text
                        {
                            id: _txtForButAproved
                            text: "Далее"
                            color: "#33363F"
                            font.family: montserratBoldItalic
                            font.bold: true
                            font.italic: true
                            font.pointSize: 13
                            anchors.centerIn: parent
                            wrapMode: Text.WordWrap
                        }

                        MouseArea
                        {
                            id: _mouseAreaPopupAddAproved
                            anchors.fill: parent
                            onClicked:
                            {
                                if(_talesTextInput.length >= 2 && _txtForButAproved.text === "Далее")
                                {
                                    _client.myString = _talesTextInput.text
                                    _button_aproved.visible = false
                                    _txtForButAproved.text = "Подтвердить"
                                    _txtForButBack.text = "Назад"
                                    _talesInput.visible = false
                                    _rectForPopAddListViewGroup.visible = true
                                    _rectForPopupAdd.height = _rectForPopupAdd.height*2

                                } else if(_txtForButAproved.text === "Подтвердить") {
                                    counetrGroup = _listModelAllGroup.count
                                    _client.slotConnecting()
                                    _client.setTail()
                                    _client.getTeacherTails()

                                    if(_client.result === true)
                                    {
                                        for(let i = 0; i <= _listModelAllGroup.count-1; i++)
                                        {
                                            if(_listModelAllGroup.get(i).l_choose === true)
                                            {
                                                _client.addSquadToTail(_listModelAllGroup.get(i).l_name)

                                                if(_client.result === true)
                                                {
                                                    console.log("Группа " + _listModelAllGroup.get(i).l_name + " успешно добавлена")
                                                } else {
                                                    console.log("Ошибка при добавлении группы " + _listModelAllGroup.get(i).l_name)
                                                }
                                            }
                                        }
                                        _popup_add.close()

                                    } else {
                                        console.log("Ошибка при создании сказки")
                                    }
                                    _client.slotDisconnecting()
                                    _listViewFairyTales.update()
                                }
                            }
                        }
                    }

                    Rectangle {
                        id: _rectForPopAddListViewGroup
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors {
                            top: _canvasNamePopupAdd.bottom
                            topMargin: 17
                            bottom: _button_aproved.top
                            bottomMargin: 17
                        }
                        visible: false
                        width: 235
                        color: "#D9D9D9"
                        radius: 25

                        Rectangle {
                            anchors.top: parent.top
                            anchors.topMargin: 17
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 17
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: 200
                            color: "transparent"

                            ListView {
                                id: _listViewGroupForPopupAdd
                                anchors.fill: parent
                                model: _listModelAllGroup
                                clip: true
                                spacing: 10
                                delegate: Rectangle {
                                    width: 200
                                    height: 65
                                    color: (l_choose === false) ? "#8a8a8a" : "#30b30b"
                                    radius: 20
                                    Text {
                                        text: l_name
                                        color: "white"
                                        font.family: montserratBoldItalic
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 20
                                        style: Text.Outline
                                        styleColor: "black"
                                        anchors.centerIn: parent
                                        wrapMode: Text.WordWrap
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            if(l_choose === false)
                                            {
                                                l_choose = true
                                            } else {l_choose = false}
                                            howManyChoseGroup()
                                            if(counetrGroup > 0)
                                            {
                                                _button_aproved.visible = true
                                            } else {
                                                _button_aproved.visible = false
                                            }
                                            counetrGroup = _listModelAllGroup.count
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Rectangle
                    {
                        id: _button_back
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 17
                        anchors.left: parent.left
                        anchors.leftMargin: 17

                        width: 145
                        height: 45
                        radius: 10
                        color: "#D9D9D9"
                        border.color: "black"
                        border.width: 1

                        Text
                        {
                            id: _txtForButBack
                            text: "Отмена"
                            color: "#33363F"
                            font.family: montserratBoldItalic
                            font.bold: true
                            font.italic: true
                            font.pointSize: 13
                            anchors.centerIn: parent
                            wrapMode: Text.WordWrap
                        }

                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked:
                            {
                                if(_txtForButBack.text === "Отмена")
                                {
                                    _talesTextInput.text = ""
                                    _popup_add.close()

                                } else {
                                    counetrGroup = _listModelAllGroup.count
                                    _button_aproved.visible = true
                                    _txtForButAproved.text = "Далее"
                                    _txtForButBack.text = "Отмена"
                                    _talesInput.visible = true
                                    _rectForPopAddListViewGroup.visible = false
                                    _rectForPopupAdd.height = _rectForPopupAdd.height/2
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

