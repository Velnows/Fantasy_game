import QtQuick
import QtQuick.Controls.Basic

Rectangle {

    property int p_widthDarkerFon
    property int p_heightDarkerFon
    property int p_radiusDarkerFon

    property int p_width_second_canvas
    property string p_WHO_SignIn
    property int p_ctx_xMargin
    property int p_ctx_yMargin

    property string p_placeHolderText_codeGroup

    property bool p_visible_codeGroup
    property bool p_visible_elder_teacher
    property bool p_visiable_elder

    property string p_rootTitlePop

    property var str
    property int counterOne: 0
    property int counterTwo: 0
    property int counterThree: 0
    property int counterFour: 0
    property int counterFive: 0
    property bool p_activated: false

    function allValid()
    {
        if(p_WHO_SignIn === "студентика" && counterOne === 1 && counterTwo === 1 && counterThree === 1 && counterFour === 1)
        {
            p_activated = true
            _client.isHeadman = "false"
            _client.isTeacher = "false"

        } else if(p_WHO_SignIn === "старосты" && counterOne === 1 && counterTwo === 1
                  && counterThree === 1 && counterFour === 1 && counterFive === 1)
        {
            p_activated = true
            _client.isHeadman = "true"
            _client.isTeacher = "false"

        } else if(p_WHO_SignIn === "преподавателя" && counterOne === 1 && counterTwo === 1 && counterFour === 1)
        {
            p_activated = true
            _client.isHeadman = "false"
            _client.isTeacher = "true"
        } else {
            p_activated = false
        }
    }

    color: "transparent"

    Image {
        id: _imageFon
        anchors.fill: parent
        source: "qrc:/images/yandexart-fbvmb2523t3qi5diukok.png"
        fillMode: Image.PreserveAspectCrop

        Rectangle {
            id: _darkerForImageFon
            anchors.centerIn: parent
            width: p_widthDarkerFon
            height: p_heightDarkerFon
            radius: p_radiusDarkerFon
            color: "#252424"
            opacity: 0.65
        }

        Canvas {
            id: _signInBoldCanvas
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: _darkerForImageFon.top
                topMargin: 15
            }
            width: 220
            height: 40
            onPaint: {

                var ctx = getContext("2d");

                ctx.font = "28px '" + montserratMedium + "'"; // Шрифт и размер
                ctx.lineWidth = 9; // Ширина контура
                ctx.strokeStyle = "white"; // Цвет контура
                ctx.fillStyle = "black"; // Цвет заливки
                ctx.lineJoin = "round"; // Используйте "round" или "bevel"
                //ctx.miterLimit = 65; // Увеличьте значение радиуса
                ctx.strokeText("Регистрация", 10, 28); // Контур
                ctx.fillText("Регистрация", 10, 28); // Заливка
            }
        }

        Canvas {
            id: _signUpSecondBoldCanvas
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: _signInBoldCanvas.bottom
            }
            width: p_width_second_canvas
            height: 40
            onPaint: {

                var ctx = getContext("2d");

                ctx.font = "28px '" + montserratMedium + "'"; // Шрифт и размер
                ctx.lineWidth = 9; // Ширина контура
                ctx.strokeStyle = "white"; // Цвет контура
                ctx.fillStyle = "black"; // Цвет заливки
                ctx.lineJoin = "round"; // Используйте "round" или "bevel"
                //ctx.miterLimit = 65; // Увеличьте значение радиуса
                ctx.strokeText(p_WHO_SignIn, p_ctx_xMargin, p_ctx_yMargin); // Контур
                ctx.fillText(p_WHO_SignIn, p_ctx_xMargin, p_ctx_yMargin); // Заливка
            }
        }

        Column {
            id: _columnForSignUpStudent
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: _darkerForImageFon.top
                topMargin: 105
            }
            spacing: 10

            Rectangle {
                id: _nameInput
                anchors.horizontalCenter: parent.horizontalCenter
                width: 285
                height: 53
                radius: 10
                color: "white"
                opacity: 0.85

                TextField {
                    id: _nameTextInput
                    anchors.centerIn: parent
                    width: 285
                    height: 53
                    horizontalAlignment: TextEdit.AlignHCenter
                    verticalAlignment: TextEdit.AlignVCenter
                    color: "#5c5c5c"
                    placeholderText: "Введите ваше имя"
                    placeholderTextColor: "#5c5c5c"
                    font.family: montserratSemiBoldItalic
                    font.bold: true
                    font.italic: true
                    font.pointSize: 13
                    validator: RegularExpressionValidator {regularExpression: /[А-Я][а-я]{1,11}/}
                    background: Rectangle {
                        color: "transparent"
                    }

                    onEditingFinished: {
                        str = _nameTextInput.text
                        console.log(str)
                        _nameTextInput.color = "#2b2b2b"
                        _nameTextInput.font.pointSize = 15

                        if(counterOne === 0)
                        {
                            counterOne++
                        }
                        allValid()
                    }

                    onTextEdited: {
                        _nameTextInput.color = "#5c5c5c"
                        _nameTextInput.font.pointSize = 13

                        if(counterOne > 0)
                        {
                            counterOne--
                        }
                        allValid()
                    }
                }
            }

            Rectangle {
                id: _surnameInput
                anchors.horizontalCenter: parent.horizontalCenter
                width: 285
                height: 53
                radius: 10
                color: "white"
                opacity: 0.85

                TextField {
                    id: _surnameTextInput
                    anchors.centerIn: parent
                    width: 285
                    height: 53
                    horizontalAlignment: TextEdit.AlignHCenter
                    verticalAlignment: TextEdit.AlignVCenter
                    color: "#5c5c5c"
                    placeholderText: "Введите вашу фамилию"
                    placeholderTextColor: "#5c5c5c"
                    font.family: montserratSemiBoldItalic
                    font.bold: true
                    font.italic: true
                    font.pointSize: 13
                    validator: RegularExpressionValidator {regularExpression: /[А-Я][а-я]{1,14}/}
                    background: Rectangle {
                        color: "transparent"
                    }

                    onEditingFinished: {
                        str = _surnameTextInput.text
                        console.log(str)
                        _surnameTextInput.text = text
                        _surnameTextInput.color = "#2b2b2b"
                        _surnameTextInput.font.pointSize = 15

                        if(counterTwo === 0)
                        {
                            counterTwo++
                        }
                        allValid()
                    }

                    onTextEdited: {
                        _surnameTextInput.color = "#5c5c5c"
                        _surnameTextInput.font.pointSize = 13

                        if(counterTwo > 0)
                        {
                            counterTwo--
                        }
                        allValid()
                    }
                }
            }

            Rectangle {
                id: _nameGroup
                anchors.horizontalCenter: parent.horizontalCenter
                width: 285
                height: 53
                radius: 10
                color: "white"
                opacity: 0.85
                visible: p_visiable_elder

                TextField {
                    id: _nameGroupTextInput
                    anchors.centerIn: parent
                    width: 285
                    height: 53
                    horizontalAlignment: TextEdit.AlignHCenter
                    verticalAlignment: TextEdit.AlignVCenter
                    color: "#5c5c5c"
                    placeholderText: "Введите вашу группу"
                    placeholderTextColor: "#5c5c5c"
                    font.family: montserratSemiBoldItalic
                    font.bold: true
                    font.italic: true
                    font.pointSize: 13
                    validator: RegularExpressionValidator {regularExpression: /[А-Яа-я]{2,6}-[0-9]{2,3}/}
                    background: Rectangle {
                        color: "transparent"
                    }

                    onEditingFinished: {
                        str = _nameGroupTextInput.text
                        console.log(str)
                        _nameGroupTextInput.color = "#2b2b2b"
                        _nameGroupTextInput.font.pointSize = 15

                        if(counterFive === 0)
                        {
                            counterFive++
                        }
                        allValid()
                    }

                    onTextEdited: {
                        _nameGroupTextInput.color = "#5c5c5c"
                        _nameGroupTextInput.font.pointSize = 13

                        if(counterFive > 0)
                        {
                            counterFive--
                        }
                        allValid()
                    }
                }
            }

            Text {
                id: _infoForNameGroup
                anchors.horizontalCenter: parent.horizontalCenter
                visible: p_visiable_elder
                text: "*Пример: РП-234, мБАС-231, бРТ-222"
                color: "white"
                font.family: montserratSemiBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 9
            }

            Rectangle {
                id: _codeGroup
                anchors.horizontalCenter: parent.horizontalCenter
                width: 285
                height: 53
                radius: 10
                color: "white"
                opacity: 0.85
                visible: p_visible_codeGroup

                TextField {
                    id: _codeGroupTextInput
                    anchors.centerIn: parent
                    width: 285
                    height: 53
                    horizontalAlignment: TextEdit.AlignHCenter
                    verticalAlignment: TextEdit.AlignVCenter
                    color: "#5c5c5c"
                    placeholderText: p_placeHolderText_codeGroup
                    placeholderTextColor: "#5c5c5c"
                    font.family: montserratSemiBoldItalic
                    font.bold: true
                    font.italic: true
                    font.pointSize: 13
                    validator: RegularExpressionValidator {regularExpression: /[1-9]{1}[0-9]{5}/}
                    background: Rectangle {
                        color: "transparent"
                    }

                    onEditingFinished: {
                        str = _codeGroupTextInput.text
                        console.log(str)
                        _codeGroupTextInput.color = "#2b2b2b"
                        _codeGroupTextInput.font.pointSize = 15

                        if(counterThree === 0)
                        {
                            counterThree++
                        }
                        allValid()
                    }

                    onTextEdited: {
                        _codeGroupTextInput.color = "#5c5c5c"
                        _codeGroupTextInput.font.pointSize = 13

                        if(counterThree > 0)
                        {
                            counterThree--
                        }
                        allValid()
                    }
                }
            }

            Text {
                id: _infoForCodGroup
                anchors.horizontalCenter: parent.horizontalCenter
                visible: p_visiable_elder
                text: "*Код должен состоять из 6 цифр"
                color: "white"
                font.family: montserratSemiBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 9
            }

            Rectangle {
                id: _passwordConcoct
                anchors.horizontalCenter: parent.horizontalCenter
                width: 285
                height: 53
                radius: 10
                color: "white"
                opacity: 0.85

                TextField {
                    id: _passwordConcoctTextInput
                    anchors.centerIn: parent
                    width: 285
                    height: 53
                    horizontalAlignment: TextEdit.AlignHCenter
                    verticalAlignment: TextEdit.AlignVCenter
                    color: "#5c5c5c"
                    placeholderText: "Придумайте пароль"
                    placeholderTextColor: "#5c5c5c"
                    font.family: montserratSemiBoldItalic
                    font.bold: true
                    font.italic: true
                    font.pointSize: 13
                    validator: RegularExpressionValidator {regularExpression: /[0-9]{4}/}
                    background: Rectangle {
                        color: "transparent"
                    }
                    echoMode: TextInput.Password

                    onEditingFinished: {
                        str = _passwordConcoctTextInput.text
                        console.log(str)
                        _passwordConcoctTextInput.color = "#2b2b2b"
                        _passwordConcoctTextInput.font.pointSize = 15

                        if(counterFour === 0)
                        {
                            counterFour++
                        }
                        allValid()
                    }

                    onTextEdited: {
                        _passwordConcoctTextInput.color = "#5c5c5c"
                        _passwordConcoctTextInput.font.pointSize = 13

                        if(counterFour > 0)
                        {
                            counterFour--
                        }
                        allValid()
                    }
                }
            }

            Text {
                id: _infoForPasswordConcoct
                anchors.horizontalCenter: parent.horizontalCenter
                text: "*Пароль должен состоять из 4 цифр"
                color: "white"
                font.family: montserratSemiBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 9
            }

            Rectangle {
                id: _acceptButton
                anchors.horizontalCenter: parent.horizontalCenter
                width: 316
                height: 59
                radius: 20
                color: "white"
                opacity: 0.8
                border.width: 1
                border.color: "black"

                Text {
                    id: _acceptButtonText
                    anchors.centerIn: parent
                    text: "Подтвердить"
                    color: "black"
                    horizontalAlignment: Text.horizontalAlignment
                    font.family: montserratSemiBoldItalic
                    font.bold: true
                    font.italic: true
                    font.pointSize: 18
                }

                MouseArea {
                    id: _acceptButtonMouseArea
                    anchors.fill: parent 
                    enabled: p_enabled_MouseArea_LogIn
                    onClicked: {
                        if (p_activated === true)
                        {
                            if(p_WHO_SignIn === "преподавателя")
                            {
                                _client.squadCode = 0
                            } else {
                                _client.squadCode = _codeGroupTextInput.text
                            }

                            _client.slotConnecting()
                            _client.namePlayer = _nameTextInput.text
                            _client.surnamePlayer = _surnameTextInput.text
                            _client.myString = _passwordConcoctTextInput.text
                            if(p_WHO_SignIn === "старосты")
                            {
                                _client.squadName = _nameGroupTextInput.text
                                _client.setSquad()

                            }
                            _client.signInToClient()
                            _client.logInToClient()
                            _client.slotDisconnecting()

                            if(_client.regSuccess == true)
                            {
                                _stack.push(_greetingCom)
                                _client.slotConnecting()

                                if(p_WHO_SignIn !== "преподавателя")
                                {
                                    _client.getPlayerSquad()
                                }
                                _client.slotDisconnecting()

                                _root.title = "Приветсвие"
                                console.log(p_User)

                            } else if(_client.errorConnection == "Ошибка подключения") {
                                p_visiableErrorConnection = true
                                p_enabled_MouseArea_LogIn = false
                            }

                        } else {
                            _nameTextInput.placeholderTextColor = "red"
                            _surnameTextInput.placeholderTextColor = "red"
                            _nameGroupTextInput.placeholderTextColor = "red"
                            _codeGroupTextInput.placeholderTextColor = "red"
                            _passwordConcoctTextInput.placeholderTextColor = "red"
                        }
                    }
                }
            }

            Rectangle {
                id: _cancelButtonSignUp
                anchors.horizontalCenter: parent.horizontalCenter
                width: 260
                height: 47
                radius: 20
                color: "white"
                opacity: 0.8
                border.width: 1
                border.color: "black"

                Text {
                    id: _cancelButtonSignUpText
                    anchors.centerIn: parent
                    text: "отмена"
                    color: "black"
                    horizontalAlignment: Text.horizontalAlignment
                    font.family: montserratSemiBold
                    font.bold: true
                    font.pointSize: 18
                }

                MouseArea {
                    id: _cancelButtonSignUpMouseArea
                    anchors.fill: parent
                    enabled: p_enabled_MouseArea_LogIn
                    onClicked: {
                        _stack.pop()
                        _root.title = p_rootTitlePop
                        p_User = "студент"
                        _client.isHeadman = "false"
                        _client.isTeacher = "false"
                    }
                }
            }

            Canvas {
                id: _teacherCanvas
                anchors.horizontalCenter: parent.horizontalCenter
                width: 155
                height: 20
                onPaint: {
                    var ctx = getContext("2d");

                    ctx.font = "bold 16px '" + montserratSemiBold + "'"; // Шрифт и размер
                    ctx.lineWidth = 4; // Ширина контура
                    ctx.strokeStyle = "white"; // Цвет контура
                    ctx.fillStyle = "black"; // Цвет заливки
                    ctx.lineJoin = "bevel"; // Используйте "round" или "bevel"
                    //ctx.miterLimit = 15; // Увеличьте значение радиуса
                    ctx.strokeText("Я преподаватель", 5, 15); // Контур
                    ctx.fillText("Я преподаватель", 5, 15); // Заливка
                    ctx.textBaseline = "middle"
                }
                visible: p_visible_elder_teacher

                MouseArea {
                    id: _teacherCanvasMouseArea
                    anchors.fill: parent
                    enabled: p_enabled_MouseArea_LogIn
                    onClicked: {
                        _stack.push(_signInTeacherCom)
                        p_User = "преподаватель"
                        _root.title = "Регистрация преподавателя"
                        console.log("Выбрана регистрация преподавателя")
                    }
                }
            }

            Canvas {
                id: _elderCanvas
                anchors.horizontalCenter: parent.horizontalCenter
                width: 95
                height: 20
                onPaint: {
                    var ctx = getContext("2d");

                    ctx.font = "bold 16px '" + montserratSemiBold + "'"; // Шрифт и размер
                    ctx.lineWidth = 4; // Ширина контура
                    ctx.strokeStyle = "white"; // Цвет контура
                    ctx.fillStyle = "black"; // Цвет заливки
                    ctx.lineJoin = "bevel"; // Используйте "round" или "bevel"
                    //ctx.miterLimit = 15; // Увеличьте значение радиуса
                    ctx.strokeText("Я староста", 3, 15); // Контур
                    ctx.fillText("Я староста", 3, 15); // Заливка
                    ctx.textBaseline = "middle"
                }
                visible: p_visible_elder_teacher

                MouseArea {
                    id: _elderCanvasMouseArea
                    anchors.fill: parent
                    enabled: p_enabled_MouseArea_LogIn
                    onClicked: {
                        _stack.push(_signInElderCom)
                        p_User = "староста"
                        _root.title = "Регистрация старосты"
                        console.log("Выбрана регистрация старосты")
                    }
                }
            }
        }
    }
}
