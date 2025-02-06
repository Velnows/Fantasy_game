import QtQuick
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects


Rectangle {

    color: "transparent"

    Image {
        id: _imageFon
        anchors.fill: parent
        source: "qrc:/images/ChaptersFon.png"
        fillMode: Image.PreserveAspectCrop
    }
    Text {
        text: "Редактор этапов"
        color: "white"
        font.family: montserratBoldItalic
        font.bold: true
        font.italic: true
        font.pointSize: 24
        style: Text.Outline
        styleColor: "black"
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
    }
    ListView {
        id: _listViewStages
        width: parent.width

        height: 410
        clip: true
        model: _listModelAddStage
        orientation: Qt.Horizontal
        spacing: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10

        delegate: Item {
            id: _itemStage
            width: 300
            height: 410

            // Прямоугольник для фона с прозрачностью
            Rectangle {
                id: _itemRect
                width: parent.width
                height: parent.height
                radius: 15
                color: "#6F1450"
                opacity: 0.9
            }

            // Прямоугольник для содержания
            Rectangle {
                width: parent.width
                height: parent.height
                color: "transparent"
                anchors.fill: parent

                Item {
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        text: "Этап " + (index+1)
                        color: "white"
                        font.family: montserratBoldItalic
                        font.bold: true
                        font.italic: true
                        font.pointSize: 22
                        style: Text.Outline
                        styleColor: "black"
                        anchors.top: parent.top
                        anchors.topMargin: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        wrapMode: Text.WordWrap
                    }
                    Item {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 270
                        height: 266
                        Rectangle {
                            id: _addNameStage
                            width: 270
                            height: 50
                            color: "#D9D9D9"
                            radius: 10
                            anchors.top: parent.top
                            TextField {
                                id:  _nameTextStage
                                anchors.centerIn: parent
                                width: 265
                                height: 40
                                horizontalAlignment: TextEdit.AlignHCenter
                                verticalAlignment: TextEdit.AlignVCenter
                                color: "#5c5c5c"
                                placeholderText: "Введите название..."
                                placeholderTextColor: "#5c5c5c"
                                font.family: montserratSemiBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 13
                                text: l_nameStage
                                background: Rectangle {
                                    color: "transparent"
                                }
                                onEditingFinished: {
                                    _nameTextStage.color = "#2b2b2b"
                                    _nameTextStage.font.pointSize = 15
                                }
                                onTextEdited: {
                                    _nameTextStage.color = "#5c5c5c"
                                    _nameTextStage.font.pointSize = 13
                                     l_nameStage = _nameTextStage.text
                                    console.log(l_nameStage)

                                    //modelData.l_nameStage = _nameTextStage.text
                                }
                            }
                        }
                        Rectangle {
                            id: _addLectureStage
                            width: 270
                            height: 50
                            color: (l_lection === false) ? "#D9D9D9" : "#66E782"
                            radius: 15
                            anchors.top:  _addNameStage.bottom
                            anchors.topMargin: 22

                            Text {
                                text: "Лекционное занятие"
                                color: "black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 16
                                anchors.centerIn: parent
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    if(l_lection === false)
                                    {
                                        l_lection = true
                                    } else {
                                        l_lection = false
                                    }
                                }
                            }
                        }
                        Rectangle {
                            id: _addPracStage
                            width: 270
                            height: 50
                            color: (l_practica === false) ? "#D9D9D9" : "#66E782"
                            radius: 15
                            anchors.top:  _addLectureStage.bottom
                            anchors.topMargin: 22

                            Text {
                                text: "Практическое\nзанятие"
                                color: "black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 16
                                anchors.centerIn: parent
                                lineHeight: 0.85
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    if(l_practica === false)
                                    {
                                        l_practica = true
                                    } else {
                                        l_practica = false
                                    }
                                }
                            }
                        }
                        Rectangle {
                            id: _addLabStage
                            width: 270
                            height: 50
                            color: (l_laba === false) ? "#D9D9D9" : "#66E782"
                            radius: 15
                            anchors.top:  _addPracStage.bottom
                            anchors.topMargin: 22

                            Text {
                                text: "Лабораторная\nработа"
                                color: "black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 16
                                anchors.centerIn: parent
                                lineHeight: 0.85
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    if(l_laba === false)
                                    {
                                        l_laba = true
                                    } else {
                                        l_laba = false
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: _buttonAccept
        width: 260
        height: 47
        color: "#D9D9D9"
        radius: 15
        border.color: "black"
        border.width: 1
        anchors.top: _listViewStages.bottom
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            text: "Подтвердить"
            color: "black"
            font.family: montserratBoldItalic
            font.bold: true
            font.italic: true
            font.pointSize: 16
            anchors.centerIn: parent
            layer.effect: DropShadow {
                verticalOffset: 2.5
                color: "#666"
                radius: 5
                samples: 11
                spread: 0
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {

                howManyChoseStage()

                if(counterStage === _listModelAddStage.count)
                {
                    _client.slotConnecting()

                    for(let i = 0; i < _listModelAddStage.count; i++)
                    {
                        _client.setStage(_listModelAddStage.get(i).l_nameStage, currentChapter, currentTail)

                        if(_client.result === true)
                        {
                            if(_listModelAddStage.get(i).l_lection === true)
                            {
                                _client.beginLection("Лекция", _listModelAddStage.get(i).l_nameStage, currentChapter, currentTail)
                            }
                            if(_listModelAddStage.get(i).l_practica === true)
                            {
                                _client.beginLection("Практика", _listModelAddStage.get(i).l_nameStage, currentChapter, currentTail)
                            }
                            if(_listModelAddStage.get(i).l_laba === true)
                            {
                                _client.beginLection("Лабораторная", _listModelAddStage.get(i).l_nameStage, currentChapter, currentTail)
                            }

                            // for(let j = 0; j < _client.tailSquadsArr.length; j++)
                            // {
                            //     if(_listModelAddStage.get(i).l_lection === true)
                            //     {
                            //         _client.addSquadToStep(_client.tailSquadsArr[j], "Лекция",
                            //         _listModelAddStage.get(i).l_nameStage, currentChapter, currentTail)
                            //     }
                            //     if(_listModelAddStage.get(i).l_practica === true)
                            //     {
                            //         _client.addSquadToStep(_client.tailSquadsArr[j], "Практика",
                            //         _listModelAddStage.get(i).l_nameStage, currentChapter, currentTail)
                            //     }
                            //     if(_listModelAddStage.get(i).l_laba === true)
                            //     {
                            //         _client.addSquadToStep(_client.tailSquadsArr[j], "Лабораторная",
                            //         _listModelAddStage.get(i).l_nameStage, currentChapter, currentTail)
                            //     }
                            // }

                        } else {
                            console.log("Ошибка при добавлении этапа: " + _listModelAddStage.get(i).l_nameStage)
                        }
                    }

                    _client.slotDisconnecting()
                    _listModelAddStage.clear()

                    _stack.pop()
                    _root.title = "Редактор глав"
                } else {
                    console.log("Не все этапы заполнены")
                }
                counterStage = 0
            }
        }
    }
    Rectangle {
        id: _buttonCancel
        width: 260
        height: 47
        color: "#D9D9D9"
        radius: 15
        border.color: "black"
        border.width: 1
        anchors.top: _buttonAccept.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            text: "Отмена"
            color: "black"
            font.family: montserratBoldItalic
            font.bold: true
            font.italic: true
            font.pointSize: 16
            anchors.centerIn: parent
            layer.effect: DropShadow {
                verticalOffset: 2.5
                color: "#666"
                radius: 5
                samples: 11
                spread: 0
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                _stack.pop()
                _root.title = "Редактор глав"
                _listModelAddStage.clear()
            }
        }
    }
}
