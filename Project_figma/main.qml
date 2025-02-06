import QtQuick
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects
import "Frame"
import "Buttons"
import "Canvas"
import ConnectionToServer 1.0

Window {
    id: _root
    width: 393
    height: 852
    visible: true
    color: "lightblue"
    title: "Начальное окно"

    readonly property string montserratBlack: montserratBlackFont.name
    readonly property string montserratBlackItalic: montserratBlackItalicFont.name
    readonly property string montserratBold: montserratBoldFont.name
    readonly property string montserratBoldItalic: montserratBoldItalicFont.name
    readonly property string montserratExtraBold: montserratExtraBoldFont.name
    readonly property string montserratExtraBoldItalic: montserratExtraBoldItalicFont.name
    readonly property string montserratExtraLight: montserratExtraLightFont.name
    readonly property string montserratExtraLightItalic: montserratExtraLightItalicFont.name
    readonly property string montserratItalic: montserratItalicFont.name
    readonly property string montserratLight: montserratLightFont.name
    readonly property string montserratLightItalic: montserratLightItalicFont.name
    readonly property string montserratMedium: montserratMediumFont.name
    readonly property string montserratMediumItalic: montserratMediumItalicFont.name
    readonly property string montserratRegular: montserratRegularFont.name
    readonly property string montserratSemiBold: montserratSemiBoldFont.name
    readonly property string montserratSemiBoldItalic: montserratSemiBoldItalicFont.name
    readonly property string montserratThin: montserratThinFont.name
    readonly property string montserratThinItalic: montserratThinItalicFont.name
    readonly property string mrsSheppardsRegular: mrsSheppardsRegularFont.name

    FontLoader { id: montserratBlackFont; source: "qrc:/TTF/Montserrat-Black.ttf" }
    FontLoader { id: montserratBlackItalicFont; source: "qrc:/TTF/Montserrat-BlackItalic.ttf" }
    FontLoader { id: montserratBoldFont; source: "qrc:/TTF/Montserrat-Bold.ttf" }
    FontLoader { id: montserratBoldItalicFont; source: "qrc:/TTF/Montserrat-BoldItalic.ttf" }
    FontLoader { id: montserratExtraBoldFont; source: "qrc:/TTF/Montserrat-ExtraBold.ttf" }
    FontLoader { id: montserratExtraBoldItalicFont; source: "qrc:/TTF/Montserrat-ExtraBoldItalic.ttf" }
    FontLoader { id: montserratExtraLightFont; source: "qrc:/TTF/Montserrat-ExtraLight.ttf" }
    FontLoader { id: montserratExtraLightItalicFont; source: "qrc:/TTF/Montserrat-ExtraLightItalic.ttf" }
    FontLoader { id: montserratItalicFont; source: "qrc:/TTF/Montserrat-Italic.ttf" }
    FontLoader { id: montserratLightFont; source: "qrc:/TTF/Montserrat-Light.ttf" }
    FontLoader { id: montserratLightItalicFont; source: "qrc:/TTF/Montserrat-LightItalic.ttf" }
    FontLoader { id: montserratMediumFont; source: "qrc:/TTF/Montserrat-Medium.ttf" }
    FontLoader { id: montserratMediumItalicFont; source: "qrc:/TTF/Montserrat-MediumItalic.ttf" }
    FontLoader { id: montserratRegularFont; source: "qrc:/TTF/Montserrat-Regular.ttf" }
    FontLoader { id: montserratSemiBoldFont; source: "qrc:/TTF/Montserrat-SemiBold.ttf" }
    FontLoader { id: montserratSemiBoldItalicFont; source: "qrc:/TTF/Montserrat-SemiBoldItalic.ttf" }
    FontLoader { id: montserratThinFont; source: "qrc:/TTF/Montserrat-Thin.ttf" }
    FontLoader { id: montserratThinItalicFont; source: "qrc:/TTF/Montserrat-ThinItalic.ttf" }
    FontLoader { id: mrsSheppardsRegularFont; source: "qrc:/TTF/MrsSheppards-Regular.ttf" }

    property var arr_1: []
    property var password: []
    property bool p_visiableErrorConnection: false
    property bool p_enabled_MouseArea_LogIn: true
    property string currentTail: ""
    property string currentChapter: ""
    property string currentStage: ""
    property string currentSquad: ""
    property string currentGroupForRaitingPlayer: ""
    property string p_User: "студент"
    property real p_rootWidth: _root.width
    property real p_rootHeight: _root.height

    property bool p_visibleMenuBar
    property int p_topMarginMenuBar: 62
    property color p_colorMenuBar: "#D9D9D9"
    property int p_borderWidthMenuBar: 0
    property color p_borderColorMenuBar: "#812F13"
    property string p_sourceBestiary: "qrc:/svg/Bestiariy.svg"
    property string p_sourceQuests: "qrc:/svg/Quest_Off.svg"
    property string p_sourceGroup: "qrc:/svg/Group_Off.svg"
    property string p_sourcePersonalCab: "qrc:/svg/Personal_cabinet.svg"
    property bool p_enabled_MouseArea_MenuBar_Back: true
    property bool p_enabled_MouseArea_MenuBar_Bestiary: true
    property bool p_enabled_MouseArea_MenuBar_Quest: true
    property bool p_enabled_MouseArea_MenuBar_Group: true
    property bool p_enabled_MouseArea_MenuBar_PersonalCab: true

    ConnectionToServer {
        id: _client
    }

    ListModel {
        id: _listModelAllGroup
    }
    property int counetrGroup: _listModelAllGroup.count
    function howManyChoseGroup()
    {
        for(let i = _listModelAllGroup.count-1; i >= 0; i--)
        {
            if(_listModelAllGroup.get(i).l_choose === true)
            {

            } else {
                counetrGroup--
            }
        }
    }

    ListModel {
        id: _listModelAddStage
    }
    property int counterStage: 0
    function howManyChoseStage()
    {
        for(let i = 0; i < _listModelAddStage.count; i++)
        {
            if(_listModelAddStage.get(i).l_nameStage !== "" && (_listModelAddStage.get(i).l_lection === true ||
             _listModelAddStage.get(i).l_practica === true || _listModelAddStage.get(i).l_laba === true))
            {
                counterStage++
            }
        }
    }

    ListModel
    {
        id: _listModelStageSteps
    }

    ListModel
    {
        id: _listModelForCheckSession
    }
    property string parts: ""
    property var myParts: []

    ListModel
    {
        id: _listModelSquads
    }

    ListModel {
        id: _listModelRaces
        ListElement{
            l_nameRace: "Помойная крыса"
            l_source: "qrc:/images/Races/Krisa.png"
        }
        ListElement{
            l_nameRace: "Дракон"
            l_source: "qrc:/images/Races/Dragon.png"
        }
        ListElement{
            l_nameRace: "Бот"
            l_source: "qrc:/images/Races/Bot.png"
        }
        ListElement{
            l_nameRace: "Единорог"
            l_source: "qrc:/images/Races/Unicorn.png"
        }
        ListElement{
            l_nameRace: "Змей-Горыныч"
            l_source: "qrc:/images/Races/Gorynych.png"
        }
        ListElement{
            l_nameRace: "Василиск"
            l_source: "qrc:/images/Races/Vasilisk.png"
        }
        ListElement{
            l_nameRace: "Водяной"
            l_source: "qrc:/images/Races/Vodynoi.png"
        }
        ListElement{
            l_nameRace: "Русалка"
            l_source: "qrc:/images/Races/Rusalka.png"
        }
        ListElement{
            l_nameRace: "Тролль"
            l_source: "qrc:/images/Races/Troll.png"
        }
        ListElement{
            l_nameRace: "Черт"
            l_source: "qrc:/images/Races/Chert.png"
        }
        ListElement{
            l_nameRace: "Упырь"
            l_source: "qrc:/images/Races/Upir.png"
        }
        ListElement{
            l_nameRace: "Леший"
            l_source: "qrc:/images/Races/Leshiy.png"
        }
        ListElement{
            l_nameRace: "Кикимора"
            l_source: "qrc:/images/Races/Kikimora.png"
        }
        ListElement{
            l_nameRace: "Домовой"
            l_source: "qrc:/images/Races/Domovoi.png"
        }
        ListElement{
            l_nameRace: "Ящер"
            l_source: "qrc:/images/Races/Yasher.png"
        }
    }
    property int indexRace
    function whatNameRace()
    {
        for(let i = 0; i < _listModelRaces.count; i++)
        {
            if(_listModelRaces.get(i).l_nameRace === _client.tailRaceArr[0])
            {
                indexRace = i
            }
        }
    }

    ListModel {
        id: _listModelSourceForClasPlayer
        ListElement {
            l_nameClass: "Гонец"
            l_source: "qrc:/images/Gonec.png"
        }
        ListElement {
            l_nameClass: "Силач"
            l_source: "qrc:/images/Silach.png"
        }
        ListElement {
            l_nameClass: "Разбойник"
            l_source: "qrc:/images/Razboinik.png"
        }
        ListElement {
            l_nameClass: "Писец"
            l_source: "qrc:/images/Pisar.png"
        }
    }

    ListModel {
        id: _listModelClasses
        ListElement {
            l_nameClass: "Гонец"
            l_color: "black"
        }
        ListElement {
            l_nameClass: "Силач"
            l_color: "black"
        }
        ListElement {
            l_nameClass: "Разбойник"
            l_color: "black"
        }
        ListElement {
            l_nameClass: "Писец"
            l_color: "black"
        }
    }

    StackView {
        id: _stack
        anchors.fill: parent
        initialItem: _homePageCom
    }


//Начальная страница
    Component {
        id: _homePageCom
        Home_page {
            id: _homePage
            Log_In_Button {
                id: _log_In_Button_HomePage
                p_width: 243
                p_height: 72
                p_radius: 10
                p_bottomMargin: 126
                p_rootTitle: "Вход"
                p_stackPush: _logInStudentCom
                p_enabled_MouseArea: true
                p_connecting: false
            }            
        }
    }


//Вход в клиент
    Component {
        id: _logInStudentCom
        Log_In {
            id: _logInStudent            
            Log_In_Button {
                id: _log_In_Button_LogInStudent
                p_width: 243
                p_height: 72
                p_radius: 10
                p_bottomMargin: 126
                p_rootTitle: "Сказки"
                p_stackPush: _fairyTalesCom
                p_enabled_MouseArea: p_enabled_MouseArea_LogIn
                p_connecting: true
            }
            Error_Connection {

            }
        }
    }


//Регестрация студента
    Component {
        id: _signInStudentCom
        Sign_In {
            id: _signInStudent
            p_widthDarkerFon: 361
            p_heightDarkerFon: 574
            p_radiusDarkerFon: 20

            p_WHO_SignIn: "студентика"
            p_width_second_canvas: 220
            p_ctx_xMargin: 22
            p_ctx_yMargin: 22

            p_placeHolderText_codeGroup: "Код группы"

            p_visible_codeGroup: true
            p_visible_elder_teacher: true
            p_visiable_elder: false

            p_rootTitlePop: "Начальное окно"

            Error_Connection {

            }
        }
    }


//Регестрация старосты
    Component {
        id: _signInElderCom
        Sign_In {
            id: _signInElder
            p_widthDarkerFon: 361
            p_heightDarkerFon: 635
            p_radiusDarkerFon: 20

            p_WHO_SignIn: "старосты"
            p_width_second_canvas: 220
            p_ctx_xMargin: 36
            p_ctx_yMargin: 22

            p_placeHolderText_codeGroup: "Придумайте код группы"

            p_visible_codeGroup: true
            p_visible_elder_teacher: false
            p_visiable_elder: true

            p_rootTitlePop: "Регистрация студента"

            Error_Connection {

            }
        }
    }


//Регестрация преподавателя
    Component {
        id: _signInTeacherCom
        Sign_In {
            id: _signInTeacher
            p_widthDarkerFon: 361
            p_heightDarkerFon: 466
            p_radiusDarkerFon: 20

            p_WHO_SignIn: "преподавателя"
            p_width_second_canvas: 240
            p_ctx_xMargin: 5
            p_ctx_yMargin: 22

            p_visible_codeGroup: false
            p_visible_elder_teacher: false
            p_visiable_elder: false

            p_rootTitlePop: "Регистрация студента"

            Error_Connection {

            }
        }
    }


//Приветсвие после регестрации
    Component {
        id: _greetingCom
        Greeting {
            id: _greeting
        }
    }


//Архив
    Component
    {
        id: _archiveCom
        Archive
        {
            id: _archive

            Close_Button
            {
                id: _closeArchive
                p_bottomMargin: 72
                p_color_rect: "#D9D9D9"
                p_opacity: 0.9
                p_root_title: "Сказки"
            }
        }
    }


//Сказки
    Component {
        id: _fairyTalesCom
        Fairy_tales {
            id: _fairyTales

            Custom_Button {
                id: _fairy_Tales_Archive_Button
                p_anchor_top: parent
                p_anchor_topMargin: 694

                p_width: 355
                p_height: 86
                p_radius: 25
                p_colorRect: "#D9D9D9"
                p_opacity: 0.6
                p_border_color: "black"
                p_border_width: 1

                p_image_visiable: false

                p_enabled_mouseArea: true
                p_stack_pushing: true
                p_stack_push: _archiveCom

                p_text1: "Архив"
                //p_text2:
                p_colorStroke: "#B4AFBE"
                p_colorText: "black"
                p_font: "bold italic 28px '" + montserratBoldItalic + "'"
                p_lineWidth: 6
                p_textHeight: 25
                p_canvasOne_visiable: true
                p_canvasTwo_visiable: false
            }
        }
    }


//Меню преподавателя
    Component
    {
        id: _menuTeacherCom
        Menu_teacher
        {
            id: _menuTeacher
            CanvasTwo
            {
                id: _nameGame_menu
                p_width: 350
                p_height: 110

                p_topMargin: 56

                p_text1: "Волшебные"
                p_text2: "существа"
                p_colorStroke: "#0E0908"
                p_colorText: "#A0C9BD"
                p_font: "bold italic 36px '" + montserratBoldItalic + "'"
                p_lineWidth: 34
                p_textHeight: 40
                p_canvasTwo_visiable: true
            }
            Rectangle
            {
                anchors
                {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 267
                }
                width: 355
                height: 86
                color: "transparent"
                radius: 25
                border.color: "black"
                border.width: 1

                Rectangle
                {
                    anchors.fill: parent
                    width: 355
                    height: 86
                    color: "#D9D9D9"
                    opacity: 0.6
                    radius: 25
                    border.color: "black"
                    border.width: 1
                }
                CanvasOne
                {
                    id: _allParty_menu
                    p_width: 160
                    p_height: 40

                    p_topMargin: 26
                    anchors.horizontalCenter: undefined
                    anchors.left: parent.left
                    anchors.leftMargin: 109

                    p_text1: "Все пати"
                    p_colorStroke: "#B4AFBE"
                    p_colorText: "black"
                    p_font: "bold italic 28px '" + montserratBoldItalic + "'"
                    p_lineWidth: 6
                    p_textHeight: 18
                    p_canvasOne_visiable: true
                    layer.enabled: true
                    layer.effect: DropShadow {
                        verticalOffset: 5
                        color: "#726D6D"
                        radius: 10
                        samples: 25
                        spread: 0
                    }

                }
                Rectangle
                {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 20
                    width: 56
                    height: 56
                    color: "#D9D9D9"
                    radius: 10
                    Image
                    {
                        anchors.centerIn: parent
                        source: "qrc:/svg/Group_On.svg"
                    }
                }
            }
            Rectangle
            {
                anchors
                {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 383
                }
                width: 355
                height: 86
                color: "transparent"
                radius: 25
                border.color: "black"
                border.width: 1

                Rectangle
                {
                    anchors.fill: parent
                    width: 355
                    height: 86
                    color: "#D9D9D9"
                    opacity: 0.6
                    radius: 25
                    border.color: "black"
                    border.width: 1
                }
                CanvasOne
                {
                    id: _fairyTales_menu
                    p_width: 160
                    p_height: 40

                    p_topMargin: 26
                    anchors.horizontalCenter: undefined
                    anchors.left: parent.left
                    anchors.leftMargin: 109

                    p_text1: "Сказки"
                    p_colorStroke: "#B4AFBE"
                    p_colorText: "black"
                    p_font: "bold italic 28px '" + montserratBoldItalic + "'"
                    p_lineWidth: 6
                    p_textHeight: 18
                    p_canvasOne_visiable: true
                    layer.enabled: true
                    layer.effect: DropShadow {
                        verticalOffset: 5
                        color: "#726D6D"
                        radius: 10
                        samples: 25
                        spread: 0
                    }
                }
                Rectangle
                {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 20
                    width: 56
                    height: 56
                    color: "#D9D9D9"
                    radius: 10
                    Image
                    {
                        anchors.centerIn: parent
                        source: "qrc:/svg/Book_tales.svg"
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _client.slotConnecting()
                        _client.getTeacherTails()
                        _client.slotDisconnecting()
                        _stack.push(_fairyTalesTeacherCom)
                    }
                }
            }
            // Rectangle
            // {
            //     anchors
            //     {
            //         top: parent.top
            //         horizontalCenter: parent.horizontalCenter
            //         topMargin: 499
            //     }
            //     width: 355
            //     height: 86
            //     color: "transparent"
            //     radius: 25
            //     border.color: "black"
            //     border.width: 1

            //     MouseArea
            //     {
            //         anchors.fill: parent
            //         onClicked:
            //         {
            //             _stack.push(_questsTeacher_Com)
            //         }
            //     }

            //     Rectangle
            //     {
            //         anchors.fill: parent
            //         width: 355
            //         height: 86
            //         color: "#D9D9D9"
            //         opacity: 0.6
            //         radius: 25
            //         border.color: "black"
            //         border.width: 1
            //     }
            //     CanvasOne
            //     {
            //         id: _quest_menu
            //         p_width: 160
            //         p_height: 40

            //         p_topMargin: 26
            //         anchors.horizontalCenter: undefined
            //         anchors.left: parent.left
            //         anchors.leftMargin: 109

            //         p_text1: "Квесты"
            //         p_colorStroke: "#B4AFBE"
            //         p_colorText: "black"
            //         p_font: "bold italic 28px '" + montserratBoldItalic + "'"
            //         p_lineWidth: 6
            //         p_textHeight: 18
            //         p_canvasOne_visiable: true
            //         layer.enabled: true
            //         layer.effect: DropShadow {
            //             verticalOffset: 5
            //             color: "#726D6D"
            //             radius: 10
            //             samples: 25
            //             spread: 0
            //         }
            //     }
            //     Rectangle
            //     {
            //         anchors.left: parent.left
            //         anchors.verticalCenter: parent.verticalCenter
            //         anchors.leftMargin: 20
            //         width: 56
            //         height: 56
            //         color: "#D9D9D9"
            //         radius: 10
            //         Image
            //         {
            //             anchors.centerIn: parent
            //             source: "qrc:/svg/Quest_On.svg"
            //         }
            //     }
            // }
            Rectangle
            {
                anchors
                {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 499
                }
                width: 355
                height: 86
                color: "transparent"
                radius: 25
                border.color: "black"
                border.width: 1

                Rectangle
                {
                    anchors.fill: parent
                    width: 355
                    height: 86
                    color: "#D9D9D9"
                    opacity: 0.6
                    radius: 25
                    border.color: "black"
                    border.width: 1
                }
                CanvasOne
                {
                    id: _bestiariy_menu
                    p_width: 180
                    p_height: 40

                    p_topMargin: 26
                    anchors.horizontalCenter: undefined
                    anchors.left: parent.left
                    anchors.leftMargin: 109

                    p_text1: "Бестиарий"
                    p_colorStroke: "#B4AFBE"
                    p_colorText: "black"
                    p_font: "bold italic 28px '" + montserratBoldItalic + "'"
                    p_lineWidth: 6
                    p_textHeight: 18
                    p_canvasOne_visiable: true
                    layer.enabled: true
                    layer.effect: DropShadow {
                        verticalOffset: 5
                        color: "#726D6D"
                        radius: 10
                        samples: 25
                        spread: 0
                    }
                }
                Rectangle
                {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 20
                    width: 56
                    height: 56
                    color: "#D9D9D9"
                    radius: 10
                    Image
                    {
                        anchors.centerIn: parent
                        source: "qrc:/svg/Bestiariy_On.svg"
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _client.slotConnecting()
                        _client.getRaces()
                        _client.slotDisconnecting()
                        _stack.push(_bestiariyCom)
                    }
                }
            }
            Rectangle
            {
                id: _menu_leave_rect
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 80
                    horizontalCenter: parent.horizontalCenter
                }
                width: 116
                height: 48
                radius: 15
                color: "transparent"

                Rectangle
                {
                    width: _menu_leave_rect.width
                    height: _menu_leave_rect.height
                    anchors.fill: parent
                    color: "#D9D9D9"
                    radius: 15
                    opacity: 0.6
                }

                Text
                {
                    id: _cabinet_leave_text
                    anchors.top: parent.top
                    anchors.topMargin: 12
                    anchors.left: parent.left
                    anchors.leftMargin: 36

                    color: "#33363F"
                    font.bold: true
                    font.italic: true
                    font.pointSize: 14
                    font.family: montserratBoldItalic
                    text: "Выход"
                }

                Image
                {
                    id: _leave_cabinet
                    anchors.top: parent.top
                    anchors.topMargin: 7
                    anchors.left: parent.left
                    anchors.leftMargin: 4

                    source: "qrc:/svg/Leave_cabinet.svg"
                }

                MouseArea
                {
                    anchors.fill: parent
                    enabled: true
                    onClicked:
                    {
                        onClicked: _popup_leave.open()
                    }
                }

                Popup
                {
                    id: _popup_leave
                    parent: Overlay.overlay
                    x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
                    y: -height // Начальная позиция выше экрана
                    width: 245
                    height: 152
                    closePolicy: Popup.NoAutoClose
                    modal: true
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


                    Item
                    {
                        anchors.centerIn: parent
                        width: 275
                        height: 182

                        Rectangle
                        {
                            id: _fon_rec_leave
                            anchors.fill: parent
                            color: "#757575"
                            //opacity: 0.5
                            visible: true
                            radius: 30
                            border.color: "black"
                            border.width: 1

                            CanvasOne
                            {
                                id: _text1_leave
                                p_width: 234
                                p_height: 22
                                p_text1: "Вы уверены,"
                                p_colorStroke: "White"
                                p_colorText: "#Black"
                                p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                p_lineWidth: 2
                                p_textHeight: 6
                                p_canvasOne_visiable: true
                                p_topMargin: 30
                            }
                            CanvasOne
                            {
                                id: _text2_leave
                                p_width: 234
                                p_height: 22
                                p_text1: "что хотите выйти"
                                p_colorStroke: "White"
                                p_colorText: "#Black"
                                p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                p_lineWidth: 2
                                p_textHeight: 6
                                p_canvasOne_visiable: true
                                anchors.top: _text1_leave.bottom
                                p_topMargin: 3
                            }
                            CanvasOne
                            {
                                id: _text3_leave
                                p_width: 234
                                p_height: 22
                                p_text1: "из своего аккаунта?"
                                p_colorStroke: "White"
                                p_colorText: "#Black"
                                p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                p_lineWidth: 2
                                p_textHeight: 6
                                p_canvasOne_visiable: true
                                anchors.top: _text2_leave .bottom
                                p_topMargin: 3
                            }
                            Rectangle
                            {
                                width: 98
                                height: 39
                                anchors.right: _fon_rec_leave.right
                                anchors.rightMargin: 10
                                anchors.bottom: _fon_rec_leave.bottom
                                anchors.bottomMargin: 20
                                color: "#D9D9D9"
                                radius: 10

                                Text
                                {

                                    text: "Отмена"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 16

                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                }
                                MouseArea
                                {
                                    anchors.fill: parent
                                    onClicked:
                                    {
                                         _popup_leave.close()
                                    }
                                }
                            }

                            Rectangle
                            {

                                width: 98
                                height: 39
                                anchors.left: _fon_rec_leave.left
                                anchors.leftMargin: 10
                                anchors.bottom: _fon_rec_leave.bottom
                                anchors.bottomMargin: 20
                                color: "#D9D9D9"
                                radius: 10
                                Text
                                {
                                    text: "Да"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 16

                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                }
                                MouseArea
                                {
                                    anchors.fill: parent
                                    onClicked:
                                    {
                                        _popup_leave.close()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }


//Сказки преподавателя
    Component {
        id: _fairyTalesTeacherCom
        Fairy_tales_teacher {
            id: _fairyTalesTeacher

            Custom_Button {
                id: _redactButton
                p_anchor_top: parent
                p_anchor_topMargin: 733

                p_width: 275
                p_height: 30
                p_radius: 25
                p_colorRect: "#D9D9D9"
                p_opacity: 0.6
                p_border_color: "black"
                p_border_width: 1

                p_image_visiable: false

                p_enabled_mouseArea: true
                p_stack_pushing: true
                p_stack_push: _fairy_tales_edit_com

                p_text1: "Редактировать"
                //p_text2:
                p_root_title: "Редактор сказок"
                p_colorStroke: "#B4AFBE"
                p_colorText: "black"
                p_font: "bold italic 16px '" + montserratBoldItalic + "'"
                p_lineWidth: 6
                p_textHeight: 25
                p_canvasOne_visiable: true
                p_canvasTwo_visiable: false
            }

            Custom_Button {
                id: _closeButton
                p_anchor_top: parent
                p_anchor_topMargin: 780

                p_width: 266
                p_height: 30
                p_radius: 25
                p_colorRect: "#D9D9D9"
                p_opacity: 0.6
                p_border_color: "black"
                p_border_width: 1

                p_image_visiable: false

                p_enabled_mouseArea: true
                p_stack_pushing: false

                p_text1: "Назад"
                //p_text2:
                p_root_title: "Меню преподавателя"
                p_colorStroke: "#B4AFBE"
                p_colorText: "black"
                p_font: "bold italic 16px '" + montserratBoldItalic + "'"
                p_lineWidth: 6
                p_textHeight: 25
                p_canvasOne_visiable: true
                p_canvasTwo_visiable: false
            }
        }
    }


//Редактор сказок
    Component
    {
        id: _fairy_tales_edit_com
        Fairy_tales_edit
        {
            id: _fairy_tales_edit
            CanvasOne
            {
                p_width: 330
                p_height: 70

                anchors.top: parent.top
                anchors.topMargin: 90

                p_text1: "Редактор сказок"
                p_colorStroke: "#0D060B"
                p_colorText: "#7BE3AB"
                p_font: "bold italic 35px '" + montserratBoldItalic + "'"
                p_lineWidth: 8
                p_textHeight: 16
                p_canvasOne_visiable: true

                Rectangle {
                    anchors {
                        top: parent.top
                        topMargin: 60
                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 355
                    height: 550
                    color: "transparent"

                    ListView {
                        id: _listViewFairyTales
                        anchors.fill: parent
                        model: _client.currentTailsArr.length
                        spacing: 30
                        clip: true
                        enabled: true
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
                                _popup_edit.open()
                            }
                            background: Rectangle {
                                color: "#D9D9D9"
                                radius: 25
                                border.width: 1
                                border.color: "black"
                                opacity: 0.6
                            }
                        }
                    }
                }
            }

            Popup
            {
                id: _popup_edit
                parent: Overlay.overlay
                x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
                y: -height // Начальная позиция выше экрана
                width: 308
                height: 350
                visible: false
                modal: true

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
                    _listViewFairyTales.enabled = true
                    y = -height // Уводим за пределы экрана вверх
                }

                Rectangle
                {
                    anchors.centerIn: parent
                    width: 328
                    height: 365
                    radius: 30
                    color: "#B487AF"
                    opacity: 1
                    border.color: "black"
                    border.width: 1

                    CanvasOne
                    {
                        p_width: 180
                        p_height: 50

                        anchors.top: parent.top
                        anchors.topMargin: 12

                        p_text1: "Редактор"
                        p_colorStroke: "#E6D1D1"
                        p_colorText: "#33363F"
                        p_font: "bold italic 32px '" + montserratBoldItalic + "'"
                        p_lineWidth: 4
                        p_textHeight: 8
                        p_canvasOne_visiable: true
                    }

                    Rectangle
                    {
                        anchors.top: parent.top
                        anchors.topMargin: 70
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 274
                        height: 67
                        radius: 20
                        color: "#D0D0D0"
                        opacity: 1

                        Text
                        {
                            text: "Изменить название"
                            color: "Black"
                            font.family: montserratBoldItalic
                            font.bold: true
                            font.italic: true
                            font.pointSize: 16
                            anchors.centerIn: parent
                            wrapMode: Text.WordWrap
                        }

                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked:
                            {
                                _popupRedactNameTail.open()
                            }
                        }
                    }
                    Rectangle
                    {
                        anchors.top: parent.top
                        anchors.topMargin: 158
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 274
                        height: 67
                        radius: 20
                        color: "#D0D0D0"
                        opacity: 1

                        Text
                        {
                            id: _edit_go_txt1
                            anchors
                            {
                                top: parent.top
                                left: parent.left
                                topMargin: 12
                                leftMargin: 79
                            }
                            text: "Переместить"
                            color: "Black"
                            font.family: montserratBoldItalic
                            font.bold: true
                            font.italic: true
                            font.pointSize: 16
                            wrapMode: Text.WordWrap
                        }

                        Text
                        {
                            anchors
                            {
                                top: _edit_go_txt1.bottom
                                left: parent.left
                                leftMargin: 109
                            }

                            text: "в архив"
                            color: "Black"
                            font.family: montserratBoldItalic
                            font.bold: true
                            font.italic: true
                            font.pointSize: 16
                            wrapMode: Text.WordWrap
                        }
                        Image
                        {
                            anchors
                            {
                                left: parent.left
                                leftMargin: 8
                                top: parent.top
                                topMargin: 15
                            }

                            source: "qrc:/svg/Arhive_on_editor.svg"
                            visible: true
                        }

                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked:
                            {

                            }
                        }
                    }
                    Rectangle
                    {
                        anchors.top: parent.top
                        anchors.topMargin: 246
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 274
                        height: 67
                        radius: 20
                        color: "#D0D0D0"
                        opacity: 1

                        Text
                        {
                            anchors
                            {
                                top: parent.top
                                left: parent.left
                                topMargin: 20
                                leftMargin: 69
                            }
                            text: "Удалить сказку"
                            color: "Black"
                            font.family: montserratBoldItalic
                            font.bold: true
                            font.italic: true
                            font.pointSize: 16
                            wrapMode: Text.WordWrap
                        }

                        Image
                        {
                            anchors
                            {
                                left: parent.left
                                leftMargin: 5
                                top: parent.top
                                topMargin: 10
                            }
                            source: "qrc:/svg/Delete_on_editor.svg"
                            visible: true
                        }

                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked:
                            {
                                _popupDeleteTail.open()
                            }
                        }
                    }
                }
            }

            CanvasTwo
            {
                p_width: 250
                p_height: 70

                anchors.top: parent.top
                anchors.topMargin: 710

                p_text1: "*Нажмите на сказку,"
                p_text2: "чтобы редактировать"
                p_colorStroke: "black"
                p_colorText: "white"
                p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                p_lineWidth: 4
                p_textHeight: 16
                p_canvasTwo_visiable: true
            }

            Custom_Button
            {
                id: _fairy_Tales_back_Button
                p_anchor_top: parent
                p_anchor_topMargin: 786

                p_width: 268
                p_height: 30
                p_radius: 25
                p_colorRect: "#D9D9D9"
                p_opacity: 0.6
                p_border_color: "black"
                p_border_width: 1

                p_image_visiable: false
                p_enabled_mouseArea: true
                p_stack_pushing: false

                p_text1: "Назад"
                p_colorStroke: "#B4AFBE"
                p_colorText: "black"
                p_font: "bold italic 16px '" + montserratBoldItalic + "'"
                p_lineWidth: 6
                p_textHeight: 12
                p_canvasOne_visiable: true
                p_canvasTwo_visiable: false
            }


            Popup
            {
                id: _popupRedactNameTail
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
                    y = Math.round((parent.height - height) / 2) // Центрирование по вертикали при открытии
                }

                onClosed:
                {
                    y = -height // Уводим за пределы экрана вверх
                }

                Rectangle
                {
                    anchors.centerIn: parent
                    width: 340
                    height: 300
                    radius: 30
                    color: "#B487AF"
                    opacity: 1
                    border.color: "black"
                    border.width: 1

                    CanvasTwo
                    {
                        p_width: 300
                        p_height: 70

                        anchors.top: parent.top
                        anchors.topMargin: 35

                        p_text1: "Новое название"
                        p_text2: "сказки"
                        p_colorStroke: "#E6D1D1"
                        p_colorText: "#33363F"
                        p_font: "bold italic 32px '" + montserratBoldItalic + "'"
                        p_lineWidth: 4
                        p_textHeight: 26
                        p_canvasTwo_visiable: true
                    }

                    Rectangle
                    {
                        id: _newTalesInput
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
                            id: _newTalesTextInput
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
                                _newTalesTextInput.text = text
                                _newTalesTextInput.color = "#2b2b2b"
                                _newTalesTextInput.font.pointSize = 15
                            }

                            onTextEdited:
                            {
                                _newTalesTextInput.color = "#5c5c5c"
                                _newTalesTextInput.font.pointSize = 13
                            }
                        }
                    }
                    Rectangle
                    {
                        anchors.top: parent.top
                        anchors.topMargin: 235
                        anchors.left: parent.left
                        anchors.leftMargin: 14

                        width: 145
                        height: 45
                        radius: 10
                        color: "#D9D9D9"
                        border.color: "black"
                        border.width: 1

                        Text
                        {
                            text: "Подтвердить"
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
                                if(_newTalesTextInput.length >= 2 && _newTalesTextInput.text !== _client.myString)
                                {
                                    _client.slotConnecting()
                                    _client.changeTailName(_client.myString, _newTalesTextInput.text)
                                    _client.getTeacherTails()
                                    _client.slotDisconnecting()
                                    _listViewFairyTales.update()
                                    if(_client.result === true)
                                    {
                                        _popupRedactNameTail.close()
                                        _newTalesTextInput.text = ""
                                    } else {
                                        console.log("Ошибка при изменении названии сказки")
                                    }

                                } else {
                                    console.log("Введено не достаточно символов ИЛИ название сказки не изменилось")
                                }
                            }
                        }
                    }
                    Rectangle
                    {
                        anchors.top: parent.top
                        anchors.topMargin: 235
                        anchors.right: parent.right
                        anchors.rightMargin: 14

                        width: 145
                        height: 45
                        radius: 10
                        color: "#D9D9D9"
                        border.color: "black"
                        border.width: 1

                        Text
                        {
                            text: "Назад"
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
                                _popupRedactNameTail.close()
                            }
                        }
                    }
                }
            }

            Popup
            {
                id: _popupDeleteTail
                parent: Overlay.overlay
                x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
                y: -height // Начальная позиция выше экрана
                width: 300
                height: 150
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
                    y = -height // Уводим за пределы экрана вверх
                    _popup_edit.close()
                }

                Rectangle
                {
                    anchors.centerIn: parent
                    width: 340
                    height: 180
                    radius: 30
                    color: "#B487AF"
                    opacity: 1
                    border.color: "black"
                    border.width: 1

                    CanvasTwo
                    {
                        p_width: 300
                        p_height: 70

                        anchors.top: parent.top
                        anchors.topMargin: 35

                        p_text1: "Удалить выбранную"
                        p_text2: "сказку?"
                        p_colorStroke: "#E6D1D1"
                        p_colorText: "#33363F"
                        p_font: "bold italic 26px '" + montserratBoldItalic + "'"
                        p_lineWidth: 4
                        p_textHeight: 26
                        p_canvasTwo_visiable: true
                    }

                    Rectangle
                    {
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
                            text: "Подтвердить"
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
                                _client.slotConnecting()
                                _client.deleteTail()
                                _client.getTeacherTails()
                                _client.slotDisconnecting()
                                if(_client.result === true)
                                {
                                    _listViewFairyTales.update()
                                    _popupDeleteTail.close()
                                } else {
                                    console.log("Ошибка при удалении сказки")
                                }
                            }
                        }
                    }
                    Rectangle
                    {
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
                            text: "Назад"
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
                                _popupDeleteTail.close()
                            }
                        }
                    }
                }
            }
        }
    }


//Главы
    Component {
        id: _chaptersCom
        Chapters {
            id: _chapters

            CanvasOne {
                id: _nameChapters
                p_width: 320
                p_height: 70
                p_topMargin: 58

                p_text1: currentTail
                p_colorStroke: "black"
                p_colorText: "#D1A8C3"
                p_font: "bold italic 30px '" + montserratBoldItalic + "'"
                p_lineWidth: 12
                p_textHeight: 27
                p_canvasOne_visiable: true
            }


            Rectangle {
                anchors {
                    top: _nameChapters.bottom
                    topMargin: 45
                    bottom: _closeChapters.top
                    bottomMargin: 34
                }
                anchors.horizontalCenter: parent.horizontalCenter
                width: 355
                height: 585
                color: "transparent"

                ListView {
                    id: _listViewChapters
                    anchors.fill: parent
                    model: _client.tailChaptersArr.length // Количество элементов в списке
                    spacing: 30
                    clip: true
                    delegate: Button {
                        width: 355
                        height: 86
                        text: _client.tailChaptersArr[index]
                        font.family: montserratBoldItalic
                        font.bold: true
                        font.italic: true
                        font.pointSize: 24
                        onClicked: {
                            currentChapter = _client.tailChaptersArr[index]
                            _client.slotConnecting()
                            _client.getPlayerTailClass()
                            if(_client.classPlayer !== "")
                            {
                                _client.getTailRace()
                                _client.getSquadsRating()
                                _stack.push(_cabinetCom)
                                whatNameRace()

                            } else {
                                _stack.push(_class_Com)
                            }

                            _client.slotDisconnecting()


                        }
                        background: Rectangle {
                            color: "#D9D9D9"
                            radius: 25
                            border.width: 1
                            border.color: "black"
                            opacity: 0.6
                        }
                    }
                }
            }

            Close_Button {
                id: _closeChapters
                p_bottomMargin: 72
                p_color_rect: "#D9D9D9"
                p_opacity: 0.9
                p_root_title: "Сказки"
            }
        }
    }


//Главы преподавателя
    Component {
        id: _chaptersTeacherCom
        Chapters {

            CanvasOne {
                id: _nameChapters
                p_width: 320
                p_height: 70
                p_topMargin: 58

                p_text1: currentTail
                p_colorStroke: "black"
                p_colorText: "#D1A8C3"
                p_font: "bold italic 30px '" + montserratBoldItalic + "'"
                p_lineWidth: 12
                p_textHeight: 27
                p_canvasOne_visiable: true
            }


            Rectangle {
                anchors {
                    top: _nameChapters.bottom
                    topMargin: 45
                    bottom: _redactButton.top
                    bottomMargin: 34
                }
                anchors.horizontalCenter: parent.horizontalCenter
                width: 355
                height: 585
                color: "transparent"

                ListView {
                    id: _listViewChapters
                    anchors.fill: parent
                    model: _client.tailChaptersArr.length
                    spacing: 30
                    clip: true
                    delegate: Button {
                        width: 355
                        height: 86
                        text: _client.tailChaptersArr[index]
                        font.family: montserratBoldItalic
                        font.bold: true
                        font.italic: true
                        font.pointSize: 24
                        onClicked: {
                            currentChapter = _client.tailChaptersArr[index]
                            _stack.push(_questsTeacher_Com)
                            p_enabled_MouseArea_MenuBar_Quest = false
                            p_sourceQuests = "qrc:/svg/Quest_On.svg"
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
                                    _popup_addChapter.open()
                                }
                            }
                        }
                    }
                }
                Popup
                {
                    id: _popup_addChapter
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
                        y = Math.round((parent.height - height) / 2) // Центрирование по вертикали при открытии
                    }

                    onClosed:
                    {
                        _chapterTextInput.focus = false
                        y = -height // Уводим за пределы экрана вверх
                    }

                    Rectangle
                    {
                        anchors.centerIn: parent
                        width: 340
                        height: 300
                        radius: 30
                        color: "#B487AF"
                        opacity: 1
                        border.color: "black"
                        border.width: 1

                        CanvasTwo
                        {
                            p_width: 220
                            p_height: 70

                            anchors.top: parent.top
                            anchors.topMargin: 35

                            p_text1: "Добавление"
                            p_text2: "главы"
                            p_colorStroke: "#E6D1D1"
                            p_colorText: "#33363F"
                            p_font: "bold italic 32px '" + montserratBoldItalic + "'"
                            p_lineWidth: 4
                            p_textHeight: 26
                            p_canvasTwo_visiable: true
                        }

                        Rectangle
                        {
                            id: _button_backPopupAddChapter
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
                                text: "Отмена"
                                color: "#33363F"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 13
                                anchors.centerIn: parent
                                wrapMode: Text.WordWrap
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    _popup_addChapter.close()
                                    _chapterTextInput.text = ""
                                }
                            }
                        }

                        Rectangle
                        {
                            id: _button_aprovedPopupAddChapter
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
                                text: "Подтвердить"
                                color: "#33363F"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 13
                                anchors.centerIn: parent
                                wrapMode: Text.WordWrap
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    if(_chapterTextInput.length >= 2)
                                    {
                                        _client.slotConnecting()
                                        _client.setChapter(_chapterTextInput.text)

                                        if(_client.result === true)
                                        {
                                            _client.getTailChapters()
                                            _popup_addChapter.close()
                                            _listViewChapters.update()
                                            _chapterTextInput.text = ""
                                        } else {
                                            console.log("Ошибка добавления главы")
                                        }
                                        _client.slotDisconnecting()
                                    }
                                }
                            }
                        }

                        Rectangle
                        {
                            id: _chapterInput
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
                                id: _chapterTextInput
                                anchors.fill: parent
                                width: 285
                                height: 53
                                horizontalAlignment: TextEdit.AlignHCenter
                                verticalAlignment: TextEdit.AlignVCenter
                                color: "#5c5c5c"
                                placeholderText: "Введите название главы"
                                placeholderTextColor: "#5c5c5c"
                                font.family: montserratSemiBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 13
                                // validator: RegularExpressionValidator {regularExpression: /[А-Яа-яa-zA-Z]{2}[А-Я а-яa-zA-Z0-9]{0, 18}/}
                                background: Rectangle {
                                    color: "transparent"
                                }

                                onEditingFinished:
                                {
                                    _chapterTextInput.text = text
                                    _chapterTextInput.color = "#2b2b2b"
                                    _chapterTextInput.font.pointSize = 15
                                }

                                onTextEdited:
                                {
                                    _chapterTextInput.color = "#5c5c5c"
                                    _chapterTextInput.font.pointSize = 13
                                }
                            }
                        }
                    }
                }
            }

            Custom_Button {
                id: _redactButton
                p_anchor_top: parent
                p_anchor_topMargin: 733

                p_width: 266
                p_height: 30
                p_radius: 25
                p_colorRect: "#D9D9D9"
                p_opacity: 0.6
                p_border_color: "black"
                p_border_width: 1

                p_image_visiable: false

                p_enabled_mouseArea: true
                p_stack_pushing: true
                p_stack_push: _chaptersTeacherEditCom

                p_text1: "Редактировать"
                //p_text2:
                p_colorStroke: "#B4AFBE"
                p_colorText: "black"
                p_font: "bold italic 16px '" + montserratBoldItalic + "'"
                p_lineWidth: 6
                p_textHeight: 25
                p_canvasOne_visiable: true
                p_canvasTwo_visiable: false
            }

            Custom_Button {
                id: _closeButton
                p_anchor_top: parent
                p_anchor_topMargin: 780

                p_width: 266
                p_height: 30
                p_radius: 25
                p_colorRect: "#D9D9D9"
                p_opacity: 0.6
                p_border_color: "black"
                p_border_width: 1

                p_image_visiable: false

                p_enabled_mouseArea: true
                p_stack_pushing: false

                p_text1: "Назад"
                //p_text2:
                p_root_title: "Сказки преподавателя"
                p_colorStroke: "#B4AFBE"
                p_colorText: "black"
                p_font: "bold italic 16px '" + montserratBoldItalic + "'"
                p_lineWidth: 6
                p_textHeight: 25
                p_canvasOne_visiable: true
                p_canvasTwo_visiable: false
            }
        }
    }


//Редактор Глав
    Component {
        id: _chaptersTeacherEditCom
        Chapters {
            CanvasOne
            {
                p_width: 330
                p_height: 70

                anchors.top: parent.top
                anchors.topMargin: 90

                p_text1: "Редактор глав"
                p_colorStroke: "#0D060B"
                p_colorText: "#7BE3AB"
                p_font: "bold italic 35px '" + montserratBoldItalic + "'"
                p_lineWidth: 8
                p_textHeight: 16
                p_canvasOne_visiable: true

                Rectangle {
                    anchors {
                        top: parent.top
                        topMargin: 60
                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 355
                    height: 550
                    color: "transparent"

                    ListView {
                        id: _listViewChaptersRedact
                        anchors.fill: parent
                        model: _client.tailChaptersArr.length
                        spacing: 30
                        clip: true
                        enabled: true
                        delegate: Button {
                            width: 355
                            height: 86
                            text: _client.tailChaptersArr[index]
                            font.family: montserratBoldItalic
                            font.bold: true
                            font.italic: true
                            font.pointSize: 24
                            onClicked: {
                                currentChapter = _client.tailChaptersArr[index]
                                _popup_edit.open()
                            }
                            background: Rectangle {
                                color: "#D9D9D9"
                                radius: 25
                                border.width: 1
                                border.color: "black"
                                opacity: 0.6
                            }
                        }
                    }
                }
            }
            CanvasTwo
            {
                p_width: 250
                p_height: 70

                anchors.top: parent.top
                anchors.topMargin: 710

                p_text1: "*Нажмите на главу,"
                p_text2: "чтобы редактировать"
                p_colorStroke: "black"
                p_colorText: "white"
                p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                p_lineWidth: 4
                p_textHeight: 16
                p_canvasTwo_visiable: true
            }

            Custom_Button
            {
                p_anchor_top: parent
                p_anchor_topMargin: 786

                p_width: 268
                p_height: 30
                p_radius: 25
                p_colorRect: "#D9D9D9"
                p_opacity: 0.6
                p_border_color: "black"
                p_border_width: 1

                p_image_visiable: false
                p_enabled_mouseArea: true
                p_stack_pushing: false

                p_text1: "Назад"
                p_colorStroke: "#B4AFBE"
                p_colorText: "black"
                p_font: "bold italic 16px '" + montserratBoldItalic + "'"
                p_lineWidth: 6
                p_textHeight: 12
                p_canvasOne_visiable: true
                p_canvasTwo_visiable: false
            }


            Popup {
                id: _popup_edit
                parent: Overlay.overlay
                x: parent.width // Начальная позиция справа за экраном
                y: Math.round((parent.height - height) / 2) // Привязка по центру по вертикали
                width: 335
                height: 325
                visible: false
                modal: true

                Behavior on x {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.InOutQuad
                    }
                }

                onOpened: {
                    _listViewChaptersRedact.enabled = false
                     x = Math.round((parent.width - width) / 2) // Центрирование по горизонтали при открытии
                }

                onClosed: {
                    _listViewChaptersRedact.enabled = true
                    x = parent.width  // Уводим за пределы экрана вправо
                }
                Rectangle {
                    anchors.centerIn: parent
                    width: 355
                    height: 345
                    radius: 30
                    color: "#B487AF"
                    opacity: 1
                    CanvasOne {
                        p_width: 200
                        p_height: 70
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        p_text1: "Редактор"
                        p_colorStroke: "#E6D1D1"
                        p_colorText: "black"
                        p_font: "bold italic 30px '" + montserratBoldItalic + "'"
                        p_lineWidth: 6
                        p_textHeight: 27
                        p_canvasOne_visiable: true
                    }

                    Column {
                        anchors.centerIn: parent
                        spacing: 15

                        Rectangle {
                            id: _addStage
                            width: 282
                            height: 67
                            radius: 20
                            color: "white"
                            opacity: 1
                            Text {
                                anchors.centerIn: parent
                                text: "Добавить этапы"
                                color: "black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 18
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    _addStageTextField.visible = true
                                    _addStage.visible = false
                                    _delChapter.visible = false
                                    _popup_edit.closePolicy = Popup.NoAutoClose
                                    _button_aprovedPopupEditChapter.visible = true
                                    _button_backPopupEditChapter.visible = true
                                }
                            }
                        }

                        Rectangle {
                            id: _delChapter
                            width: 282
                            height: 67
                            radius: 20
                            color: "white"
                            opacity: 1
                            Image {
                                anchors.left: parent.left
                                anchors.leftMargin: 10
                                anchors.verticalCenter: parent.verticalCenter
                                width: 46
                                height: 45
                                source: "qrc:/svg/Delete_on_editor.svg"
                            }
                            Text {
                                anchors.right: parent.right
                                anchors.rightMargin: 20
                                anchors.verticalCenter: parent.verticalCenter
                                text: "Удалить главу"
                                color: "black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 18
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    _popupDeleteChapter.open()
                                }
                            }
                        }

                        TextField {
                            id: _addStageTextField
                            width: 285
                            height: 53
                            visible: false
                            horizontalAlignment: TextEdit.AlignHCenter
                            verticalAlignment: TextEdit.AlignVCenter
                            color: "#5c5c5c"
                            placeholderText: "Введите кол-во этапов"
                            placeholderTextColor: "#5c5c5c"
                            font.family: montserratSemiBoldItalic
                            font.bold: true
                            font.italic: true
                            font.pointSize: 13
                            validator: RegularExpressionValidator {regularExpression: /[1-9]{1}[0-9]{0,1}/}
                            background: Rectangle {
                                width: 285
                                height: 53
                                radius: 20
                                color: "white"
                            }

                            onEditingFinished:
                            {
                                _addStageTextField.text = text
                                _addStageTextField.color = "#2b2b2b"
                                _addStageTextField.font.pointSize = 15
                            }

                            onTextEdited:
                            {
                                _addStageTextField.color = "#5c5c5c"
                                _addStageTextField.font.pointSize = 13
                            }
                        }
                    }

                    Rectangle
                    {
                        id: _button_backPopupEditChapter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 17
                        anchors.left: parent.left
                        anchors.leftMargin: 17
                        visible: false
                        width: 145
                        height: 45
                        radius: 10
                        color: "white"
                        border.color: "black"
                        border.width: 1

                        Text
                        {
                            text: "Отмена"
                            color: "#33363F"
                            font.family: montserratBoldItalic
                            font.bold: true
                            font.italic: true
                            font.pointSize: 13
                            anchors.centerIn: parent
                            wrapMode: Text.WordWrap
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                _addStage.visible = true
                                _addStageTextField.visible = false
                                _delChapter.visible = true
                                _addStageTextField.text = ""
                                _addStageTextField.focus = false
                                _popup_edit.closePolicy = Popup.CloseOnReleaseOutside
                                _button_aprovedPopupEditChapter.visible = false
                                _button_backPopupEditChapter.visible = false
                            }
                        }
                    }

                    Rectangle
                    {
                        id: _button_aprovedPopupEditChapter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 17
                        anchors.right: parent.right
                        anchors.rightMargin: 17
                        visible: false
                        width: 145
                        height: 45
                        radius: 10
                        color: "white"
                        border.color: "black"
                        border.width: 1

                        Text
                        {
                            text: "Далее"
                            color: "#33363F"
                            font.family: montserratBoldItalic
                            font.bold: true
                            font.italic: true
                            font.pointSize: 13
                            anchors.centerIn: parent
                            wrapMode: Text.WordWrap
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                for(let i = 0; i < Number(_addStageTextField.text); i++)
                                {
                                    _listModelAddStage.append({"l_nameStage" : "", "l_lection" : false,
                                                                "l_practica" : false, "l_laba" : false})
                                }
                                _stack.push(_editStageCom)

                                _popup_edit.close()
                                _addStage.visible = true
                                _addStageTextField.visible = false
                                _delChapter.visible = true
                                _addStageTextField.text = ""
                                _addStageTextField.focus = false
                                _popup_edit.closePolicy = Popup.CloseOnReleaseOutside
                                _button_aprovedPopupEditChapter.visible = false
                                _button_backPopupEditChapter.visible = false
                            }
                        }
                    }
                }
            }

            Popup
            {
                id: _popupDeleteChapter
                parent: Overlay.overlay
                x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
                y: -height // Начальная позиция выше экрана
                width: 300
                height: 150
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
                    _popup_edit.close()
                    y = -height // Уводим за пределы экрана вверх
                }

                Rectangle
                {
                    anchors.centerIn: parent
                    width: 340
                    height: 180
                    radius: 30
                    color: "#B487AF"
                    opacity: 1
                    border.color: "black"
                    border.width: 1

                    CanvasTwo
                    {
                        p_width: 300
                        p_height: 70

                        anchors.top: parent.top
                        anchors.topMargin: 35

                        p_text1: "Удалить выбранную"
                        p_text2: "главу?"
                        p_colorStroke: "#E6D1D1"
                        p_colorText: "#33363F"
                        p_font: "bold italic 26px '" + montserratBoldItalic + "'"
                        p_lineWidth: 4
                        p_textHeight: 26
                        p_canvasTwo_visiable: true
                    }

                    Rectangle
                    {
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
                            text: "Подтвердить"
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
                                _client.slotConnecting()
                                _client.deleteChapter(currentChapter)
                                _client.getTailChapters()
                                _client.slotDisconnecting()
                                if(_client.result === true)
                                {
                                    _listViewChaptersRedact.update()
                                } else {
                                    console.log("Ошибка при удалении главы")
                                }
                                _popupDeleteChapter.close()
                            }
                        }
                    }
                    Rectangle
                    {
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
                            text: "Назад"
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
                                _popupDeleteChapter.close()
                            }
                        }
                    }
                }
            }

        }
    }


//Редактор этапов
    Component{
        id: _editStageCom
        Edit_stage {
            id: _editStage
        }
    }


//Личный кабинет
    Component
    {
        id: _cabinetCom
        Personal_Cabinet
        {
            id: _cabinet
            Menu_Bar {
                id: _menu
            }

            Rectangle
            {
                anchors.centerIn: parent
                width: 368
                height: 481
                color: "transparent"

                CanvasOne
                {
                    id: _name
                    p_width: 368
                    p_height: 70

                    p_text1: _client.surnamePlayer + " " + _client.namePlayer
                    p_colorStroke: "black"
                    p_colorText: "#F4B7EE"
                    p_font: "bold italic 36px '" + montserratSemiBoldItalic + "'"
                    p_lineWidth: 12
                    p_textHeight: 27
                    p_canvasOne_visiable: true
                }
                CanvasOne
                {
                    id: _party
                    p_width: 220
                    p_height: 50

                    p_topMargin: 70
                    anchors.left: parent.left
                    anchors.horizontalCenter: undefined

                    p_text1: "Ваше пати:"
                    p_colorStroke: "black"
                    p_colorText: "#F4B7EE"
                    p_font: "bold italic 32px '" + montserratMediumItalic + "'"
                    p_lineWidth: 12
                    p_textHeight: 27
                    p_canvasOne_visiable: true
                }
                CanvasOne
                {
                    id: _partyNum
                    p_width: 135
                    p_height: 50
                    p_topMargin: 70
                    anchors.horizontalCenter: undefined
                    anchors.left: _party.right

                    p_text1: _client.squadName
                    p_colorStroke: "black"
                    p_colorText: "#FB3984"
                    p_font: "bold italic 32px '" + montserratSemiBoldItalic + "'"
                    p_lineWidth: 12
                    p_textHeight: 27
                    p_canvasOne_visiable: true
                }
                Rectangle
                {
                    id: _fonPhoto
                    anchors
                    {
                        top: _partyNum.bottom
                        horizontalCenter: parent.horizontalCenter
                    }
                    width: 342
                    height: 265
                    color: "#D9D9D9"
                    opacity: 0.25
                    radius: 20
                }
                Rectangle
                {
                    id: _fonPhotoBorder
                    anchors
                    {
                        top: _partyNum.bottom
                        horizontalCenter: parent.horizontalCenter
                    }
                    width: 342
                    height: 265
                    color: "transparent"
                    border.color: "black"
                    border.width: 1
                    radius: 20
                    Image
                    {
                        id: _personage
                        anchors.centerIn: parent
                        width: 320
                        height: 245
                        source: _listModelRaces.get(indexRace).l_source
                        fillMode: Image.PreserveAspectCrop
                    }
                }
                Image
                {
                    id: _hpBar
                    anchors.top: parent.top
                    anchors.topMargin: 400
                    anchors.left: parent.left
                    anchors.horizontalCenter: undefined

                    source: "qrc:/images/Hp.png"
                }
                CanvasOne
                {
                    id: _countHp
                    p_width: 45
                    p_height: 40

                    p_topMargin: 410
                    anchors.horizontalCenter: undefined
                    anchors.left: parent.left
                    anchors.leftMargin: 250


                    p_text1: _client.tailRaceArr[1]
                    p_colorStroke: "black"
                    p_colorText: "#FB3984"
                    p_font: "bold italic 24px '" + montserratBoldItalic + "'"
                    p_lineWidth: 6
                    p_textHeight: 12
                    p_canvasOne_visiable: true
                }
                Image
                {
                    id: _backpack
                    anchors.top: parent.top
                    anchors.topMargin: 410
                    anchors.horizontalCenter: undefined
                    anchors.left: _countHp.right

                    source: "qrc:/svg/Backpack.svg"
                    MouseArea
                    {
                        anchors.fill: parent
                        enabled: true
                        onClicked:
                        {
                            onClicked: _popup_backpack.open()
                        }
                    }
                    Popup
                    {
                        id: _popup_backpack
                        parent: Overlay.overlay
                        x: parent.width - width // Привязка правым краем
                        y: Math.round((parent.height - height) / 2)
                        width: 155
                        height: 386
                        visible: false

                        Behavior on x
                        {
                            NumberAnimation
                            {
                                duration: 300
                                easing.type: Easing.InOutQuad // Тип сглаживания
                            }
                        }

                        onOpened:
                        {
                            x = parent.width - width // Привязка правым краем при открытии
                        }

                        onClosed:
                        {
                            x = parent.width // Уводим за пределы экрана
                        }

                        Rectangle
                        {
                            anchors.centerIn: parent
                            width: 155
                            height: 386
                            color:"white"
                            opacity: 1

                            Grid
                            {
                                anchors.centerIn: parent
                                columns: 2
                                spacing: 1
                                Rectangle
                                {
                                    color: "#744213"
                                    width: 76
                                    height: 76
                                    Image
                                    {
                                        source: "qrc:/svg/Large_amulet.svg"
                                        width: 70
                                        height: 70
                                        anchors.centerIn: parent
                                        fillMode: Image.PreserveAspectFit
                                        visible: true
                                        MouseArea
                                        {
                                            anchors.fill: parent
                                            enabled: true
                                            onClicked:
                                            {
                                                onClicked: _popup_large_amulet.open()
                                            }
                                        }
                                    }
                                }
                                Rectangle
                                {
                                    color: "#744213"
                                    width: 76
                                    height: 76
                                    Image
                                    {
                                        source: "qrc:/svg/Small_amulet.svg"
                                        width: 70
                                        height: 70
                                        fillMode: Image.PreserveAspectFit
                                        anchors.centerIn: parent
                                        visible: true
                                        MouseArea
                                        {
                                            anchors.fill: parent
                                            enabled: true
                                            onClicked:
                                            {
                                                onClicked: _popup_small_amulet.open()
                                            }
                                        }
                                    }
                                }
                                Rectangle
                                {
                                    color: "#744213"
                                    width: 76
                                    height: 76
                                    Image
                                    {
                                        source: "qrc:/svg/Average_amulet.svg"
                                        width: 70
                                        height: 70
                                        anchors.centerIn: parent
                                        fillMode: Image.PreserveAspectFit
                                        visible: true
                                        MouseArea
                                        {
                                            anchors.fill: parent
                                            enabled: true
                                            onClicked:
                                            {
                                                onClicked: _popup_average_amulet.open()
                                            }
                                        }
                                    }
                                }
                                Rectangle { color: "#744213"; width: 76; height: 76 }
                                Rectangle { color: "#744213"; width: 76; height: 76 }
                                Rectangle { color: "#744213"; width: 76; height: 76 }
                                Rectangle { color: "#744213"; width: 76; height: 76 }
                                Rectangle { color: "#744213"; width: 76; height: 76 }
                                Rectangle { color: "#744213"; width: 76; height: 76 }
                                Rectangle { color: "#744213"; width: 76; height: 76 }
                            }

                        }
                    }
                    Popup
                    {
                        id: _popup_small_amulet
                        parent: Overlay.overlay
                        x: Math.round((parent.width - width) / 2)
                        y: Math.round((parent.height - height) / 2)
                        width: 245
                        height: 152
                        //modal: true

                        visible: false

                        Behavior on x
                        {
                            NumberAnimation
                            {
                                duration: 150
                                easing.type: Easing.InOutQuad // Тип сглаживания
                            }
                        }

                        onOpened:
                        {
                            x = Math.round((parent.width - width) / 2)
                        }

                        onClosed:
                        {
                            x = -width
                        }


                        Item
                        {
                            anchors.centerIn: parent
                            width: 275
                            height: 182

                            Rectangle
                            {
                                id: _fon_rec_small_amulet
                                anchors.fill: parent
                                color: "#C3748F"
                                //opacity: 0.5
                                visible: true
                                radius: 30

                                CanvasOne
                                {
                                    id: _text1_small_amulet
                                    p_width: 234
                                    p_height: 22
                                    p_text1: "Вы уверены,"
                                    p_colorStroke: "White"
                                    p_colorText: "#Black"
                                    p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                    p_lineWidth: 2
                                    p_textHeight: 6
                                    p_canvasOne_visiable: true
                                    p_topMargin: 30
                                }
                                CanvasOne
                                {
                                    id: _text2_small_amulet
                                    p_width: 245
                                    p_height: 22
                                    p_text1: "что хотите применить"
                                    p_colorStroke: "White"
                                    p_colorText: "#Black"
                                    p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                    p_lineWidth: 2
                                    p_textHeight: 6
                                    p_canvasOne_visiable: true
                                    anchors.top: _text1_small_amulet.bottom
                                    p_topMargin: 3
                                }
                                CanvasOne
                                {
                                    id: _text3_small_amulet
                                    p_width: 234
                                    p_height: 22
                                    p_text1: "малый амулет?"
                                    p_colorStroke: "White"
                                    p_colorText: "#Black"
                                    p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                    p_lineWidth: 2
                                    p_textHeight: 6
                                    p_canvasOne_visiable: true
                                    anchors.top: _text2_small_amulet.bottom
                                    p_topMargin: 3
                                }
                                Rectangle
                                {
                                    width: 98
                                    height: 39
                                    anchors.right: _fon_rec_small_amulet.right
                                    anchors.rightMargin: 10
                                    anchors.bottom: _fon_rec_small_amulet.bottom
                                    anchors.bottomMargin: 20
                                    color: "#D9D9D9"
                                    radius: 10

                                    Text
                                    {

                                        text: "Отмена"
                                        color: "Black"
                                        font.family: montserratBoldItalic
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 16

                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.verticalCenter: parent.verticalCenter
                                        wrapMode: Text.WordWrap
                                    }
                                    MouseArea
                                    {
                                        anchors.fill: parent
                                        onClicked:
                                        {
                                            _popup_small_amulet.close()
                                        }
                                    }
                                }

                                Rectangle
                                {

                                    width: 98
                                    height: 39
                                    anchors.left: _fon_rec_small_amulet.left
                                    anchors.leftMargin: 10
                                    anchors.bottom: _fon_rec_small_amulet.bottom
                                    anchors.bottomMargin: 20
                                    color: "#D9D9D9"
                                    radius: 10
                                    Text
                                    {
                                        text: "Да"
                                        color: "Black"
                                        font.family: montserratBoldItalic
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 16

                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.verticalCenter: parent.verticalCenter
                                        wrapMode: Text.WordWrap
                                    }
                                    MouseArea
                                    {
                                        anchors.fill: parent
                                        onClicked:
                                        {

                                        }
                                    }
                                }
                            }
                        }
                    }
                    Popup
                    {
                        id: _popup_average_amulet
                        parent: Overlay.overlay
                        x: Math.round((parent.width - width) / 2)
                        y: Math.round((parent.height - height) / 2)
                        width: 245
                        height: 152
                        //modal: true

                        visible: false

                        Behavior on x
                        {
                            NumberAnimation
                            {
                                duration: 150
                                easing.type: Easing.InOutQuad // Тип сглаживания
                            }
                        }

                        onOpened:
                        {
                            x = Math.round((parent.width - width) / 2)
                        }

                        onClosed:
                        {
                            x = -width
                        }


                        Item
                        {
                            anchors.centerIn: parent
                            width: 275
                            height: 182

                            Rectangle
                            {
                                id: _fon_rec_average_amulet
                                anchors.fill: parent
                                color: "#C3748F"
                                //opacity: 0.5
                                visible: true
                                radius: 30

                                CanvasOne
                                {
                                    id: _text1_average_amulet
                                    p_width: 234
                                    p_height: 22
                                    p_text1: "Вы уверены,"
                                    p_colorStroke: "White"
                                    p_colorText: "#Black"
                                    p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                    p_lineWidth: 2
                                    p_textHeight: 6
                                    p_canvasOne_visiable: true
                                    p_topMargin: 30
                                }
                                CanvasOne
                                {
                                    id: _text2_average_amulet
                                    p_width: 245
                                    p_height: 22
                                    p_text1: "что хотите применить"
                                    p_colorStroke: "White"
                                    p_colorText: "#Black"
                                    p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                    p_lineWidth: 2
                                    p_textHeight: 6
                                    p_canvasOne_visiable: true
                                    anchors.top: _text1_average_amulet.bottom
                                    p_topMargin: 3
                                }
                                CanvasOne
                                {
                                    id: _text3_average_amulet
                                    p_width: 234
                                    p_height: 22
                                    p_text1: "средний амулет?"
                                    p_colorStroke: "White"
                                    p_colorText: "#Black"
                                    p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                    p_lineWidth: 2
                                    p_textHeight: 6
                                    p_canvasOne_visiable: true
                                    anchors.top: _text2_average_amulet.bottom
                                    p_topMargin: 3
                                }
                                Rectangle
                                {
                                    width: 98
                                    height: 39
                                    anchors.right: _fon_rec_average_amulet.right
                                    anchors.rightMargin: 10
                                    anchors.bottom: _fon_rec_average_amulet.bottom
                                    anchors.bottomMargin: 20
                                    color: "#D9D9D9"
                                    radius: 10

                                    Text
                                    {

                                        text: "Отмена"
                                        color: "Black"
                                        font.family: montserratBoldItalic
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 16

                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.verticalCenter: parent.verticalCenter
                                        wrapMode: Text.WordWrap
                                    }
                                    MouseArea
                                    {
                                        anchors.fill: parent
                                        onClicked:
                                        {
                                            _popup_average_amulet.close()
                                        }
                                    }
                                }

                                Rectangle
                                {

                                    width: 98
                                    height: 39
                                    anchors.left: _fon_rec_average_amulet.left
                                    anchors.leftMargin: 10
                                    anchors.bottom: _fon_rec_average_amulet.bottom
                                    anchors.bottomMargin: 20
                                    color: "#D9D9D9"
                                    radius: 10
                                    Text
                                    {
                                        text: "Да"
                                        color: "Black"
                                        font.family: montserratBoldItalic
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 16

                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.verticalCenter: parent.verticalCenter
                                        wrapMode: Text.WordWrap
                                    }
                                    MouseArea
                                    {
                                        anchors.fill: parent
                                        onClicked:
                                        {

                                        }
                                    }
                                }
                            }
                        }
                    }
                    Popup
                    {
                        id: _popup_large_amulet
                        parent: Overlay.overlay
                        x: Math.round((parent.width - width) / 2)
                        y: Math.round((parent.height - height) / 2)
                        width: 245
                        height: 152
                        //modal: true

                        visible: false

                        Behavior on x
                        {
                            NumberAnimation
                            {
                                duration: 150
                                easing.type: Easing.InOutQuad // Тип сглаживания
                            }
                        }

                        onOpened:
                        {
                            x = Math.round((parent.width - width) / 2)
                        }

                        onClosed:
                        {
                            x = -width
                        }


                        Item
                        {
                            anchors.centerIn: parent
                            width: 275
                            height: 182

                            Rectangle
                            {
                                id: _fon_rec_large_amulet
                                anchors.fill: parent
                                color: "#C3748F"
                                //opacity: 0.5
                                visible: true
                                radius: 30

                                CanvasOne
                                {
                                    id: _text1_large_amulet
                                    p_width: 234
                                    p_height: 22
                                    p_text1: "Вы уверены,"
                                    p_colorStroke: "White"
                                    p_colorText: "#Black"
                                    p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                    p_lineWidth: 2
                                    p_textHeight: 6
                                    p_canvasOne_visiable: true
                                    p_topMargin: 30
                                }
                                CanvasOne
                                {
                                    id: _text2_large_amulet
                                    p_width: 245
                                    p_height: 22
                                    p_text1: "что хотите применить"
                                    p_colorStroke: "White"
                                    p_colorText: "#Black"
                                    p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                    p_lineWidth: 2
                                    p_textHeight: 6
                                    p_canvasOne_visiable: true
                                    anchors.top: _text1_large_amulet.bottom
                                    p_topMargin: 3
                                }
                                CanvasOne
                                {
                                    id: _text3_large_amulet
                                    p_width: 234
                                    p_height: 22
                                    p_text1: "большой амулет?"
                                    p_colorStroke: "White"
                                    p_colorText: "#Black"
                                    p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                    p_lineWidth: 2
                                    p_textHeight: 6
                                    p_canvasOne_visiable: true
                                    anchors.top: _text2_large_amulet.bottom
                                    p_topMargin: 3
                                }
                                Rectangle
                                {
                                    width: 98
                                    height: 39
                                    anchors.right: _fon_rec_large_amulet.right
                                    anchors.rightMargin: 10
                                    anchors.bottom: _fon_rec_large_amulet.bottom
                                    anchors.bottomMargin: 20
                                    color: "#D9D9D9"
                                    radius: 10

                                    Text
                                    {

                                        text: "Отмена"
                                        color: "Black"
                                        font.family: montserratBoldItalic
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 16

                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.verticalCenter: parent.verticalCenter
                                        wrapMode: Text.WordWrap
                                    }
                                    MouseArea
                                    {
                                        anchors.fill: parent
                                        onClicked:
                                        {
                                            _popup_large_amulet.close()
                                        }
                                    }
                                }

                                Rectangle
                                {

                                    width: 98
                                    height: 39
                                    anchors.left: _fon_rec_large_amulet.left
                                    anchors.leftMargin: 10
                                    anchors.bottom: _fon_rec_large_amulet.bottom
                                    anchors.bottomMargin: 20
                                    color: "#D9D9D9"
                                    radius: 10
                                    Text
                                    {
                                        text: "Да"
                                        color: "Black"
                                        font.family: montserratBoldItalic
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 16

                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.verticalCenter: parent.verticalCenter
                                        wrapMode: Text.WordWrap
                                    }
                                    MouseArea
                                    {
                                        anchors.fill: parent
                                        onClicked:
                                        {

                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Image
                {
                    id: _raceBar
                    anchors.top:_hpBar.bottom
                    anchors.left: parent.left
                    anchors.horizontalCenter: undefined
                    source: "qrc:/images/RaceBar.png"

                    CanvasOne
                    {
                        id: _race

                        p_width: 232
                        p_height: 45

                        anchors.centerIn: parent
                        anchors.horizontalCenterOffset: -15

                        p_text1: _client.tailRaceArr[0]
                        p_colorStroke: "black"
                        p_colorText: "#FB3984"
                        p_font: "bold italic 24px '" + montserratBoldItalic + "'"
                        p_lineWidth: 6
                        p_textHeight: 12
                        p_canvasOne_visiable: true
                    }

                    Image
                    {
                        id: _icon
                        source: {
                            if(_client.classPlayer === _listModelSourceForClasPlayer.get(0).l_nameClass)
                                return _listModelSourceForClasPlayer.get(0).l_source
                            else if(_client.classPlayer === _listModelSourceForClasPlayer.get(1).l_nameClass)
                                return _listModelSourceForClasPlayer.get(1).l_source
                            else if(_client.classPlayer === _listModelSourceForClasPlayer.get(2).l_nameClass)
                                return _listModelSourceForClasPlayer.get(2).l_source
                            else if(_client.classPlayer === _listModelSourceForClasPlayer.get(3).l_nameClass)
                                return _listModelSourceForClasPlayer.get(3).l_source
                        }
                        anchors {
                            left: _race.right
                            leftMargin: 7
                            top: _raceBar.top
                            topMargin: 5
                        }
                        width: 28
                        height: 28
                        fillMode: Image.PreserveAspectCrop

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                _stack.push(_class_Com)
                            }
                        }
                    }
                }

            }
            Rectangle
            {
                id: _cabinet_Fairy_tales_rect
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 65
                    left: _menu.left
                }
                width: 116
                height: 48
                radius: 15
                color: "#B487AF"

                Text
                {
                    id: _cabinet_Fairy_tales_text
                    anchors.top: parent.top
                    anchors.topMargin: 12
                    anchors.left: parent.left
                    anchors.leftMargin: 32
                    color: "#33363F"
                    font.bold: true
                    font.italic: true
                    font.pointSize: 14
                    font.family: montserratBoldItalic
                    text: "Сказки"
                }

                Image
                {
                    id: _tales_cabinet
                    anchors.top: parent.top
                    anchors.topMargin: 7
                    anchors.left: parent.left
                    anchors.leftMargin: 4
                    source: "qrc:/svg/Tales_cabinet.svg"
                }

                MouseArea
                {
                    anchors.fill: parent
                    enabled: true
                    onClicked:
                    {
                        _stack.pop()
                        _stack.push(_fairyTalesCom)
                        _root.setTitle("Сказки")
                    }
                }
            }

            Rectangle
            {
                id: _cabinet_leave_rect
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 65
                    right: _menu.right
                }
                width: 116
                height: 48
                radius: 15
                color: "#B487AF"

                Text
                {
                    id: _cabinet_leave_text
                    anchors.top: parent.top
                    anchors.topMargin: 12
                    anchors.left: parent.left
                    anchors.leftMargin: 36

                    color: "#33363F"
                    font.bold: true
                    font.italic: true
                    font.pointSize: 14
                    font.family: montserratBoldItalic
                    text: "Выход"
                }

                Image
                {
                    id: _leave_cabinet
                    anchors.top: parent.top
                    anchors.topMargin: 7
                    anchors.left: parent.left
                    anchors.leftMargin: 4

                    source: "qrc:/svg/Leave_cabinet.svg"
                }

                MouseArea
                {
                    anchors.fill: parent
                    enabled: true
                    onClicked:
                    {
                        onClicked: _popup_leave.open()
                    }
                }

                Popup
                {
                    id: _popup_leave
                    parent: Overlay.overlay
                    x: Math.round((parent.width - width) / 2)
                    y: Math.round((parent.height - height) / 2)
                    width: 245
                    height: 152
                    //modal: true

                    visible: false

                    Behavior on x
                    {
                        NumberAnimation
                        {
                            duration: 150
                            easing.type: Easing.InOutQuad // Тип сглаживания
                        }
                    }

                    onOpened:
                    {
                        x = Math.round((parent.width - width) / 2)
                    }

                    onClosed:
                    {
                        x = -width
                    }


                    Item
                    {
                        anchors.centerIn: parent
                        width: 275
                        height: 182

                        Rectangle
                        {
                            id: _fon_rec_leave
                            anchors.fill: parent
                            color: "#C3748F"
                            //opacity: 0.5
                            visible: true
                            radius: 30

                            CanvasOne
                            {
                                id: _text1_leave
                                p_width: 234
                                p_height: 22
                                p_text1: "Вы уверены,"
                                p_colorStroke: "White"
                                p_colorText: "#Black"
                                p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                p_lineWidth: 2
                                p_textHeight: 6
                                p_canvasOne_visiable: true
                                p_topMargin: 30
                            }
                            CanvasOne
                            {
                                id: _text2_leave
                                p_width: 234
                                p_height: 22
                                p_text1: "что хотите выйти"
                                p_colorStroke: "White"
                                p_colorText: "#Black"
                                p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                p_lineWidth: 2
                                p_textHeight: 6
                                p_canvasOne_visiable: true
                                anchors.top: _text1_leave.bottom
                                p_topMargin: 3
                            }
                            CanvasOne
                            {
                                id: _text3_leave
                                p_width: 234
                                p_height: 22
                                p_text1: "из своего аккаунта?"
                                p_colorStroke: "White"
                                p_colorText: "#Black"
                                p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                                p_lineWidth: 2
                                p_textHeight: 6
                                p_canvasOne_visiable: true
                                anchors.top: _text2_leave .bottom
                                p_topMargin: 3
                            }
                            Rectangle
                            {
                                width: 98
                                height: 39
                                anchors.right: _fon_rec_leave.right
                                anchors.rightMargin: 10
                                anchors.bottom: _fon_rec_leave.bottom
                                anchors.bottomMargin: 20
                                color: "#D9D9D9"
                                radius: 10

                                Text
                                {

                                    text: "Отмена"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 16

                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                }
                                MouseArea
                                {
                                    anchors.fill: parent
                                    onClicked:
                                    {
                                         _popup_leave.close()
                                    }
                                }
                            }

                            Rectangle
                            {

                                width: 98
                                height: 39
                                anchors.left: _fon_rec_leave.left
                                anchors.leftMargin: 10
                                anchors.bottom: _fon_rec_leave.bottom
                                anchors.bottomMargin: 20
                                color: "#D9D9D9"
                                radius: 10
                                Text
                                {
                                    text: "Да"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 16

                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                }
                                MouseArea
                                {
                                    anchors.fill: parent
                                    onClicked:
                                    {
                                        _popup_leave.close()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                        _stack.pop()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }


// Бестиарий
    Component {
        id: _bestiariyCom
        Bestiariy {
            id: _bestiariy

            Menu_Bar {

            }

            CanvasTwo {
                id: _nameBestiariy
                p_width: 393
                p_height: 115
                p_topMargin: 188

                p_text1: "Бестиарий"
                p_colorStroke: "white"
                p_colorText: "#0E0F1E"
                p_font: "bold italic 30px '" + montserratBoldItalic + "'"
                p_lineWidth: 12
                p_textHeight: 27
                p_canvasTwo_visiable: true
            }
            Custom_Button {
                id: _bestiariy_creatures
                p_anchor_top: _nameBestiariy
                p_anchor_topMargin: 100

                p_width: 355
                p_height: 86
                p_radius: 25
                p_colorRect: "#D9D9D9"
                p_opacity: 0.6
                p_border_color: "black"
                p_border_width: 1

                p_image_visiable: false

                p_enabled_mouseArea: true
                p_stack_pushing: true
                p_stack_push: _creatures_Com // пуш к фрейму с существами
                p_root_title: "Существа"

                p_text1: "Существа"
                p_colorStroke: "#B4AFBE"
                p_colorText: "black"
                p_font: "bold italic 28px '" + montserratBoldItalic + "'"
                p_lineWidth: 6
                p_textHeight: 25
                p_canvasOne_visiable: true
                p_canvasTwo_visiable: false

                // Image {
                //     id: button_creatures_image
                //     source: "qrc:/images/User_photo.png" // Укажи путь к изображению
                //     width: 50
                //     height: 50
                //     anchors.left: parent.left
                //     anchors.leftMargin: 22
                //     anchors.verticalCenter: parent.verticalCenter
                //     visible: true
                // }
            }

            Custom_Button {
                id: _bestiariy_class
                p_anchor_top: _bestiariy_creatures
                p_anchor_topMargin: 123

                p_width: 355
                p_height: 86
                p_radius: 25
                p_colorRect: "#D9D9D9"
                p_opacity: 0.6
                p_border_color: "black"
                p_border_width: 1

                p_image_visiable: false

                p_enabled_mouseArea: true
                p_stack_pushing: true
                p_stack_push: _class_Com // пуш к фрейму с классами
                p_root_title: "Классы"

                p_text1: "Классы"
                p_colorStroke: "#B4AFBE"
                p_colorText: "black"
                p_font: "bold italic 28px '" + montserratBoldItalic + "'"
                p_lineWidth: 6
                p_textHeight: 25
                p_canvasOne_visiable: true
                p_canvasTwo_visiable: false

                // Image {
                //     id: button_class_image
                //     source: "qrc:/images/Class.png" // Укажи путь к изображению
                //     width: 50
                //     height: 50
                //     anchors.left: parent.left
                //     anchors.leftMargin: 22
                //     anchors.verticalCenter: parent.verticalCenter
                //     visible: true
                // }
            }

            Custom_Button {
                id: _bestiariy_amulets
                p_anchor_top: _bestiariy_class
                p_anchor_topMargin: 123

                p_width: 355
                p_height: 86
                p_radius: 25
                p_colorRect: "#D9D9D9"
                p_opacity: 0.6
                p_border_color: "black"
                p_border_width: 1

                p_image_visiable: false

                p_enabled_mouseArea: true
                p_stack_pushing: true
                p_stack_push: _amulets_Com // пуш к фрейму с амулетами
                p_root_title: "Амулеты"

                p_text1: "Амулеты"
                p_colorStroke: "#B4AFBE"
                p_colorText: "black"
                p_font: "bold italic 28px '" + montserratBoldItalic + "'"
                p_lineWidth: 6
                p_textHeight: 25
                p_canvasOne_visiable: true
                p_canvasTwo_visiable: false

                // Image {
                //     id: button_amulets_image
                //     source: "qrc:/images/Amulets.png" // Укажи путь к изображению
                //     width: 50
                //     height: 50
                //     anchors.left: parent.left
                //     anchors.leftMargin: 22
                //     anchors.verticalCenter: parent.verticalCenter
                //     visible: true
                // }
            }
        }
    }


// Классы
    Component {
        id: _class_Com
        Bestiariy_class {
            id: _class
            CanvasOne {
                id: _nameAmulets
                p_width: 320
                p_height: 70
                p_topMargin: 58

                p_text1: "Классы"
                p_colorStroke: "White"
                p_colorText: "#Black"
                p_font: "bold italic 36px '" + montserratBoldItalic + "'"
                p_lineWidth: 12
                p_textHeight: 27
                p_canvasOne_visiable: true
            }

            ListView {
                id: _listViewClass
                width: parent.width
                height: 410
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                    left: parent.left
                    leftMargin: 10
                }
                clip: true
                model: _listModelClasses
                orientation: Qt.Horizontal // Устанавливаем горизонтальную ориентацию
                spacing: 20
                delegate: Rectangle {
                    width: 300
                    height: 410
                    radius: 15
                    color: "transparent"
                    border.color: l_color
                    border.width: (l_color === "#DE2ADB") ? 5 : 0

                    MouseArea {
                        anchors.fill: parent
                        enabled: (_client.classPlayer !== "" || p_User === "преподаватель") ? false : true
                        onReleased: {
                            for(let i = 0; i < _listModelClasses.count; i++)
                            {
                                if(i == index)
                                {
                                    _listModelClasses.get(i).l_color = "#DE2ADB"
                                } else {
                                    _listModelClasses.get(i).l_color = "black"
                                }
                                console.log(_listModelClasses.get(i).l_nameClass + " " + _listModelClasses.get(i).l_color)
                            }
                            _listViewClass.update()
                            console.log("Нажал")
                        }
                    }

                    Rectangle {
                        anchors.fill: parent
                        color: "#579C81"
                        radius: 15
                        opacity: 0.6
                    }

                    Image {
                        id: _imageItem
                        anchors {
                            left: parent.left
                            leftMargin: 10
                            top: parent.top
                            topMargin: 15
                        }
                        width: 65
                        height: 65
                        source: {
                            if (index === 0) return "qrc:/images/Gonec.png"
                            else if (index === 1) return "qrc:/images/Silach.png"
                            else if (index === 2) return "qrc:/images/Razboinik.png"
                            else if (index === 3) return "qrc:/images/Pisar.png"
                        }
                    }

                    CanvasTwo {
                        id: _nameClass
                        p_width: 250
                        p_height: 20
                        anchors {
                            right: parent.right
                            rightMargin: 5
                            leftMargin: 15
                            verticalCenter: _imageItem.verticalCenter
                        }
                        p_text1: _listModelClasses.get(index).l_nameClass
                        p_colorStroke: "Black"
                        p_colorText: "White"
                        p_font: "bold italic 24px '" + montserratBoldItalic + "'"
                        p_lineWidth: 2
                        p_textHeight: 20
                        p_canvasTwo_visiable: true
                    }

                    Text {
                        anchors.centerIn: parent
                        text: {
                            if (index === 0) return "Получает\nдополнительно\n +1 балл за\nвыполнение\nпутешествия,\n максимум +8 баллов";
                            else if (index === 1) return "Может 2 раза\nза главу увеличить\nколичество полученных\nбаллов за битву\nсценария в 2 раза";
                            else if (index === 2) return "Может сбежать с пары\n1 раз за главу, но если\nспособность не была\nиспользована до начала\nвеликой битвы, то\nв начале великой битвы\nполучит +6 баллов";
                            else if (index === 3) return "Уникальный класс, возможен\n1 писец на поток. Ведет\n“историю” получения\nбаллов, полученных на\nлекции, каждого студента\nна потоке. За добросовестное\nисполнение своих обязанностей\nполучит +8 баллов к\nначалу великой битвы";
                        }
                        color: "white"
                        font.pointSize: 14
                        wrapMode: Text.WordWrap
                    }
                }
            }

            Button {
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 72
                    horizontalCenter: parent.horizontalCenter
                }
                width: 200
                height: 65
                visible: (_client.classPlayer !== "" || p_User === "преподаватель") ? false : true
                text: "Подтвердить"
                font.family: montserratMedium
                font.pointSize: 18
                background: Rectangle {
                    width: 200
                    height: 65
                    radius: 20
                    color: "#D9D9D9"
                    opacity: 0.9
                }
                onReleased: {
                    for(let i = 0; i < _listModelClasses.count; i++)
                    {
                        if(_listModelClasses.get(i).l_color === "#DE2ADB")
                        {
                            _client.slotConnecting()
                            _client.setPlayerTailClass(_listModelClasses.get(i).l_nameClass)

                            if(_client.result === true)
                            {
                                _client.getPlayerTailClass()

                                if(_client.result === true)
                                {
                                    _stack.push(_cabinetCom)
                                    console.log(_client.classPlayer)
                                }
                            } else {
                                _stack.pop()
                                console.log("Ошибка")
                            }
                            _client.slotDisconnecting()
                            _listModelClasses.get(i).l_color = "black"
                        }
                    }
                }
            }

            Close_Button {
                id: _closeClass
                visible: (_client.classPlayer !== "" || p_User === "преподаватель") ? true : false
                p_bottomMargin: 72
                p_color_rect: "#D9D9D9"
                p_opacity: 0.9
                p_root_title: "Бестиарий"
            }
        }
    }


// Амулеты
    Component {
        id: _amulets_Com
        Bestiariy_amulets {
            id: _amulets
            CanvasTwo {
                id: _nameAmulets
                p_width: 320
                p_height: 70
                p_topMargin: 58
                p_text1: "Амулеты"
                p_colorStroke: "White"
                p_colorText: "#Black"
                p_font: "bold italic 36px '" + montserratBoldItalic + "'"
                p_lineWidth: 12
                p_textHeight: 27
                p_canvasTwo_visiable: true
            }
            ListView {
                width: parent.width
                height: 410
                clip: true
                model: 3
                orientation: Qt.Horizontal
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10

                delegate: Rectangle {
                    width: 300
                    height: 410
                    color: "transparent"

                    Rectangle {
                        width: parent.width
                        height: parent.height
                        radius: 15
                        color: "#6F1450"
                        opacity: 0.6
                    }

                    Image {
                        id: imageItem
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                            top: parent.top
                            leftMargin: 10
                            rightMargin: 10
                            topMargin: 30
                        }
                        source: {
                            if (index === 0) return "qrc:/svg/Small_amulet.svg"
                            else if (index === 1) return "qrc:/svg/Average_amulet.svg"
                            else if (index === 2) return "qrc:/svg/Large_amulet.svg"
                        }
                        // width: 90
                        // height: 90
                    }

                    Text {
                        text: {
                            if (index === 0) return "Малый амулет"
                            else if (index === 1) return "Средний амулет"
                            else if (index === 2) return "Большой амулет"
                        }
                        color: "#FCF113"
                        font.family: montserratBoldItalic
                        font.bold: true
                        font.italic: true
                        font.pointSize: 18
                        anchors.top: imageItem.bottom
                        anchors.horizontalCenter: imageItem.horizontalCenter
                        anchors.topMargin: 10
                        wrapMode: Text.WordWrap
                    }

                    Text {
                        text: {
                            if (index === 0) return "Даёт вам +1 балл";
                            else if (index === 1) return "Даёт вам +3 балла";
                            else if (index === 2) return "Даёт вам +5 баллов";
                        }
                        color: "#FCF113"
                        font.family: montserratBoldItalic
                        font.bold: true
                        font.italic: true
                        font.pointSize: 18
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.topMargin: 20
                        wrapMode: Text.WordWrap
                    }
                }
            }

            Close_Button {
                id: _closeAmulets
                p_bottomMargin: 72
                p_color_rect: "#D9D9D9"
                p_opacity: 0.9
                p_root_title: "Бестиарий"

            }
        }
    }


//Существа
    Component{
        id: _creatures_Com
        Bestiariy_creatures {
            id: _creatures
            CanvasOne {
                id: _Creatures
                p_width: 320
                p_height: 70
                p_topMargin: 58

                p_text1: "Существа"
                p_colorStroke: "White"
                p_colorText: "#Black"
                p_font: "bold italic 36px '" + montserratBoldItalic + "'"
                p_lineWidth: 12
                p_textHeight: 27
                p_canvasOne_visiable: true
            }
            Rectangle {
                anchors.centerIn: parent
                width: 370
                height: 5 * 100 // количество видимых элементов * (высота одного элемента + пробел)
                color: "transparent"
                clip: true // Обрезаем содержимое, выходящее за пределы

                ListView {
                    id: _creaturesView
                    width: parent.width
                    height: parent.height
                    clip: true
                    model: _client.racesArr.length
                    spacing: 10 // пробел (можно добавить отступ внутри делегата)

                    delegate: Rectangle {
                        width: _creaturesView.width
                        height: 90
                        radius: 25
                        color: "#D9D9D9"
                        opacity: 0.9
                        border.color: "black"
                        border.width: 1

                        Text {
                            anchors.centerIn: parent
                            anchors.horizontalCenterOffset: -40
                            text: _client.racesArr[_client.racesArr.length-index-1][0]
                            font.family: montserratBoldItalic
                            font.bold: true
                            font.italic: true
                            color: "black"
                            font.pointSize: 20
                            style: Text.Outline
                            styleColor: "white"
                        }

                        Rectangle {
                            width: parent.height - 2
                            height: parent.height - 2
                            color: "#66E782"
                            radius: 25
                            anchors.top: parent.top
                            anchors.topMargin: 1
                            anchors.right: parent.right
                            anchors.rightMargin: 1

                            Text {
                                visible: {
                                    if(index === 0) return false
                                    else if(index === 1) return false
                                    else if(index === 2) return false
                                    else return true
                                }
                                anchors.centerIn: parent
                                text: _client.racesArr[_client.racesArr.length-index-1][1]
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                color: "black"
                                font.pointSize: 20
                                style: Text.Outline
                                styleColor: "white"
                            }

                            Image {
                                id: _imageCreatures
                                source: {
                                    if (index === 0) return "qrc:/images/crown_1.png"
                                    else if (index === 1) return "qrc:/images/crown_2.png"
                                    else if (index === 2) return "qrc:/images/crown_3.png"
                                    else return ""; // Добавляем возврат по умолчанию
                                }
                                width: 70
                                height: 70
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                    }
                }
            }
            Close_Button
            {
                id: _closeCreatures
                p_bottomMargin: 72
                p_color_rect: "#D9D9D9"
                p_opacity: 0.9
                p_root_title: "Бестиарий"
            }
        }
    }


//Рейтинг групп
    Component
    {
        id: _groupCom
        Group {
            id: _group

            Menu_Bar {

            }

            Rectangle
            {
                id: _commonFon
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 250

                width: 335
                height: 488

                color: "#D9D9D9"
                opacity: 0.4
                radius: 20
            }

            CanvasOne
            {
                id: _listParty
                p_width: 295
                p_height: 50
                p_topMargin: 261

                p_text1: "Список пати"
                p_colorStroke: "black"
                p_colorText: "#E6C27B"
                p_font: "bold italic 40px '" + montserratBlackItalic + "'"
                p_lineWidth: 6
                p_textHeight: 18
                p_canvasOne_visiable: true
            }
            Rectangle
            {
                id: _firstPlace
                width: 300
                height: 63
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 340

                radius: 35
                color: "#F5F5F5"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 15
                    spread: 0
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _client.slotConnecting()
                        _client.getPlayerRating(1)
                        _client.slotDisconnecting()
                        _stack.push(_list_group_com)
                        currentGroupForRaitingPlayer = _client.squadsRatingArr[1]
                    }
                }

            }
            Rectangle
            {
                width: 63
                height: 63
                anchors.top: parent.top
                anchors.topMargin: 340
                anchors.left: _firstPlace.left

                radius: 31.5
                color: "#FFD700"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 15
                    spread: 0
                }
                Text
                {
                    anchors.centerIn: parent

                    color: "#000000"
                    font.bold: false
                    font.italic: false
                    font.pointSize: 32
                    font.family: mrsSheppardsRegular
                    text: "1"
                }
            }
            CanvasOne
            {
                id: _nameGroup1
                p_width: 145
                p_height: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 350
                p_text1: _client.squadsRatingArr[1]
                p_colorStroke: "black"
                p_colorText: "#FFD700"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 6
                p_textHeight: 18
                p_canvasOne_visiable: true
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 25
                    spread: 0
                }
            }
            CanvasOne
            {
                p_width: 50
                p_height: 50
                anchors.horizontalCenter: undefined
                anchors.top: parent.top
                anchors.topMargin: 350
                anchors.left: _nameGroup1.right
                anchors.leftMargin: 15

                p_text1: _client.squadsRatingArr[0]
                p_colorStroke: "#FFD700"
                p_colorText: "black"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 6
                p_textHeight: 12
                p_canvasOne_visiable: true
            }

            Rectangle
            {
                id: _secondPlace
                width: 300
                height: 63
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 425

                radius: 35
                color: "#F5F5F5"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 15
                    spread: 0
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _client.slotConnecting()
                        _client.getPlayerRating(3)
                        _client.slotDisconnecting()
                        _stack.push(_list_group_com)
                        currentGroupForRaitingPlayer = _client.squadsRatingArr[3]
                    }
                }

            }
            Rectangle
            {
                width: 63
                height: 63
                anchors.top: parent.top
                anchors.topMargin: 425
                anchors.left: _secondPlace.left

                radius: 31.5
                color: "#C0C0C0"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 15
                    spread: 0
                }
                Text
                {
                    anchors.centerIn: parent

                    color: "#000000"
                    font.bold: false
                    font.italic: false
                    font.pointSize: 26
                    font.family: mrsSheppardsRegular
                    text: "2"
                }
            }
            CanvasOne
            {
                id: _nameGroup2
                p_width: 145
                p_height: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 435

                p_text1: _client.squadsRatingArr[3]
                p_colorStroke: "black"
                p_colorText: "#C0C0C0"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 6
                p_textHeight: 12
                p_canvasOne_visiable: true
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 25
                    spread: 0
                }
            }
            CanvasOne
            {
                p_width: 50
                p_height: 50
                anchors.horizontalCenter: undefined
                anchors.top: parent.top
                anchors.topMargin: 435
                anchors.left: _nameGroup2.right
                anchors.leftMargin: 15

                p_text1: _client.squadsRatingArr[2]
                p_colorStroke: "#C0C0C0"
                p_colorText: "black"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 6
                p_textHeight: 18
                p_canvasOne_visiable: true
            }

            Rectangle
            {
                id: _thirdPlace
                width: 300
                height: 63
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 510

                radius: 35
                color: "#F5F5F5"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 15
                    spread: 0
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _client.slotConnecting()
                        _client.getPlayerRating(5)
                        _client.slotDisconnecting()
                        _stack.push(_list_group_com)
                        currentGroupForRaitingPlayer = _client.squadsRatingArr[5]
                    }
                }

            }
            Rectangle
            {
                width: 63
                height: 63
                anchors.top: parent.top
                anchors.topMargin: 510
                anchors.left: _thirdPlace.left

                radius: 31.5
                color: "#CD7F32"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 15
                    spread: 0
                }
                Text
                {
                    anchors.centerIn: parent

                    color: "#000000"
                    font.bold: false
                    font.italic: false
                    font.pointSize: 26
                    font.family: mrsSheppardsRegular
                    text: "3"
                }
            }
            CanvasOne
            {
                id: _nameGroup3
                p_width: 145
                p_height: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 520

                p_text1: _client.squadsRatingArr[5]
                p_colorStroke: "black"
                p_colorText: "#CD7F32"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 6
                p_textHeight: 12
                p_canvasOne_visiable: true
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 25
                    spread: 0
                }
            }
            CanvasOne
            {
                p_width: 50
                p_height: 50
                anchors.horizontalCenter: undefined
                anchors.top: parent.top
                anchors.topMargin: 520
                anchors.left: _nameGroup3.right
                anchors.leftMargin: 15

                p_text1: _client.squadsRatingArr[4]
                p_colorStroke: "#CD7F32"
                p_colorText: "black"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 6
                p_textHeight: 18
                p_canvasOne_visiable: true
            }

            Rectangle
            {
                id: _fourthPlace
                width: 300
                height: 63
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 595

                radius: 35
                color: "#33363F"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#606060"
                    radius: 10
                    samples: 25
                    spread: 0
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _client.slotConnecting()
                        _client.getPlayerRating(7)
                        _client.slotDisconnecting()
                        _stack.push(_list_group_looser_com)
                        currentGroupForRaitingPlayer = _client.squadsRatingArr[7]
                    }
                }
            }

            Rectangle
            {
                width: 63
                height: 63
                anchors.top: parent.top
                anchors.topMargin: 595
                anchors.left: _fourthPlace.left

                radius: 31.5
                color: "#43464F"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#252525"
                    radius: 10
                    samples: 25
                    spread: 0
                }
                Text
                {
                    anchors.centerIn: parent

                    color: "white"
                    font.bold: false
                    font.italic: false
                    font.pointSize: 24
                    font.family: mrsSheppardsRegular
                    text: "4"
                }
            }
            CanvasOne
            {
                id: _nameGroup4
                p_width: 145
                p_height: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 605

                p_text1: _client.squadsRatingArr[7]
                p_colorStroke: "transparent"
                p_colorText: "white"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 0
                p_textHeight: 0
                p_canvasOne_visiable: true
            }
            CanvasOne
            {
                p_width: 50
                p_height: 50
                anchors.horizontalCenter: undefined
                anchors.top: parent.top
                anchors.topMargin: 605
                anchors.left: _nameGroup4.right
                anchors.leftMargin: 15

                p_text1: _client.squadsRatingArr[6]
                p_colorStroke: "transparent"
                p_colorText: "white"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 0
                p_textHeight: 0
                p_canvasOne_visiable: true
            }
        }
    }


//Квесты
    Component{
        id: _quests_Com
        Quests {
            id: _quests

            Menu_Bar {

            }

            Item {
                id: _item_quests
                width: 359
                height: 272
                anchors.centerIn: parent

                Rectangle {
                    id: _quests_scenario
                    anchors.top: _item_quests.top
                    width: 355
                    height: 112
                    radius: 25
                    color: "transparent"
                    border.color: "black"
                    border.width: 1
                    Rectangle
                    {
                        anchors.fill: parent
                        radius: 25
                        opacity: 0.9
                        width: parent.width
                        height: parent.height
                        color: "#D9D9D9"
                        border.color: "black"
                        border.width: 1
                    }
                    CanvasOne {
                        id: _scenario
                        p_width: 180
                        p_height: 20
                        p_text1: "Сценарий"
                        p_colorStroke: "#716EE4"
                        p_colorText: "#Black"
                        p_font: "bold italic 28px '" + montserratBoldItalic + "'"
                        p_lineWidth: 2
                        p_textHeight: 14
                        p_canvasOne_visiable: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        layer.enabled: true
                        layer.effect: DropShadow {
                            verticalOffset: 5
                            color: "#463C3C"
                            radius: 10
                            samples: 25
                            spread: 0
                        }
                    }
                    Image {
                        id: _button_scenario_image
                        source: "qrc:/svg/Quests_scenario.svg"
                        width: 67
                        height: 67
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.verticalCenter: parent.verticalCenter
                        visible: true
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            _client.slotConnecting()
                            _client.getChapterStagesSteps(currentChapter, currentTail)
                            for (let i = 0; i < _client.allStagesStepsArr.length; i += 2)
                            {
                                currentStage = _client.allStagesStepsArr[i]
                                _client.getPlayerStagePoints(currentStage, currentChapter, currentTail)

                                _listModelStageSteps.append({"l_nameStage" : _client.allStagesStepsArr[i],
                                "l_pointStage" : _client.allPointsStage,
                                "l_nameSteps1" : _client.allStagesStepsArr[i + 1][0],
                                "l_nameSteps2" : _client.allStagesStepsArr[i + 1][1],
                                "l_nameSteps3" : _client.allStagesStepsArr[i + 1][2],
                                "l_countSteps" : _client.allStagesStepsArr[i + 1].length})
                            }
                            _stack.push(_stages_com)
                            _client.slotDisconnecting()
                        }
                    }
                }
                Rectangle
                {
                    id: _sign_up_lection_rect
                    anchors
                    {
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                        topMargin: 350
                    }
                    width:  _quests_adventures.width
                    height: 67
                    color: "transparent"
                    radius: 20
                    visible: (p_User !== "преподаватель") ? true : false

                    Rectangle
                    {
                        anchors.fill: parent
                        radius: 20
                        opacity: 0.9
                        width: parent.width
                        height: parent.height
                        color: "#D9D9D9"
                        border.color: "black"
                        border.width: 1
                    }
                    CanvasOne
                    {
                        p_width: 355
                        p_height: 50
                        anchors.centerIn: parent

                        p_text1: "Записаться на лекцию"
                        p_colorStroke: "#280079"
                        p_colorText: "white"
                        p_font: "bold italic 22px '" + montserratBoldItalic + "'"
                        p_lineWidth: 6
                        p_textHeight: 12
                        p_canvasOne_visiable: true
                        layer.enabled: true
                        layer.effect: DropShadow {
                            verticalOffset: 5
                            color: "#463C3C"
                            radius: 10
                            samples: 25
                            spread: 0
                        }
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            _client.slotConnecting()
                            _signUpLectionPopup.open()
                            _client.result = true
                            _client.getLection(currentTail, currentChapter)
                            _client.slotDisconnecting()
                        }
                    }
                }
                Rectangle
                {
                    id: _statistic_rect
                    anchors
                    {
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                        topMargin: 450
                    }
                    width:  _quests_adventures.width
                    height: 67
                    color: "transparent"
                    radius: 20
                    visible: (p_User !== "преподаватель") ? true : false

                    Rectangle
                    {
                        anchors.fill: parent
                        radius: 20
                        width: parent.width
                        height: parent.height
                        opacity: 0.9
                        color: "#D9D9D9"
                        border.color: "black"
                        border.width: 1
                    }
                    CanvasOne
                    {
                        p_width: 355
                        p_height: 50
                        anchors.centerIn: parent

                        p_text1: "Статистика"
                        p_colorStroke: "#280079"
                        p_colorText: "white"
                        p_font: "bold italic 22px '" + montserratBoldItalic + "'"
                        p_lineWidth: 6
                        p_textHeight: 12
                        p_canvasOne_visiable: true
                        layer.enabled: true
                        layer.effect: DropShadow {
                            verticalOffset: 5
                            color: "#463C3C"
                            radius: 10
                            samples: 25
                            spread: 0
                        }
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            _client.slotConnecting()
                            _client.slotDisconnecting()
                        }
                    }
                }

                Rectangle {
                    id: _quests_adventures
                    anchors.top:  _quests_scenario.bottom
                    anchors.topMargin: 20
                    width: 355
                    height: 112
                    radius: 25
                    color: "transparent"
                    border.width: 1
                    Rectangle
                    {
                        anchors.fill: parent
                        radius: 25
                        opacity: 0.9
                        width: parent.width
                        height: parent.height
                        color: "#D9D9D9"
                        border.color: "black"
                        border.width: 1
                    }
                    CanvasOne {
                        id: _adventures
                        p_width: 220
                        p_height: 20
                        p_text1: "Путешествия"
                        p_colorStroke: "#716EE4"
                        p_colorText: "#Black"
                        p_font: "bold italic 28px '" + montserratBoldItalic + "'"
                        p_lineWidth: 2
                        p_textHeight: 14
                        p_canvasOne_visiable: true
                        anchors.left: _button_adventures_image.right
                        anchors.leftMargin: 10
                        anchors.horizontalCenter: undefined
                        anchors.verticalCenter: parent.verticalCenter
                        layer.enabled: true
                        layer.effect: DropShadow {
                            verticalOffset: 5
                            color: "#463C3C"
                            radius: 10
                            samples: 25
                            spread: 0
                        }
                    }

                    Image {
                        id: _button_adventures_image
                        source: "qrc:/svg/Quests_adventures.svg"
                        width: 67
                        height: 67
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.verticalCenter: parent.verticalCenter
                        visible: true
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            _stack.push(_adventuresCom)
                        }
                    }
                }
            }

            Popup
            {
                id: _signUpLectionPopup
                parent: Overlay.overlay
                x: Math.round((parent.width - width) / 2)
                y: -height
                width: 290
                height: 175
                modal: true
                visible: false

                Behavior on x
                {
                    NumberAnimation
                    {
                        duration: 300
                        easing.type: Easing.InOutQuad // Тип сглаживания
                    }
                }

                onOpened:
                {
                    y = Math.round((parent.height - height) / 2)
                }

                onClosed:
                {
                    y = -height
                }

                Item
                {
                    anchors.centerIn: parent
                    width: 300
                    height: 185

                    Rectangle
                    {
                        id: _signUpLectionPopupRect
                        anchors.fill: parent
                        color: "#E0B267"
                        visible: true
                        radius: 20

                        CanvasTwo
                        {
                            id: _signUpLectionPopupText
                            p_width: 275
                            p_height: 80
                            p_topMargin: 20

                            p_text1: "Вы успешно"
                            p_text2: "записались на лекцию"
                            p_colorStroke: "White"
                            p_colorText: "#Black"
                            p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                            p_lineWidth: 2
                            p_textHeight: 19
                            p_canvasTwo_visiable: true
                        }
                        Rectangle
                        {
                            id: _signUpLectionPopupCloseBut
                            width: 106
                            height: 35
                            radius: 15
                            color: "#D9D9D9"
                            opacity: 0.9
                            border.color: "black"
                            border.width: 1
                            anchors.top: _signUpLectionPopupText.bottom
                            anchors.topMargin: 30
                            anchors.horizontalCenter: parent.horizontalCenter

                            Text
                            {

                                text: "Назад"
                                color: "Black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 16

                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                wrapMode: Text.WordWrap
                            }
                            MouseArea
                            {
                                anchors.fill: parent
                                onClicked:
                                {
                                _signUpLectionPopup.close()
                                }
                            }
                        }
                    }
                }
            }
            Popup
            {
                id: _signedUpLectionPopup
                parent: Overlay.overlay
                x: Math.round((parent.width - width) / 2)
                y: -height
                width: 290
                height: 175
                modal: true
                visible: false

                Behavior on x
                {
                    NumberAnimation
                    {
                        duration: 300
                        easing.type: Easing.InOutQuad // Тип сглаживания
                    }
                }

                onOpened:
                {
                    y = Math.round((parent.height - height) / 2)
                }

                onClosed:
                {
                    y = -height
                }

                Item
                {
                    anchors.centerIn: parent
                    width: 300
                    height: 185

                    Rectangle
                    {
                        id: _signedUpLectionPopupRect
                        anchors.fill: parent
                        color: "#E0B267"
                        visible: true
                        radius: 20

                        CanvasTwo
                        {
                            id: _signedUpLectionPopupText
                            p_width: 275
                            p_height: 80
                            p_topMargin: 20

                            p_text1: "Вы уже"
                            p_text2: "записались на лекцию"
                            p_colorStroke: "White"
                            p_colorText: "#Black"
                            p_font: "bold italic 20px '" + montserratBoldItalic + "'"
                            p_lineWidth: 2
                            p_textHeight: 19
                            p_canvasTwo_visiable: true
                        }
                        Rectangle
                        {
                            id: _signedUpLectionPopupCloseBut
                            width: 106
                            height: 35
                            radius: 15
                            color: "#D9D9D9"
                            opacity: 0.9
                            border.color: "black"
                            border.width: 1
                            anchors.top: _signedUpLectionPopupText.bottom
                            anchors.topMargin: 30
                            anchors.horizontalCenter: parent.horizontalCenter

                            Text
                            {

                                text: "Назад"
                                color: "Black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 16

                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                wrapMode: Text.WordWrap
                            }
                            MouseArea
                            {
                                anchors.fill: parent
                                onClicked:
                                {
                                _signedUpLectionPopup.close()
                                }
                            }
                        }
                    }
                }
            }
        }
    }


//Квесты преподавателя
    Component{
        id: _questsTeacher_Com
        Quests {
            id: _quests

            Menu_Bar_Teacher {

            }

            Item {
                id: _item_quests
                width: 359
                height: 272
                anchors.centerIn: parent

                Rectangle {
                    id: _quests_scenario
                    anchors.top: _item_quests.top
                    width: 355
                    height: 112
                    radius: 25
                    color: "transparent"
                    border.color: "black"
                    border.width: 1
                    Rectangle
                    {
                        anchors.fill: parent
                        radius: 25
                        opacity: 0.9
                        width: parent.width
                        height: parent.height
                        color: "#D9D9D9"
                        border.color: "black"
                        border.width: 1
                    }
                    CanvasOne {
                        id: _scenario
                        p_width: 180
                        p_height: 20
                        p_text1: "Сценарий"
                        p_colorStroke: "#716EE4"
                        p_colorText: "#Black"
                        p_font: "bold italic 28px '" + montserratBoldItalic + "'"
                        p_lineWidth: 2
                        p_textHeight: 14
                        p_canvasOne_visiable: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        layer.enabled: true
                        layer.effect: DropShadow {
                            verticalOffset: 5
                            color: "#463C3C"
                            radius: 10
                            samples: 25
                            spread: 0
                        }
                    }
                    Image {
                        id: _button_scenario_image
                        source: "qrc:/svg/Quests_scenario.svg"
                        width: 67
                        height: 67
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.verticalCenter: parent.verticalCenter
                        visible: true
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            _client.slotConnecting()
                            _client.getChapterStagesSteps(currentChapter, currentTail)
                            for (let i = 0; i < _client.allStagesStepsArr.length; i += 2)
                            {
                                _listModelStageSteps.append({"l_nameStage" : _client.allStagesStepsArr[i],
                                "l_nameSteps1" : _client.allStagesStepsArr[i + 1][0],
                                "l_nameSteps2" : _client.allStagesStepsArr[i + 1][1],
                                "l_nameSteps3" : _client.allStagesStepsArr[i + 1][2],
                                "l_countSteps" : _client.allStagesStepsArr[i + 1].length})
                                console.log(_client.allStagesStepsArr[i + 1].length)
                            }
                            _stack.push(_stagesTeacher_com)
                            _client.slotDisconnecting()
                        }
                    }
                }

                Rectangle
                {
                    id: _castSpell_rect
                    anchors
                    {
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                        topMargin: 450
                    }
                    width:  _quests_adventures.width
                    height: 67
                    color: "transparent"
                    radius: 20
                    Rectangle
                    {
                        anchors.fill: parent
                        radius: 20
                        width: parent.width
                        height: parent.height
                        opacity: 0.9
                        color: "#D9D9D9"
                        border.color: "black"
                        border.width: 1
                    }
                    CanvasOne
                    {
                        p_width: 355
                        p_height: 50
                        anchors.centerIn: parent

                        p_text1: "Наложить чары"
                        p_colorStroke: "#280079"
                        p_colorText: "white"
                        p_font: "bold italic 22px '" + montserratBoldItalic + "'"
                        p_lineWidth: 6
                        p_textHeight: 12
                        p_canvasOne_visiable: true
                        layer.enabled: true
                        layer.effect: DropShadow {
                            verticalOffset: 5
                            color: "#463C3C"
                            radius: 10
                            samples: 25
                            spread: 0
                        }
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            _client.slotConnecting()
                            _client.getSquadsInTail()
                            for (let i = 0; i < _client.allSquadsArr.length; i++)
                            {
                                _listModelSquads.append({"l_nameSquad" : _client.allSquadsArr[i]})
                            }
                            onClicked: _popup_castSpell.open()

                            _client.slotDisconnecting()
                        }
                    }
                }

                Rectangle {
                    id: _quests_adventures
                    anchors.top:  _quests_scenario.bottom
                    anchors.topMargin: 20
                    width: 355
                    height: 112
                    radius: 25
                    color: "transparent"
                    border.width: 1
                    Rectangle
                    {
                        anchors.fill: parent
                        radius: 25
                        opacity: 0.9
                        width: parent.width
                        height: parent.height
                        color: "#D9D9D9"
                        border.color: "black"
                        border.width: 1
                    }
                    CanvasOne {
                        id: _adventures
                        p_width: 220
                        p_height: 20
                        p_text1: "Путешествия"
                        p_colorStroke: "#716EE4"
                        p_colorText: "#Black"
                        p_font: "bold italic 28px '" + montserratBoldItalic + "'"
                        p_lineWidth: 2
                        p_textHeight: 14
                        p_canvasOne_visiable: true
                        anchors.left: _button_adventures_image.right
                        anchors.leftMargin: 10
                        anchors.horizontalCenter: undefined
                        anchors.verticalCenter: parent.verticalCenter
                        layer.enabled: true
                        layer.effect: DropShadow {
                            verticalOffset: 5
                            color: "#463C3C"
                            radius: 10
                            samples: 25
                            spread: 0
                        }
                    }

                    Image {
                        id: _button_adventures_image
                        source: "qrc:/svg/Quests_adventures.svg"
                        width: 67
                        height: 67
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.verticalCenter: parent.verticalCenter
                        visible: true
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            _stack.push(_adventuresCom)
                        }
                    }
                }
            }


            Popup
            {
                id: _popup_castSpell
                parent: Overlay.overlay
                x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
                y: -height // Начальная позиция выше экрана
                width: 255
                height: 295
                modal: true
                closePolicy: Popup.NoAutoClose
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


                Item
                {
                    anchors.centerIn: parent
                    width: 270
                    height: 310

                    Rectangle
                    {
                        id: _fon_rec_castSpell
                        anchors.fill: parent
                        color: "#AD9595"
                        //opacity: 0.5
                        visible: true
                        radius: 30
                        border.color: "black"
                        border.width: 1

                        CanvasOne
                        {
                            p_width: 220
                            p_height: 70

                            anchors.top: parent.top

                            p_text1: "Выберите пати"
                            p_colorStroke: "#E6D1D1"
                            p_colorText: "#33363F"
                            p_font: "bold italic 24px '" + montserratBoldItalic + "'"
                            p_lineWidth: 4
                            p_textHeight: 26
                            p_canvasOne_visiable: true
                            layer.enabled: true
                            layer.effect: DropShadow {
                                verticalOffset: 5
                                color: "#535353"
                                radius: 5
                                samples: 12
                                spread: 0
                            }
                        }
                        Column
                        {
                            id: _cloumnCastSpell_rect
                            anchors
                            {
                                top: parent.top
                                horizontalCenter: parent.horizontalCenter
                                topMargin: 60
                            }
                            spacing: 5
                            Repeater
                            {
                                model: _listModelSquads
                                anchors.fill: parent
                                delegate: Rectangle
                                {
                                    id: _squadCastSpell_rect
                                    width: 180
                                    height: 40
                                    color: "transparent"
                                    radius: 15
                                    border.width: 1
                                    border.color: "black"

                                    Rectangle
                                    {
                                        anchors.fill: parent
                                        radius: 15
                                        opacity: 1
                                        color: "#D9D9D9"
                                        border.width: 1
                                        border.color: "black"
                                    }
                                    Text
                                    {
                                        id: _squadCastSpell_text
                                        anchors
                                        {
                                            centerIn: _squadCastSpell_rect
                                        }
                                        text: l_nameSquad
                                        color: "#85878B"
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 12
                                        font.family: montserratBoldItalic
                                        visible: true
                                    }
                                }
                            }
                        }
                        Rectangle
                        {
                            width: 98
                            height: 39

                            anchors.right: parent.right
                            anchors.rightMargin: 83

                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 15

                            color: "#D9D9D9"
                            radius: 10

                            Text
                            {

                                text: "Отмена"
                                color: "Black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 16

                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                wrapMode: Text.WordWrap
                                layer.enabled: true
                                layer.effect: DropShadow {
                                    verticalOffset: 5
                                    color: "#535353"
                                    radius: 12
                                    samples: 8
                                    spread: 0
                                }
                            }
                            MouseArea
                            {
                                anchors.fill: parent
                                onClicked:
                                {
                                    _popup_castSpell.close()
                                    _listModelSquads.clear()

                                }
                            }
                        }
                    }
                }
            }
        }
    }


//Путешествия
    Component {
        id: _adventuresCom
        Adventures {
            id: _adventures
        }
    }


// Список присутствующих
    Component
    {
        id: _list_of_sessions_com
        List_of_sessions
        {
            id: _list_of_sessions
        }
    }


//Рейтинг группы на 1-3 месте
    Component
    {
        id: _list_group_com
        List_group
        {
            id: _list_group

            Close_Button
            {
                id: _closeButt
                p_bottomMargin: 72
                p_color_rect: "#D9D9D9"
                p_opacity: 0.9
                p_root_title: "Рейтинг групп"
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
                    ctx.strokeStyle = "2D292D";

                    ctx.fillStyle = "#FFFFFF";
                    ctx.strokeText(currentGroupForRaitingPlayer, x, y );
                    ctx.fillText(currentGroupForRaitingPlayer, x, y);
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
                id: _rectForListViewGroup
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 172
                anchors.bottom: _closeButt.top
                anchors.bottomMargin: 30
                width: 355
                height: 585
                color: "transparent"

                ListView
                {
                    id: _listViewGroup
                    anchors.fill: parent
                    model: _client.playerRatingArr.length
                    spacing: 26
                    clip: true
                    delegate: Rectangle
                    {
                        id: _backgroundName
                        width: 311
                        height: 65
                        radius: 20

                        anchors
                        {
                            left: parent.left
                            leftMargin: 22
                        }
                        border.color: "black"
                        border.width: 2
                        gradient: Gradient
                        {
                            GradientStop { position: 0.06; color: "#EDE06B" }
                            GradientStop { position: 0.54; color: "#7B2A88" }
                        }

                        Rectangle
                        {
                            anchors.fill: parent
                            color: "transparent"
                            radius: parent.radius
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

                                ctx.fillStyle = "#FFFFFF";
                                ctx.strokeText(_client.playerRatingArr[index][0], x, y );
                                ctx.fillText(_client.playerRatingArr[index][0], x, y);
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
                        Canvas
                        {
                            id: _pointNumberPerson
                            width: 350
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
                                ctx.clearRect(0, 0, _pointNumberPerson.width, _pointNumberPerson.height);

                                // Настройка шрифта
                                ctx.font = "bold italic 22px '" + montserratBlackItalic + "'";
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";

                                var x = 280;
                                var y = 32;

                                ctx.lineJoin = "round";
                                ctx.miterLimit = 65;

                                // Рисуем границу
                                var textHeight = 12;
                                ctx.lineWidth = 6;
                                ctx.strokeStyle = "black";

                                ctx.fillStyle = "#90F87F";
                                ctx.strokeText(_client.playerRatingArr[index][1], x, y );
                                ctx.fillText(_client.playerRatingArr[index][1], x, y);
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
                    }
                }
            }
        }
    }


//Рейтинг группы на 4 месте
    Component
    {
        id: _list_group_looser_com
        List_group_looser
        {
            id: _list_group_looser

            Close_Button
            {
                id: _closeBut
                p_bottomMargin: 72
                p_color_rect: "#D9D9D9"
                p_opacity: 0.9
                p_root_title: "Рейтинг групп"
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
                    ctx.strokeStyle = "#564C55";

                    ctx.fillStyle = "#FFFFFF";
                    ctx.strokeText(currentGroupForRaitingPlayer, x, y );
                    ctx.fillText(currentGroupForRaitingPlayer, x, y);
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
                anchors.topMargin: 172
                anchors.bottom: _closeBut.top
                anchors.bottomMargin: 30
                width: 355
                height: 585
                color: "transparent"

                ListView
                {
                    id: _listViewGroup
                    anchors.fill: parent
                    model: _client.playerRatingArr.length
                    spacing: 26
                    clip: true
                    delegate: Rectangle
                    {
                        id: _backgroundName
                        width: 311
                        height: 65
                        radius: 20

                        anchors
                        {
                            left: parent.left
                            leftMargin: 22
                        }
                        border.color: "black"
                        border.width: 2
                        gradient: Gradient
                        {
                            GradientStop { position: 0.01; color: "#F99B30" }
                            GradientStop { position: 0.47; color: "#E53B32" }
                            GradientStop { position: 1.0; color: "#F99B30" }
                        }

                        Rectangle
                        {
                            anchors.fill: parent
                            color: "transparent"
                            radius: parent.radius
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

                                ctx.fillStyle = "#FFFFFF";
                                ctx.strokeText(_client.playerRatingArr[index][0], x, y );
                                ctx.fillText(_client.playerRatingArr[index][0], x, y);
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

                                ctx.fillStyle = "#3BE3D2";
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
                        Canvas
                        {
                            id: _pointNumberPerson
                            width: 350
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
                                ctx.clearRect(0, 0, _pointNumberPerson.width, _pointNumberPerson.height);

                                // Настройка шрифта
                                ctx.font = "bold italic 22px '" + montserratBlackItalic + "'";
                                ctx.textAlign = "center";
                                ctx.textBaseline = "middle";

                                var x = 280;
                                var y = 32;

                                ctx.lineJoin = "round";
                                ctx.miterLimit = 65;

                                // Рисуем границу
                                var textHeight = 12;
                                ctx.lineWidth = 6;
                                ctx.strokeStyle = "black";

                                ctx.fillStyle = "#90F87F";
                                ctx.strokeText(_client.playerRatingArr[index][1], x, y );
                                ctx.fillText(_client.playerRatingArr[index][1], x, y);
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
                    }
                }
            }
        }
    }


//Этпаы у студента
    Component
    {
        id: _stages_com
        Stages
        {
            id: _stage
            ListView
            {
                id: _listViewStage
                width: 350
                height: 700
                clip: true
                model: _listModelStageSteps
                orientation: Qt.Horizontal
                spacing: 50
                anchors.centerIn: parent

                delegate: Item {
                    id: _itemStage
                    width: 350
                    height: 700
                    Canvas
                    {
                        id: _stageNumber
                        width: 200
                        height: 50
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        // anchors.topMargin: 56
                        onPaint:
                        {
                            var ctx = getContext("2d");
                            ctx.clearRect(0, 0, _stageNumber.width, _stageNumber.height);

                            // Настройка шрифта
                            ctx.font = "bold italic 34px '" + montserratBoldItalic + "'";
                            ctx.textAlign = "center";
                            ctx.textBaseline = "middle";

                            var x = _stageNumber.width / 2;
                            var y = _stageNumber.height / 2;

                            ctx.lineJoin = "round";
                            ctx.miterLimit = 65;

                            // Рисуем границу
                            var textHeight = 8;
                            ctx.lineWidth = 6;
                            ctx.strokeStyle = "#FFFFFF";

                            ctx.fillStyle ="#000000";
                            ctx.strokeText("Этап " + (index + 1), x, y );
                            ctx.fillText("Этап " + (index + 1), x, y);
                        }
                    }
                    Rectangle
                    {
                        id: _stageName_rect
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

                        Text
                        {
                            id: _stageName_text
                            anchors
                            {
                                top: parent.top
                                left: parent.left
                                topMargin: 8
                                leftMargin: 88
                            }

                            text: l_nameStage
                            color: "#000000"
                            font.bold: true
                            font.italic: true
                            font.pointSize: 30
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

                        Rectangle
                        {
                            anchors
                            {
                                right: parent.right
                            }

                            width: 70
                            height: 70
                            radius: 20
                            color: { if (_client.allPointsStage < 0) {return "#E72727"}
                            else {return "#66E782"}}


                            Text
                            {
                                id: _pointOfStage
                                anchors.centerIn: parent

                                text: l_pointStage
                                color: "#000000"
                                font.bold: true
                                font.italic: true
                                font.pointSize: 24
                                font.family: montserratBoldItalic
                            }
                        }
                    }
                    Column
                    {
                        id: _cloumn_rect
                        anchors
                        {
                            top: parent.top
                            horizontalCenter: parent.horizontalCenter
                            topMargin: 250
                        }
                        spacing: 19
                        Repeater
                        {
                            model: l_countSteps
                            anchors.fill: parent
                            delegate: Rectangle
                            {
                                id: _stage_rect
                                width: 320
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
                                    id: _stage_text1
                                    anchors
                                    {
                                        centerIn: _stage_rect
                                    }
                                    text: { if(index === 0){ return l_nameSteps1 }
                                    else if(index === 1){ return l_nameSteps2 }
                                    else {return l_nameSteps3}}
                                    color: "#000000"
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 18
                                    font.family: montserratBoldItalic
                                    visible: true
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
                    }
                    Rectangle
                    {
                        id: _stageUse_rect
                        anchors
                        {
                            top: _cloumn_rect.bottom
                            horizontalCenter: parent.horizontalCenter
                            topMargin: 19
                        }
                        width: 320
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
                            id: _stageUse_text1
                            anchors
                            {
                                top: parent.top
                                left: parent.left
                                topMargin: 10
                                leftMargin: 23
                                horizontalCenter: parent.horizontalCenter
                            }

                            text: "Применить навык класса"
                            color: "#000000"
                            font.bold: true
                            font.italic: true
                            font.pointSize: 14
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
                            id: _stageUse_text2
                            anchors
                            {
                                top: _stageUse_text1.bottom
                                left: parent.left
                                leftMargin: 98
                            }

                            text: "или амулет"
                            color: "#000000"
                            font.bold: true
                            font.italic: true
                            font.pointSize: 14
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
                        MouseArea
                        {
                            anchors.fill: parent
                            enabled: true
                            onClicked:
                            {
                                onClicked: _popup_amunition.open()
                            }
                        }
                        Popup
                        {
                            id: _popup_amunition
                            parent: Overlay.overlay
                            x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
                            y: -height // Начальная позиция выше экрана
                            width: 355
                            height: 249
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
                                width: 370
                                height: 264
                                radius: 25
                                color: "#A03F2B"
                                opacity: 1
                                border.color: "black"
                                border.width: 1

                                Rectangle
                                {
                                    anchors.top: parent.top
                                    anchors.topMargin: 20
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    width: 308
                                    height: 56
                                    radius: 20
                                    color: "#D0D0D0"
                                    opacity: 1
                                    border.color: "black"
                                    border.width: 1

                                    Text
                                    {
                                        text: "Применить навык класса"
                                        color: "Black"
                                        font.family: montserratBoldItalic
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 12
                                        style: Text.Outline
                                        styleColor: "white"
                                        anchors.centerIn: parent
                                        wrapMode: Text.WordWrap
                                    }

                                    MouseArea
                                    {
                                        anchors.fill: parent
                                        onClicked:
                                        {
                                            _popup_skill_accept.open()
                                        }
                                    }
                                }
                                Rectangle
                                {
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 30
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    width: 308
                                    height: 134
                                    radius: 15
                                    color: "#D0D0D0"
                                    opacity: 1
                                    border.color: "black"
                                    border.width: 1

                                    Text
                                    {
                                        text: "Выберите амулет"
                                        color: "Black"
                                        font.family: montserratBoldItalic
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 12
                                        style: Text.Outline
                                        styleColor: "white"
                                        anchors.top: parent.top
                                        anchors.topMargin: 5
                                        anchors.horizontalCenter: parent.horizontalCenter

                                    }
                                    Item
                                    {
                                        width: 284
                                        height: 72
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 10
                                        anchors.horizontalCenter: parent.horizontalCenter

                                        Rectangle
                                        {
                                            anchors.left: parent.left
                                            width: 78
                                            height: 72
                                            radius: 15
                                            opacity: 1
                                            color: "#9C54DB"
                                            border.color: "black"
                                            border.width: 1
                                            Image
                                            {
                                                source: "qrc:/svg/Small_amulet.svg"
                                                width: 64
                                                height: 60
                                                visible: true
                                                anchors.centerIn: parent
                                            }
                                            MouseArea
                                            {
                                                anchors.fill: parent
                                                onClicked:
                                                {
                                                    _popup_small_amulet_accept.open()
                                                }
                                            }
                                        }
                                        Rectangle
                                        {
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            width: 78
                                            height: 72
                                            radius: 15
                                            opacity: 1
                                            color: "#9C54DB"
                                            border.color: "black"
                                            border.width: 1
                                            Image
                                            {
                                                source: "qrc:/svg/Average_amulet.svg"
                                                width: 53
                                                height: 60
                                                visible: true
                                                anchors.centerIn: parent
                                            }
                                            MouseArea
                                            {
                                                anchors.fill: parent
                                                onClicked:
                                                {
                                                    _popup_average_amulet_accept.open()
                                                }
                                            }
                                        }
                                        Rectangle
                                        {
                                            anchors.right: parent.right
                                            width: 78
                                            height: 72
                                            radius: 15
                                            opacity: 1
                                            color: "#9C54DB"
                                            border.color: "black"
                                            border.width: 1
                                            Image
                                            {
                                                source: "qrc:/svg/Large_amulet.svg"
                                                width: 64
                                                height: 60
                                                visible: true
                                                anchors.centerIn: parent
                                            }
                                            MouseArea
                                            {
                                                anchors.fill: parent
                                                onClicked:
                                                {
                                                    _popup_large_amulet_accept.open()
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Popup
                        {
                            id: _popup_skill_accept
                            parent: Overlay.overlay
                            x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
                            y: -height // Начальная позиция выше экрана
                            width: 274
                            height: 180
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
                                width: 284
                                height: 190
                                color: "#843F75"
                                opacity: 1
                                radius: 15
                                border.color: "black"
                                border.width: 1
                                Text
                                {
                                    id: _text_skill1
                                    text: "Если вы примените"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 14
                                    style: Text.Outline
                                    styleColor: "white"
                                    anchors.top: parent.top
                                    anchors.topMargin: 10
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                Text
                                {
                                    id: _text_skill2
                                    text: "навык класса, то у"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 14
                                    style: Text.Outline
                                    styleColor: "white"
                                    anchors.top:  _text_skill1.bottom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                Text
                                {
                                    id: _text_skill3
                                    text: "вас останется 0"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 14
                                    style: Text.Outline
                                    styleColor: "white"
                                    anchors.top:  _text_skill2.bottom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                Text
                                {
                                    id: _text_skill4
                                    text: "использований"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 14
                                    style: Text.Outline
                                    styleColor: "white"
                                    anchors.top:  _text_skill3.bottom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                Text
                                {
                                    id: _text_skill5
                                    text: "Применить?"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 14
                                    style: Text.Outline
                                    styleColor: "white"
                                    anchors.top:  _text_skill4.bottom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                Rectangle
                                {
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 10
                                    anchors.left: parent.left
                                    anchors.leftMargin: 20
                                    width: 90
                                    height: 34
                                    color: "white"
                                    opacity: 1
                                    radius: 15
                                    border.color: "black"
                                    border.width: 1
                                    Text
                                    {
                                        text: "Да"
                                        color: "Black"
                                        font.family: montserratBoldItalic
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 12
                                        style: Text.Outline
                                        styleColor: "white"
                                        anchors.centerIn: parent
                                    }
                                    MouseArea
                                    {
                                        anchors.fill: parent
                                        onClicked:
                                        {
                                            _popup_skill_accept.close()
                                            _popup_amunition.close()
                                        }
                                    }
                                }
                                Rectangle
                                {
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 10
                                    anchors.right: parent.right
                                    anchors.rightMargin: 20
                                    width: 90
                                    height: 34
                                    color: "white"
                                    opacity: 1
                                    radius: 15
                                    border.color: "black"
                                    border.width: 1
                                    Text
                                    {
                                        text: "Отмена"
                                        color: "Black"
                                        font.family: montserratBoldItalic
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 12
                                        style: Text.Outline
                                        styleColor: "white"
                                        anchors.centerIn: parent
                                    }
                                    MouseArea
                                    {
                                        anchors.fill: parent
                                        onClicked:
                                        {
                                            _popup_skill_accept.close()
                                            _popup_amunition.close()
                                        }
                                    }
                                }
                            }
                        }
                        Popup
                        {
                            id: _popup_small_amulet_accept
                            parent: Overlay.overlay
                            x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
                            y: -height // Начальная позиция выше экрана
                            width: 274
                            height: 180
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
                                width: 284
                                height: 190
                                color: "#843F75"
                                opacity: 1
                                radius: 15
                                border.color: "black"
                                border.width: 1
                                Text
                                {
                                    id: _text_small_amulet1
                                    text: "Если вы примените"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 14
                                    style: Text.Outline
                                    styleColor: "white"
                                    anchors.top: parent.top
                                    anchors.topMargin: 10
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                Text
                                {
                                    id: _text_small_amulet2
                                    text: "малый амулет, то у"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 14
                                    style: Text.Outline
                                    styleColor: "white"
                                    anchors.top: _text_small_amulet1.bottom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                Text
                                {
                                    id: _text_small_amulet3
                                    text: "вас останется 0"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 14
                                    style: Text.Outline
                                    styleColor: "white"
                                    anchors.top: _text_small_amulet2.bottom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                Text
                                {
                                    id: _text_small_amulet4
                                    text: "использований"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 14
                                    style: Text.Outline
                                    styleColor: "white"
                                    anchors.top: _text_small_amulet3.bottom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                Text
                                {
                                    id: _text_small_amulet5
                                    text: "Применить?"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 14
                                    style: Text.Outline
                                    styleColor: "white"
                                    anchors.top: _text_small_amulet4.bottom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                Rectangle
                                {
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 10
                                    anchors.left: parent.left
                                    anchors.leftMargin: 20
                                    width: 90
                                    height: 34
                                    color: "white"
                                    opacity: 1
                                    radius: 15
                                    border.color: "black"
                                    border.width: 1
                                    Text
                                    {
                                        text: "Да"
                                        color: "Black"
                                        font.family: montserratBoldItalic
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 12
                                        style: Text.Outline
                                        styleColor: "white"
                                        anchors.centerIn: parent
                                    }
                                    MouseArea
                                    {
                                        anchors.fill: parent
                                        onClicked:
                                        {
                                            _popup_small_amulet_accept.close()
                                            _popup_amunition.close()
                                        }
                                    }
                                }
                                Rectangle
                                {
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 10
                                    anchors.right: parent.right
                                    anchors.rightMargin: 20
                                    width: 90
                                    height: 34
                                    color: "white"
                                    opacity: 1
                                    radius: 15
                                    border.color: "black"
                                    border.width: 1
                                    Text
                                    {
                                        text: "Отмена"
                                        color: "Black"
                                        font.family: montserratBoldItalic
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 12
                                        style: Text.Outline
                                        styleColor: "white"
                                        anchors.centerIn: parent
                                    }
                                    MouseArea
                                    {
                                        anchors.fill: parent
                                        onClicked:
                                        {
                                            _popup_small_amulet_accept.close()
                                            _popup_amunition.close()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Popup
                    {
                        id: _popup_average_amulet_accept
                        parent: Overlay.overlay
                        x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
                        y: -height // Начальная позиция выше экрана
                        width: 274
                        height: 180
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
                            width: 284
                            height: 190
                            color: "#843F75"
                            opacity: 1
                            radius: 15
                            border.color: "black"
                            border.width: 1
                            Text
                            {
                                id: _text_averge_amulet1
                                text: "Если вы примените"
                                color: "Black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 14
                                style: Text.Outline
                                styleColor: "white"
                                anchors.top: parent.top
                                anchors.topMargin: 10
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text
                            {
                                id: _text_averge_amulet2
                                text: "средний амулет, то у"
                                color: "Black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 14
                                style: Text.Outline
                                styleColor: "white"
                                anchors.top: _text_averge_amulet1.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text
                            {
                                id: _text_averge_amulet3
                                text: "вас останется 0"
                                color: "Black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 14
                                style: Text.Outline
                                styleColor: "white"
                                anchors.top: _text_averge_amulet2.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text
                            {
                                id: _text_averge_amulet4
                                text: "использований"
                                color: "Black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 14
                                style: Text.Outline
                                styleColor: "white"
                                anchors.top: _text_averge_amulet3.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text
                            {
                                id: _text_averge_amulet5
                                text: "Применить?"
                                color: "Black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 14
                                style: Text.Outline
                                styleColor: "white"
                                anchors.top: _text_averge_amulet4.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Rectangle
                            {
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 10
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                width: 90
                                height: 34
                                color: "white"
                                opacity: 1
                                radius: 15
                                border.color: "black"
                                border.width: 1
                                Text
                                {
                                    text: "Да"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 12
                                    style: Text.Outline
                                    styleColor: "white"
                                    anchors.centerIn: parent
                                }
                                MouseArea
                                {
                                    anchors.fill: parent
                                    onClicked:
                                    {
                                        _popup_average_amulet_accept.close()
                                        _popup_amunition.close()
                                    }
                                }
                            }
                            Rectangle
                            {
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 10
                                anchors.right: parent.right
                                anchors.rightMargin: 20
                                width: 90
                                height: 34
                                color: "white"
                                opacity: 1
                                radius: 15
                                border.color: "black"
                                border.width: 1
                                Text
                                {
                                    text: "Отмена"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 12
                                    style: Text.Outline
                                    styleColor: "white"
                                    anchors.centerIn: parent
                                }
                                MouseArea
                                {
                                    anchors.fill: parent
                                    onClicked:
                                    {
                                        _popup_average_amulet_accept.close()
                                        _popup_amunition.close()
                                    }
                                }
                            }
                        }
                    }
                    Popup
                    {
                        id: _popup_large_amulet_accept
                        parent: Overlay.overlay
                        x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
                        y: -height // Начальная позиция выше экрана
                        width: 274
                        height: 180
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
                            width: 284
                            height: 190
                            color: "#843F75"
                            opacity: 1
                            radius: 15
                            border.color: "black"
                            border.width: 1
                            Text
                            {
                                id: _text_large_amulet1
                                text: "Если вы примените"
                                color: "Black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 14
                                style: Text.Outline
                                styleColor: "white"
                                anchors.top: parent.top
                                anchors.topMargin: 10
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text
                            {
                                id: _text_large_amulet2
                                text: "большой амулет, то у"
                                color: "Black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 14
                                style: Text.Outline
                                styleColor: "white"
                                anchors.top: _text_large_amulet1.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text
                            {
                                id: _text_large_amulet3
                                text: "вас останется 0"
                                color: "Black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 14
                                style: Text.Outline
                                styleColor: "white"
                                anchors.top: _text_large_amulet2.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text
                            {
                                id: _text_large_amulet4
                                text: "использований"
                                color: "Black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 14
                                style: Text.Outline
                                styleColor: "white"
                                anchors.top: _text_large_amulet3.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text
                            {
                                id: _text_large_amulet5
                                text: "Применить?"
                                color: "Black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 14
                                style: Text.Outline
                                styleColor: "white"
                                anchors.top: _text_large_amulet4.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Rectangle
                            {
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 10
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                width: 90
                                height: 34
                                color: "white"
                                opacity: 1
                                radius: 15
                                border.color: "black"
                                border.width: 1
                                Text
                                {
                                    text: "Да"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 12
                                    style: Text.Outline
                                    styleColor: "white"
                                    anchors.centerIn: parent
                                }
                                MouseArea
                                {
                                    anchors.fill: parent
                                    onClicked:
                                    {
                                        _popup_large_amulet_accept.close()
                                        _popup_amunition.close()
                                    }
                                }
                            }
                            Rectangle
                            {
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 10
                                anchors.right: parent.right
                                anchors.rightMargin: 20
                                width: 90
                                height: 34
                                color: "white"
                                opacity: 1
                                radius: 15
                                border.color: "black"
                                border.width: 1
                                Text
                                {
                                    text: "Отмена"
                                    color: "Black"
                                    font.family: montserratBoldItalic
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 12
                                    style: Text.Outline
                                    styleColor: "white"
                                    anchors.centerIn: parent
                                }
                                MouseArea
                                {
                                    anchors.fill: parent
                                    onClicked:
                                    {
                                        _popup_large_amulet_accept.close()
                                        _popup_amunition.close()
                                    }
                                }
                            }
                        }
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
                    bottomMargin: 40
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
                            _listModelStageSteps.clear()
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
    }


// Этапы у перподавателя
    Component
    {
        id: _stagesTeacher_com
        Stages
        {
            id: _stage
            ListView
            {
                id: _listViewStage
                width: 350
                height: 700
                clip: true
                model: _listModelStageSteps
                orientation: Qt.Horizontal
                spacing: 50
                anchors.centerIn: parent

                delegate: Item
                {
                    id: _itemStage
                    width: 350
                    height: 700
                    Canvas
                    {
                        id: _stageNumber
                        width: 200
                        height: 50
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        // anchors.topMargin: 56
                        onPaint:
                        {
                            var ctx = getContext("2d");
                            ctx.clearRect(0, 0, _stageNumber.width, _stageNumber.height);

                            // Настройка шрифта
                            ctx.font = "bold italic 34px '" + montserratBoldItalic + "'";
                            ctx.textAlign = "center";
                            ctx.textBaseline = "middle";

                            var x = _stageNumber.width / 2;
                            var y = _stageNumber.height / 2;

                            ctx.lineJoin = "round";
                            ctx.miterLimit = 65;

                            // Рисуем границу
                            var textHeight = 8;
                            ctx.lineWidth = 6;
                            ctx.strokeStyle = "#FFFFFF";

                            ctx.fillStyle ="#000000";
                            ctx.strokeText("Этап " + (index + 1), x, y );
                            ctx.fillText("Этап " + (index + 1), x, y);
                        }
                    }
                    Rectangle
                    {
                        id: _stageName_rect
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

                        Text
                        {
                            id: _stageName_text
                            anchors
                            {
                                top: parent.top
                                left: parent.left
                                topMargin: 8
                                leftMargin: 88
                            }

                            text: l_nameStage
                            color: "#000000"
                            font.bold: true
                            font.italic: true
                            font.pointSize: 30
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
                    Column
                    {
                        id: _cloumn_rect
                        anchors
                        {
                            top: parent.top
                            horizontalCenter: parent.horizontalCenter
                            topMargin: 250
                        }
                        spacing: 19
                        Repeater
                        {
                            model: l_countSteps
                            anchors.fill: parent
                            delegate: Rectangle
                            {
                                id: _stage_rect
                                width: 320
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
                                    id: _stage_text1
                                    anchors
                                    {
                                        centerIn: _stage_rect
                                    }
                                    text: { if(index === 0){ return l_nameSteps1 }
                                    else if(index === 1){ return l_nameSteps2 }
                                    else {return l_nameSteps3}}
                                    color: "#000000"
                                    font.bold: true
                                    font.italic: true
                                    font.pointSize: 18
                                    font.family: montserratBoldItalic
                                    visible: true
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
                    }

                }
                Rectangle
                {
                    id: _checkLection_rect
                    anchors
                    {
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                        topMargin: 600
                    }
                    width:  320
                    height: 67
                    color: "transparent"
                    radius: 20
                    Rectangle
                    {
                        anchors.fill: parent
                        radius: 20
                        opacity: 0.9
                        width: parent.width
                        height: parent.height
                        color: "#D9D9D9"
                        border.color: "black"
                        border.width: 1
                    }
                    CanvasOne
                    {
                        p_width: 355
                        p_height: 50
                        anchors.centerIn: parent

                        p_text1: "Список присутствующих"
                        p_colorStroke: "#280079"
                        p_colorText: "white"
                        p_font: "bold italic 22px '" + montserratBoldItalic + "'"
                        p_lineWidth: 6
                        p_textHeight: 12
                        p_canvasOne_visiable: true
                        layer.enabled: true
                        layer.effect: DropShadow {
                            verticalOffset: 5
                            color: "#463C3C"
                            radius: 10
                            samples: 25
                            spread: 0
                        }
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            _client.slotConnecting()
                            _client.getSquadsInTail(currentTail)
                            // currentGroupForRaitingPlayer = _client.squadsRatingArr[5]
                            for (let i = 0; i < _client.tailSquadsArr.length; i++)
                            {
                                _listModelSquads.append({"l_nameSquad" : _client.tailSquadsArr[i]})
                            }
                             _popup_checkSessions.open()

                            _client.slotDisconnecting()
                        }
                    }
                }
            }
            Popup
            {
                id: _popup_checkSessions
                parent: Overlay.overlay
                x: Math.round((parent.width - width) / 2) // Привязка по центру по горизонтали
                y: -height // Начальная позиция выше экрана
                width: 255
                height: 295
                modal: true
                closePolicy: Popup.NoAutoClose
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


                Item
                {
                    anchors.centerIn: parent
                    width: 270
                    height: 310

                    Rectangle
                    {
                        id: _fon_rec_checkSessions
                        anchors.fill: parent
                        color: "#AD9595"
                        //opacity: 0.5
                        visible: true
                        radius: 30
                        border.color: "black"
                        border.width: 1

                        CanvasOne
                        {
                            p_width: 220
                            p_height: 70

                            anchors.top: parent.top

                            p_text1: "Выберите пати"
                            p_colorStroke: "#E6D1D1"
                            p_colorText: "#33363F"
                            p_font: "bold italic 24px '" + montserratBoldItalic + "'"
                            p_lineWidth: 4
                            p_textHeight: 26
                            p_canvasOne_visiable: true
                            layer.enabled: true
                            layer.effect: DropShadow {
                                verticalOffset: 5
                                color: "#535353"
                                radius: 5
                                samples: 12
                                spread: 0
                            }
                        }
                        Column
                        {
                            id: _cloumnCheckSessions_rect
                            anchors
                            {
                                top: parent.top
                                horizontalCenter: parent.horizontalCenter
                                topMargin: 60
                            }
                            spacing: 5
                            Repeater
                            {
                                model: _listModelSquads
                                anchors.fill: parent
                                delegate: Rectangle
                                {
                                    id: _squadCheckSessions_rect
                                    width: 180
                                    height: 40
                                    color: "transparent"
                                    radius: 15
                                    border.width: 1
                                    border.color: "black"

                                    Rectangle
                                    {
                                        anchors.fill: parent
                                        radius: 15
                                        opacity: 1
                                        color: "#D9D9D9"
                                        border.width: 1
                                        border.color: "black"
                                    }
                                    Text
                                    {
                                        id: _squadCheckSessions_text
                                        anchors
                                        {
                                            centerIn: _squadCheckSessions_rect
                                        }
                                        text: l_nameSquad
                                        color: "#85878B"
                                        font.bold: true
                                        font.italic: true
                                        font.pointSize: 12
                                        font.family: montserratBoldItalic
                                        visible: true
                                    }
                                    MouseArea
                                    {
                                        anchors.fill: parent
                                        onClicked:
                                        {
                                            _client.slotConnecting()
                                            currentSquad = l_nameSquad
                                            console.log(currentSquad)
                                            _client.getSquadApointed(currentTail,currentSquad)
                                            for(let i = 0; i <= (_client.squadCheckArr.length)/2; i += 2 )
                                            {
                                                _listModelForCheckSession.append({"l_nameStudent" : _client.squadCheckArr[i],
                                                                                  "l_check" : _client.squadCheckArr[i + 1]})
                                                console.log(_listModelForCheckSession.get(i/2).l_check)
                                                console.log(_listModelForCheckSession.get(i/2).l_nameStudent)
                                            }
                                            _stack.push(_list_of_sessions_com)
                                            _client.slotDisconnecting()
                                            _popup_checkSessions.close()
                                            _listModelSquads.clear()

                                        }
                                    }
                                }
                            }
                        }
                        Rectangle
                        {
                            width: 98
                            height: 39

                            anchors.right: parent.right
                            anchors.rightMargin: 83

                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 15

                            color: "#D9D9D9"
                            radius: 10

                            Text
                            {

                                text: "Отмена"
                                color: "Black"
                                font.family: montserratBoldItalic
                                font.bold: true
                                font.italic: true
                                font.pointSize: 16

                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                wrapMode: Text.WordWrap
                                layer.enabled: true
                                layer.effect: DropShadow {
                                    verticalOffset: 5
                                    color: "#535353"
                                    radius: 12
                                    samples: 8
                                    spread: 0
                                }
                            }
                            MouseArea
                            {
                                anchors.fill: parent
                                onClicked:
                                {
                                    _popup_checkSessions.close()
                                    _listModelSquads.clear()

                                }
                            }
                        }
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
                    bottomMargin: 40
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
                            _listModelStageSteps.clear()
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
    }


//Рейтинг групп преподавателя
    Component
    {
        id: _groupTeacherCom
        Group {
            id: _groupTeacher

            Menu_Bar_Teacher {

            }

            Rectangle
            {
                id: _commonFon
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 250

                width: 335
                height:511


                color: "#D9D9D9"
                opacity: 0.4
                radius: 20
            }

            CanvasOne
            {
                id: _listParty
                p_width: 295
                p_height: 50
                p_topMargin: 261

                p_text1: "Список пати"
                p_colorStroke: "black"
                p_colorText: "#E6C27B"
                p_font: "bold italic 40px '" + montserratBlackItalic + "'"
                p_lineWidth: 6
                p_textHeight: 18
                p_canvasOne_visiable: true
            }

            Rectangle
            {
                id: _firstPlace
                width: 300
                height: 63
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 340

                radius: 35
                color: "#F5F5F5"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 15
                    spread: 0
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _client.slotConnecting()
                        _client.getPlayerRating(1)
                        _client.slotDisconnecting()
                        _stack.push(_list_group_com)
                        currentGroupForRaitingPlayer = _client.squadsRatingArr[1]
                    }
                }
            }

            Rectangle
            {
                width: 63
                height: 63
                anchors.top: parent.top
                anchors.topMargin: 340
                anchors.left: _firstPlace.left

                radius: 31.5
                color: "#FFD700"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 15
                    spread: 0
                }
                Text
                {
                    anchors.centerIn: parent

                    color: "#000000"
                    font.bold: false
                    font.italic: false
                    font.pointSize: 32
                    font.family: mrsSheppardsRegular
                    text: "1"
                }
            }
            CanvasOne
            {
                id: _nameGroup1
                p_width: 145
                p_height: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 350
                p_text1: _client.squadsRatingArr[1]
                p_colorStroke: "black"
                p_colorText: "#FFD700"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 6
                p_textHeight: 18
                p_canvasOne_visiable: true
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 25
                    spread: 0
                }
            }
            CanvasOne
            {
                p_width: 50
                p_height: 50
                anchors.horizontalCenter: undefined
                anchors.top: parent.top
                anchors.topMargin: 350
                anchors.left: _nameGroup1.right
                anchors.leftMargin: 15

                p_text1: _client.squadsRatingArr[0]
                p_colorStroke: "#FFD700"
                p_colorText: "black"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 6
                p_textHeight: 12
                p_canvasOne_visiable: true
            }

            Rectangle
            {
                id: _secondPlace
                width: 300
                height: 63
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 425

                radius: 35
                color: "#F5F5F5"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 15
                    spread: 0
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _client.slotConnecting()
                        _client.getPlayerRating(3)
                        _client.slotDisconnecting()
                        _stack.push(_list_group_com)
                        currentGroupForRaitingPlayer = _client.squadsRatingArr[3]
                    }
                }

            }
            Rectangle
            {
                width: 63
                height: 63
                anchors.top: parent.top
                anchors.topMargin: 425
                anchors.left: _secondPlace.left

                radius: 31.5
                color: "#C0C0C0"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 15
                    spread: 0
                }
                Text
                {
                    anchors.centerIn: parent

                    color: "#000000"
                    font.bold: false
                    font.italic: false
                    font.pointSize: 26
                    font.family: mrsSheppardsRegular
                    text: "2"
                }
            }
            CanvasOne
            {
                id: _nameGroup2
                p_width: 145
                p_height: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 435

                p_text1: _client.squadsRatingArr[3]
                p_colorStroke: "black"
                p_colorText: "#C0C0C0"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 6
                p_textHeight: 12
                p_canvasOne_visiable: true
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 25
                    spread: 0
                }
            }
            CanvasOne
            {
                p_width: 50
                p_height: 50
                anchors.horizontalCenter: undefined
                anchors.top: parent.top
                anchors.topMargin: 435
                anchors.left: _nameGroup2.right
                anchors.leftMargin: 15

                p_text1: _client.squadsRatingArr[2]
                p_colorStroke: "#C0C0C0"
                p_colorText: "black"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 6
                p_textHeight: 18
                p_canvasOne_visiable: true
            }

            Rectangle
            {
                id: _thirdPlace
                width: 300
                height: 63
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 510

                radius: 35
                color: "#F5F5F5"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 15
                    spread: 0
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _client.slotConnecting()
                        _client.getPlayerRating(5)
                        _client.slotDisconnecting()
                        _stack.push(_list_group_com)
                        currentGroupForRaitingPlayer = _client.squadsRatingArr[5]
                    }
                }

            }
            Rectangle
            {
                width: 63
                height: 63
                anchors.top: parent.top
                anchors.topMargin: 510
                anchors.left: _thirdPlace.left

                radius: 31.5
                color: "#CD7F32"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 15
                    spread: 0
                }
                Text
                {
                    anchors.centerIn: parent

                    color: "#000000"
                    font.bold: false
                    font.italic: false
                    font.pointSize: 26
                    font.family: mrsSheppardsRegular
                    text: "3"
                }
            }
            CanvasOne
            {
                id: _nameGroup3
                p_width: 145
                p_height: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 520

                p_text1: _client.squadsRatingArr[5]
                p_colorStroke: "black"
                p_colorText: "#CD7F32"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 6
                p_textHeight: 12
                p_canvasOne_visiable: true
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 25
                    spread: 0
                }
            }
            CanvasOne
            {
                p_width: 50
                p_height: 50
                anchors.horizontalCenter: undefined
                anchors.top: parent.top
                anchors.topMargin: 520
                anchors.left: _nameGroup3.right
                anchors.leftMargin: 15

                p_text1: _client.squadsRatingArr[4]
                p_colorStroke: "#CD7F32"
                p_colorText: "black"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 6
                p_textHeight: 18
                p_canvasOne_visiable: true
            }

            Rectangle
            {
                id: _fourthPlace
                width: 300
                height: 63
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 595

                radius: 35
                color: "#33363F"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#606060"
                    radius: 10
                    samples: 25
                    spread: 0
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _client.slotConnecting()
                        _client.getPlayerRating(7)
                        _client.slotDisconnecting()
                        _stack.push(_list_group_looser_com)
                        currentGroupForRaitingPlayer = _client.squadsRatingArr[7]
                    }
                }
            }

            Rectangle
            {
                width: 63
                height: 63
                anchors.top: parent.top
                anchors.topMargin: 595
                anchors.left: _fourthPlace.left

                radius: 31.5
                color: "#43464F"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#252525"
                    radius: 10
                    samples: 25
                    spread: 0
                }
                Text
                {
                    anchors.centerIn: parent

                    color: "white"
                    font.bold: false
                    font.italic: false
                    font.pointSize: 24
                    font.family: mrsSheppardsRegular
                    text: "4"
                }
            }
            CanvasOne
            {
                id: _nameGroup4
                p_width: 145
                p_height: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 605

                p_text1: _client.squadsRatingArr[7]
                p_colorStroke: "transparent"
                p_colorText: "white"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 0
                p_textHeight: 0
                p_canvasOne_visiable: true
            }
            CanvasOne
            {
                p_width: 50
                p_height: 50
                anchors.horizontalCenter: undefined
                anchors.top: parent.top
                anchors.topMargin: 605
                anchors.left: _nameGroup4.right
                anchors.leftMargin: 15

                p_text1: _client.squadsRatingArr[6]
                p_colorStroke: "transparent"
                p_colorText: "white"
                p_font: "bold italic 30px '" + montserratBlackItalic + "'"
                p_lineWidth: 0
                p_textHeight: 0
                p_canvasOne_visiable: true
            }
            Rectangle
            {
                id: _allRating
                width: 300
                height: 63
                anchors.horizontalCenter: _commonFon.horizontalCenter
                anchors.bottom: _commonFon.bottom
                anchors.bottomMargin: 20

                radius: 35
                color: "#8C8C8C"
                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 5
                    color: "#726D6D"
                    radius: 10
                    samples: 15
                    spread: 0
                }

                CanvasOne
                {
                    p_width: 250
                    p_height: 55
                    anchors.centerIn: parent

                    p_text1: "Общий рейтинг"
                    p_colorStroke: "black"
                    p_colorText: "white"
                    p_font: "bold italic 24px '" + montserratBlackItalic + "'"
                    p_lineWidth: 2
                    p_textHeight: 18
                    p_canvasOne_visiable: true
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        _client.slotConnecting()
                        _client.getAllPlayersRating(currentTail)
                        _client.slotDisconnecting()
                        _stack.push(_list_group_rating_com)
                        for (let i = 0; i < _client.allPlayersRatingArr.length; i++) {
                           console.log(_client.allPlayersRatingArr[i])
                        }
                    }
                }
            }
        }
    }
}

