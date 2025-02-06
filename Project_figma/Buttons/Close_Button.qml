import QtQuick
import Qt5Compat.GraphicalEffects

Rectangle {

    property int p_bottomMargin
    property string p_color_rect
    property real p_opacity
    property string p_root_title

    width: 226
    height: 47
    radius: 20
    anchors {
        bottom: parent.bottom
        bottomMargin: p_bottomMargin
        horizontalCenter: parent.horizontalCenter
    }
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        radius: 20
        opacity: p_opacity
        border.color: "black"
        border.width: 1
        color: p_color_rect

        MouseArea {
            anchors.fill: parent
            onClicked: {
                _stack.pop()
                _root.title = p_root_title
            }
        }
    }

    Text {
        anchors.centerIn: parent
        text: "Назад"
        font.family: montserratBoldItalic
        font.bold: true
        font.italic: true
        font.pointSize: 22
        color: "black"
        layer.enabled: true
        layer.effect: DropShadow{
            verticalOffset: 2.5
            color: "#666"
            radius: 5
            samples: 11
            spread: 0
        }
    }
}
