import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Rectangle {

    property Item p_anchor_top
    property int p_anchor_topMargin

    property int p_width
    property int p_height
    property int p_radius
    property string p_colorRect
    property double p_opacity
    property string p_border_color
    property int p_border_width

    property string p_image_source
    property bool p_image_visiable

    property bool p_stack_pushing
    property Component p_stack_push
    property string p_root_title
    property bool p_enabled_mouseArea

    property string p_text1
    property string p_text2
    property string p_font
    property string p_colorText
    property string p_colorStroke
    property int p_lineWidth
    property int p_textHeight

    property bool p_canvasOne_visiable
    property bool p_canvasTwo_visiable

    anchors {
        horizontalCenter: parent.horizontalCenter
        top: p_anchor_top.top
        topMargin: p_anchor_topMargin
    }
    width: p_width
    height: p_height
    color: "transparent"


    Rectangle {
        id: _customButton
        anchors.fill: parent
        color: p_colorRect
        visible: false

        Image {
            anchors.centerIn: parent
            width: p_width
            height: p_height
            source: p_image_source
            visible: p_image_visiable
            fillMode: Image.PreserveAspectCrop
        }
    }

    OpacityMask {
        id: _customButtonMask
        anchors.fill: _customButton
        source: _customButton
        opacity: p_opacity
        maskSource: Rectangle {
            width: p_width
            height: p_height
            radius: p_radius
        }

        MouseArea {
            anchors.fill: parent
            enabled: p_enabled_mouseArea
            onClicked: {
                if(p_stack_pushing===true){
                    _stack.push(p_stack_push)

                    if(p_stack_push === _archiveCom)
                    {
                        _client.slotConnecting()
                        _client.getArchiveTails()
                        _client.slotDisconnecting()
                    }

                    // if(p_stack_push === _map_coursework_Com || p_stack_push === _map_laboratory_Com
                    //         || p_stack_push === _map_lection_Com || p_stack_push === _map_practice_Com
                    //         || p_stack_push === _greatBattleLockCom)
                    // {
                    //     _popup_quest.close()
                    // }

                }else{
                    _stack.pop()
                }
                _root.title = p_root_title
            }
        }
    }

    Rectangle {
        id: _borderForCustomButton
        anchors.centerIn: _customButton
        width: _customButton.width + 2
        height: _customButton.height + 2
        color: "transparent"
        border.color: p_border_color
        border.width: p_border_width
        radius: p_radius
    }

    Canvas {
            id: _canvasOne
            width: parent.width
            height: parent.height
            visible: p_canvasOne_visiable
            onPaint: {
                var ctx = _canvasOne.getContext('2d');
                ctx.clearRect(0, 0, _canvasOne.width, _canvasOne.height);

                // Настройка шрифта
                ctx.font = p_font; // Шрифт и размер
                ctx.textAlign = "center";
                ctx.textBaseline = "middle";

                // Вычисление позиций для текста
                var x = _canvasOne.width / 2;
                var y = _canvasOne.height / 2;

                // Рисуем границу
                var textHeight = p_textHeight; // Высота строки текста

                ctx.lineWidth = p_lineWidth; // Ширина контура
                ctx.strokeStyle = p_colorStroke; // Цвет контура

                // Рисуем текст
                ctx.fillStyle = p_colorText; // Цвет текста

                ctx.strokeText(p_text1, x, y ); // Контур
                ctx.fillText(p_text1, x, y);
            }
        }

    Canvas {
            id: _canvasTwo
            width: parent.width
            height: parent.height
            visible: p_canvasTwo_visiable
            onPaint: {
                var ctx = _canvasTwo.getContext('2d');
                ctx.clearRect(0, 0, _canvasTwo.width, _canvasTwo.height);

                // Настройка шрифта
                ctx.font = p_font; // Шрифт и размер
                ctx.textAlign = "center";
                ctx.textBaseline = "middle";

                // Вычисление позиций для текста
                var x = _canvasTwo.width / 2;
                var y = _canvasTwo.height / 2;

                // Рисуем границу
                var textHeight = p_textHeight; // Высота строки текста

                ctx.lineWidth = p_lineWidth; // Ширина контура
                ctx.strokeStyle = p_colorStroke; // Цвет контура

                // Рисуем текст
                ctx.fillStyle = p_colorText; // Цвет текста

                ctx.strokeText(p_text1, x, y - textHeight / 2); // Контур
                ctx.fillText(p_text1, x, y - textHeight / 2);

                ctx.strokeText(p_text2, x, y + textHeight / 2); // Контур
                ctx.fillText(p_text2, x, y + textHeight / 2);
            }
        }

    //         ctx.lineJoin = "round"; // Используйте "round" или "bevel"
    //         ctx.miterLimit = 65; // Увеличьте значение радиуса

}
