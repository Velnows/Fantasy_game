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
}
