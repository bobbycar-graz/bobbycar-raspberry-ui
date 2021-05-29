import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

Container {
    id: leftTabBar

    currentIndex: 0

    Layout.fillWidth: false
    Layout.fillHeight: true

    ButtonGroup {
        buttons: columnLayout.children
    }

    contentItem: ColumnLayout {
        id: columnLayout
        spacing: 3

        Repeater {
            model: leftTabBar.contentModel
        }
    }

    FeatureButton {
        text: qsTr("Navigation")
        icon.name: "navigation"
        Layout.fillHeight: true
        property int myIndex: 0
        onClicked: leftTabBar.currentIndex = myIndex
        checked: leftTabBar.currentIndex == myIndex
    }

    FeatureButton {
        text: qsTr("Music")
        icon.name: "music"
        Layout.fillHeight: true
        property int myIndex: 1
        onClicked: leftTabBar.currentIndex = myIndex
        checked: leftTabBar.currentIndex == myIndex
    }

    FeatureButton {
        text: qsTr("Message")
        icon.name: "message"
        Layout.fillHeight: true
        property int myIndex: 2
        onClicked: leftTabBar.currentIndex = myIndex
        checked: leftTabBar.currentIndex == myIndex
    }

    FeatureButton {
        text: qsTr("Command")
        icon.name: "command"
        Layout.fillHeight: true
        property int myIndex: 3
        onClicked: leftTabBar.currentIndex = myIndex
        checked: leftTabBar.currentIndex == myIndex
    }

    FeatureButton {
        text: qsTr("Settings")
        icon.name: "settings"
        Layout.fillHeight: true
        property int myIndex: 4
        onClicked: leftTabBar.currentIndex = myIndex
        checked: leftTabBar.currentIndex == myIndex
    }
}
