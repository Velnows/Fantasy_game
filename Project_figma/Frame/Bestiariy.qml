import QtQuick
import QtQuick.Controls.Basic

Rectangle {

    color: "transparent"

    Image {
        id: _imageFon
        anchors.fill: parent
        source: "qrc:/images/Bestiariy_full.jpg"
        fillMode: Image.PreserveAspectCrop
    }

    Button {
        anchors {
            centerIn: parent
            verticalCenterOffset: 300
        }
        visible: (p_User === "преподаватель") ? true : false
        width: 150
        height: 65
        text: "Назад"
        font.pointSize: 26
        onClicked: {
            _stack.pop()
        }
    }
}
