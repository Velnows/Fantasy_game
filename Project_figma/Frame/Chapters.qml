import QtQuick
import QtQuick.Controls.Basic

Rectangle {

    color: "transparent"

    Image {
        id: _imageFon
        anchors.fill: parent
        source: "qrc:/images/ChaptersFon.png"
        fillMode: Image.PreserveAspectCrop
    }
}
