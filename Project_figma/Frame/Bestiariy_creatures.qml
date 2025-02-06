import QtQuick
import QtQuick.Controls.Basic

Rectangle {
    color: "transparent"

    Image {
        id: _imageFon
        anchors.fill: parent
        source: "qrc:/images/Creatures_2.png"
        fillMode: Image.PreserveAspectCrop
    }
}
