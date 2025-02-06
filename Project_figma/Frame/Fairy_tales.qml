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
            bottomMargin: 188
        }
        anchors.horizontalCenter: parent.horizontalCenter
        width: 355
        height: 568
        color: "transparent"

        ListView {
            id: _listViewFairyTales
            anchors.fill: parent
            model: _client.currentTailsArr.length // Количество элементов в списке
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
                    _client.slotDisconnecting()
                    _stack.push(_chaptersCom)
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
