import QtQuick
import QtQuick.Controls.Basic

Rectangle
{
    anchors {
        horizontalCenter: parent.horizontalCenter
        top: parent.top
        topMargin: p_topMarginMenuBar
    }

    width: 367
    height: 70
    radius: 20
    visible: (p_User === "преподаватель") ? true : false
    color: "#D9D9D9"
    border.width: 1
    border.color: "black"

    Image {
        id: _back
        source: "qrc:/svg/Back.svg"
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 5
        }
        MouseArea
        {
            id: _mouseArea_MenuBar_Back
            anchors.fill: parent
            enabled: p_enabled_MouseArea_MenuBar_Back
            onClicked: {
                _stack.pop()

                p_sourceGroup = "qrc:/svg/Group_Off.svg"
                p_sourceQuests = "qrc:/svg/Quest_Off.svg"
                p_enabled_MouseArea_MenuBar_Group = true
                p_enabled_MouseArea_MenuBar_Quest = true
            }
        }
    }
    Image {
        id: _home
        source: "qrc:/svg/Home.svg"
        anchors {
            verticalCenter: parent.verticalCenter
            left: _back.right
            leftMargin: 30
        }
        MouseArea
        {
            id: _mouseArea_MenuBar_Home
            anchors.fill: parent
            enabled: true
            onClicked: {
                _stack.pop()
                _stack.push(_menuTeacherCom)

                p_sourceGroup = "qrc:/svg/Group_Off.svg"
                p_sourceQuests = "qrc:/svg/Quest_Off.svg"
                p_enabled_MouseArea_MenuBar_Group = true
                p_enabled_MouseArea_MenuBar_Quest = true
            }
        }
    }
    Image {
        id: _group
        source: p_sourceGroup
        anchors {
            verticalCenter: parent.verticalCenter
            right: _questTeacher.left
            rightMargin: 50
        }
        MouseArea
        {
            id: _mouseArea_MenuBar_Group
            anchors.fill: parent
            enabled: p_enabled_MouseArea_MenuBar_Group
            onClicked: {
                _stack.pop()
                _stack.push(_groupTeacherCom)

                p_sourceGroup = "qrc:/svg/Group_On.svg"
                p_sourceQuests = "qrc:/svg/Quest_Off.svg"
                p_enabled_MouseArea_MenuBar_Group = false
                p_enabled_MouseArea_MenuBar_Quest = true
            }
        }
    }

    Image {


        id: _questTeacher
        source: p_sourceQuests
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 5
        }
        MouseArea
        {
            id: _mouseArea_MenuBar_Quest
            anchors.fill: parent
            enabled: p_enabled_MouseArea_MenuBar_Quest

            onClicked: {
                _stack.pop()
                _stack.push(_questsTeacher_Com)

                p_sourceGroup = "qrc:/svg/Group_Off.svg"
                p_sourceQuests = "qrc:/svg/Quest_On.svg"
                p_enabled_MouseArea_MenuBar_Group = true
                p_enabled_MouseArea_MenuBar_Quest = false
            }
        }
    }
}

