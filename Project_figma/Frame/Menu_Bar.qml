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
    height: 71
    radius: 20
    visible: p_visibleMenuBar
    color: p_colorMenuBar
    border.width: p_borderWidthMenuBar
    border.color: p_borderColorMenuBar

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
                p_colorMenuBar = "#D9D9D9"
                p_borderWidthMenuBar = 0

                p_sourceBestiary = "qrc:/svg/Bestiariy.svg"
                p_sourceGroup = "qrc:/svg/Group_Off.svg"
                p_sourcePersonalCab = "qrc:/svg/Personal_cabinet.svg"
                p_sourceQuests = "qrc:/svg/Quest_Off.svg"
                p_colorMenuBar = "#D9D9D9"
                p_borderWidthMenuBar = 0

                p_enabled_MouseArea_MenuBar_Bestiary = true
                p_enabled_MouseArea_MenuBar_Group = true
                p_enabled_MouseArea_MenuBar_PersonalCab = false
                p_enabled_MouseArea_MenuBar_Quest = true
            }
        }
    }

    Image {
        id: _bestiary
        source: p_sourceBestiary
        anchors {
            verticalCenter: parent.verticalCenter
            left: _back.right
            leftMargin: 8
        }
        MouseArea
        {
            id: _mouseArea_MenuBar_Bestiary
            anchors.fill: parent
            enabled: p_enabled_MouseArea_MenuBar_Bestiary
            onClicked: {
                _client.slotConnecting()
                _client.getRaces()
                _client.slotDisconnecting()

                _stack.pop()
                _stack.push(_bestiariyCom)

                p_sourceBestiary = "qrc:/svg/Bestiariy_On.svg"
                p_sourceGroup = "qrc:/svg/Group_Off.svg"
                p_sourcePersonalCab = "qrc:/svg/Personal_cabinet_Off.svg"
                p_sourceQuests = "qrc:/svg/Quest_Off.svg"
                p_colorMenuBar = "#D9D9D9"
                p_borderWidthMenuBar = 0

                p_enabled_MouseArea_MenuBar_Bestiary = false
                p_enabled_MouseArea_MenuBar_Group = true
                p_enabled_MouseArea_MenuBar_PersonalCab = true
                p_enabled_MouseArea_MenuBar_Quest = true
            }
        }
    }

    Image {
        id: _quest
        source: p_sourceQuests
        anchors {
            verticalCenter: parent.verticalCenter
            left: _bestiary.right
            leftMargin: 17
        }
        MouseArea
        {
            id: _mouseArea_MenuBar_Quest
            anchors.fill: parent
            enabled: p_enabled_MouseArea_MenuBar_Quest
            onClicked: {
                _stack.pop()
                _stack.push(_quests_Com)

                p_sourceBestiary = "qrc:/svg/Bestiariy.svg"
                p_sourceGroup = "qrc:/svg/Group_Off.svg"
                p_sourcePersonalCab = "qrc:/svg/Personal_cabinet_Off.svg"
                p_sourceQuests = "qrc:/svg/Quest_On.svg"
                p_colorMenuBar = "#F3E1BE"
                p_borderWidthMenuBar = 2
                p_borderColorMenuBar = "#812F13"

                p_enabled_MouseArea_MenuBar_Bestiary = true
                p_enabled_MouseArea_MenuBar_Group = true
                p_enabled_MouseArea_MenuBar_PersonalCab = true
                p_enabled_MouseArea_MenuBar_Quest = false
            }
        }
    }

    Image {
        id: _group
        source: p_sourceGroup
        anchors {
            verticalCenter: parent.verticalCenter
            left: _quest.right
            leftMargin: 17
        }
        MouseArea
        {
            id: _mouseArea_MenuBar_Group
            anchors.fill: parent
            enabled: p_enabled_MouseArea_MenuBar_Group
            onClicked: {
                _stack.pop()
                _stack.push(_groupCom)

                p_sourceBestiary = "qrc:/svg/Bestiariy.svg"
                p_sourceGroup = "qrc:/svg/Group_On.svg"
                p_sourcePersonalCab = "qrc:/svg/Personal_cabinet_Off.svg"
                p_sourceQuests = "qrc:/svg/Quest_Off.svg"
                p_colorMenuBar = "#D9D9D9"
                p_borderWidthMenuBar = 0

                p_enabled_MouseArea_MenuBar_Bestiary = true
                p_enabled_MouseArea_MenuBar_Group = false
                p_enabled_MouseArea_MenuBar_PersonalCab = true
                p_enabled_MouseArea_MenuBar_Quest = true
            }
        }
    }

    Image {
        id: _personalCab
        source: p_sourcePersonalCab
        anchors {
            verticalCenter: parent.verticalCenter
            left: _group.right
            leftMargin: 17
        }
        MouseArea
        {
            id: _mouseArea_MenuBar_PersonalCab
            anchors.fill: parent
            enabled: p_enabled_MouseArea_MenuBar_PersonalCab
            onClicked: {
                _stack.pop()
                _stack.push(_cabinetCom)

                p_sourceBestiary = "qrc:/svg/Bestiariy.svg"
                p_sourceGroup = "qrc:/svg/Group_Off.svg"
                p_sourcePersonalCab = "qrc:/svg/Personal_cabinet.svg"
                p_sourceQuests = "qrc:/svg/Quest_Off.svg"
                p_colorMenuBar = "#D9D9D9"
                p_borderWidthMenuBar = 0

                p_enabled_MouseArea_MenuBar_Bestiary = true
                p_enabled_MouseArea_MenuBar_Group = true
                p_enabled_MouseArea_MenuBar_PersonalCab = false
                p_enabled_MouseArea_MenuBar_Quest = true
            }
        }
    }
}
