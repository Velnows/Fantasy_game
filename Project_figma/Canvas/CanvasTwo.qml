import QtQuick

Rectangle {

    property int p_width
    property int p_height
    property int p_topMargin

    property string p_text1
    property string p_text2
    property string p_font
    property string p_colorText
    property string p_colorStroke
    property int p_lineWidth
    property int p_textHeight
    property bool p_canvasTwo_visiable

    width: p_width
    height: p_height
    anchors {
        top: parent.top
        topMargin: p_topMargin
        horizontalCenter: parent.horizontalCenter
    }
    color: "transparent"

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

            ctx.lineJoin = "round"; // Используйте "round" или "bevel"
            ctx.miterLimit = 65; // Увеличьте значение радиуса

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
}
