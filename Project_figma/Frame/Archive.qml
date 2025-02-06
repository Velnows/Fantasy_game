import QtQuick
import QtQuick.Controls.Basic

Rectangle {

    color: "transparent"

    Image {
        id: _imageFon
        anchors.fill: parent
        source: "qrc:/images/Archive.png"
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        anchors {
            top: parent.top
            topMargin: 50
            bottom: parent.bottom
            bottomMargin: 169
        }
        anchors.horizontalCenter: parent.horizontalCenter
        width: 355
        height: 752
        color: "transparent"

        ListView {
            id: _listViewArchive
            anchors.fill: parent
            model: _client.archiveTailsArr.length
            spacing: 35
            clip: true
            delegate: Button {
                width: 355
                height: 86
                text: _client.archiveTailsArr[index]
                font.family: montserratBoldItalic
                font.bold: true
                font.italic: true
                font.pointSize: 24
                onClicked: {
                    currentTail = _client.archiveTailsArr[index]
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
