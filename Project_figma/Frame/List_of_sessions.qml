import QtQuick
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects

Rectangle {

    color: "transparent"

    Image {
        id: _imageFon
        anchors.fill: parent
        source: "qrc:/images/List_of_sessions.png"
        fillMode: Image.PreserveAspectCrop
    }
    Canvas
    {
        id: _nameListGroup
        width: 300
        height: 70
        anchors
        {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            topMargin: 100
        }
        onPaint:
        {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, _nameListGroup.width, _nameListGroup.height);

            // var gradient = ctx.createLinearGradient(0, 30, 40, 100); // задаем координаты начала и конца градиента
            // gradient.addColorStop(0, "#39DE2B");
            // gradient.addColorStop(1, "#239219");

            // Настройка шрифта
            ctx.font = "bold italic 40px '" + montserratBlackItalic + "'";
            ctx.textAlign = "center";
            ctx.textBaseline = "middle";

            var x = _nameListGroup.width / 2;
            var y = _nameListGroup.height / 2;

            ctx.lineJoin = "round";
            ctx.miterLimit = 65;

            // Рисуем границу
            var textHeight = 16;
            ctx.lineWidth = 8;
            ctx.strokeStyle = "#2D292D";

            ctx.fillStyle = "#FFFFFF";
            ctx.strokeText(currentSquad, x, y );
            ctx.fillText(currentSquad, x, y);
        }
        layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: 5
            color: "#463C3C"
            radius: 10
            samples: 25
            spread: 0
        }
    }
    Rectangle
    {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 180
        width: 355
        height: 585
        color: "transparent"

        ListView
        {
            id: _listViewGroup
            anchors.fill: parent
            model: _listModelForCheckSession // Количество элементов в списке
            spacing: 26
            clip: true
            delegate: Rectangle
            {

                width: 311
                height: 65
                radius: 20

                anchors
                {
                    left: parent.left
                    leftMargin: 22
                }
                // border.color: "black"
                // border.width: 2
                color: "transparent"
                Rectangle
                {
                    id: _backgroundName
                    anchors.fill: parent
                    color: "#737070"
                    radius: parent.radius
                    opacity: 0.75
                    border.color: "black"
                    border.width: 2
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: _popup_presence.open()
                }

                Canvas
                {
                    id: _namePerson
                    width: 300
                    height: 70
                    anchors
                    {
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                    }
                    onPaint:
                    {
                        var ctx = getContext("2d");
                        ctx.clearRect(0, 0, _namePerson.width, _namePerson.height);

                        // var gradient = ctx.createLinearGradient(0, 30, 40, 100); // задаем координаты начала и конца градиента
                        // gradient.addColorStop(0, "#39DE2B");
                        // gradient.addColorStop(1, "#239219");

                        // Настройка шрифта
                        ctx.font = "bold italic 18px '" + montserratBlackItalic + "'";
                        ctx.textAlign = "center";
                        ctx.textBaseline = "middle";

                        var x = _namePerson.width / 2;
                        var y = _namePerson.height / 2;

                        ctx.lineJoin = "round";
                        ctx.miterLimit = 65;

                        // Рисуем границу
                        var textHeight = 12;
                        ctx.lineWidth = 6;
                        ctx.strokeStyle = "black";

                        ctx.fillStyle = "#E8E124";
                        ctx.strokeText(l_nameStudent, x, y );
                        ctx.fillText(l_nameStudent, x, y);
                    }
                    layer.enabled: true
                    layer.effect: DropShadow {
                        verticalOffset: 5
                        color: "#463C3C"
                        radius: 10
                        samples: 25
                        spread: 0
                    }
                }
                Canvas
                {
                    id: _ordinalNumberPerson
                    width: 300
                    height: 70
                    anchors
                    {
                        top: parent.top
                        left: parent.left
                        leftMargin: 5
                        topMargin: 3
                    }
                    onPaint:
                    {
                        var ctx = getContext("2d");
                        ctx.clearRect(0, 0, _ordinalNumberPerson.width, _ordinalNumberPerson.height);

                        // var gradient = ctx.createLinearGradient(0, 30, 40, 100); // задаем координаты начала и конца градиента
                        // gradient.addColorStop(0, "#39DE2B");
                        // gradient.addColorStop(1, "#239219");

                        // Настройка шрифта
                        ctx.font = "bold italic 22px '" + montserratBlackItalic + "'";
                        ctx.textAlign = "center";
                        ctx.textBaseline = "middle";

                        var x = 20;
                        var y = 32;

                        ctx.lineJoin = "round";
                        ctx.miterLimit = 65;

                        // Рисуем границу
                        var textHeight = 12;
                        ctx.lineWidth = 6;
                        ctx.strokeStyle = "black";

                        ctx.fillStyle = "#FB3984";
                        ctx.strokeText(index + 1, x, y );
                        ctx.fillText(index + 1, x, y);
                    }
                    layer.enabled: true
                    layer.effect: DropShadow {
                        verticalOffset: 5
                        color: "#463C3C"
                        radius: 10
                        samples: 25
                        spread: 0
                    }
                }
                Popup
                {
                    id: _popup_presence
                    parent: Overlay.overlay
                    x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
                    y: -height // Начальная позиция выше экрана
                    width: 250
                    modal: true
                    height: 141
                    visible: false

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

                    onClosed:
                    {
                        y = -height // Уводим за пределы экрана вверх
                    }
                    Rectangle
                    {
                        anchors.centerIn: parent
                        width: 260
                        height: 151
                        color: "#E0B267"
                        radius: 20
                        opacity: 1
                        Text
                        {
                            id: _nameStudent
                            //width: parent.width
                            anchors.top: parent.top
                            anchors.topMargin: 10
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: l_nameStudent
                            color: "#33363F"
                            font.family: montserratBoldItalic
                            font.bold: true
                            font.italic: true
                            font.pointSize: 14
                            style: Text.Outline
                            styleColor: "white"
                            wrapMode: Text.WordWrap
                        }
                        Text
                        {
                            anchors.top: _nameStudent.bottom
                            anchors.topMargin: 5
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "присутствует?"
                            color: "#33363F"
                            font.family: montserratBoldItalic
                            font.bold: true
                            font.italic: true
                            font.pointSize: 14
                            style: Text.Outline
                            styleColor: "white"
                        }
                        Item
                        {
                            width: 205
                            height: 40
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 15
                            anchors.horizontalCenter: parent.horizontalCenter
                            Rectangle
                            {
                                anchors.left: parent.left
                                width: 95
                                height: 40
                                radius: 15
                                color: "white"
                                Text
                                {
                                    anchors.centerIn: parent
                                    text: "Да"
                                    font.family: montserratSemiBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 14
                                    color: "black"
                                }
                                MouseArea
                                {
                                    anchors.fill: parent
                                    onClicked: {
                                        _popup_presence.close()
                                        _backgroundName.color = "#3EE130"
                                        l_check = "true"
                                    }
                                }
                            }
                            Rectangle
                            {
                                anchors.right: parent.right
                                width: 95
                                height: 40
                                radius: 15
                                color: "white"
                                Text
                                {
                                    anchors.centerIn: parent
                                    text: "Нет"
                                    font.family: montserratSemiBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 14
                                    color: "black"
                                }
                                MouseArea
                                {
                                    anchors.fill: parent
                                    onClicked:
                                    {
                                        _popup_presence.close()
                                        _backgroundName.color = "#FF0000"
                                        l_check = "false"
                                    }
                                }
                            }
                        }
                    }
                }
                Rectangle
                {
                    id: _checkBox
                    width: 50
                    height: 50
                    anchors
                    {
                        top: parent.top
                        right: parent.right
                        rightMargin: 8
                        topMargin: 8
                    }
                    radius: 10
                    color: "#C2C2C2"
                    Image
                    {
                        id: _checkTrue
                        anchors.centerIn: parent
                        source: "qrc:/svg/Check_true.svg"
                        visible:
                        {
                            if(l_check === "true") return true
                            else return false
                        }
                    }
                    Image
                    {
                        id: _checkFalse
                        anchors.centerIn: parent
                        source: "qrc:/svg/Check_false.svg"
                        visible:
                        {
                            if(l_check === "false") return true
                            else return false
                        }
                    }
                }
            }
        }
        Button
        {
            anchors
            {
                bottom: parent.bottom
                bottomMargin: 20
                left: parent.left
                leftMargin: 25
            }
            width: 150
            height: 50
            text: "Назад"
            onClicked:
            {
                _stack.pop()
                _listModelForCheckSession.clear()
            }
        }
        Button
        {
            anchors
            {
                bottom: parent.bottom
                bottomMargin: 20
                right: parent.right
                rightMargin: 25
            }
            width: 150
            height: 50
            text: "Подтв"
            onClicked:
            {
                _client.slotConnecting()
                for (let i = 0; i < _listModelForCheckSession.count; i++)
                {
                    for ( let j = 0; j < _client.allStagesStepsArr.length; j += 2)
                    {
                        currentStage = _client.allStagesStepsArr[j]


                        Component.onCompleted
                        {
                            parts = _listModelForCheckSession.get(i).l_nameStudent;
                            myParts = parts.split(" ")
                        }
                        if (_listModelForCheckSession.get(i).l_check === "true")
                        {
                            _client.updatePlayerStepStats("1", myParts[0], myParts[1], "Лекция", currentStage, currentChapter, currentTail)
                        }
                        else
                        {
                            _client.updatePlayerStepStats("-3", myParts[0], myParts[1], "Лекция", currentStage, currentChapter, currentTail)
                        }
                        if (_client.result === true)
                        {

                        }
                        else
                        {
                            break;
                        }
                    }
                }
                _stack.pop()
                _listModelForCheckSession.clear()
            }
        }
    }
}
