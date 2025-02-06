import QtQuick
import QtQuick.Controls.Basic

Rectangle {

    color: "transparent"

    Image {
        id: _imageFon
        anchors.fill: parent
        source: "qrc:/images/Unusual_group_background.png"
        fillMode: Image.PreserveAspectCrop
    }
}
