import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

Container {
    id: rightTabBar

    currentIndex: 2

    Layout.fillHeight: true

    ButtonGroup {
        buttons: rightTabBarContentLayout.children
    }

    contentItem: ColumnLayout {
        id: rightTabBarContentLayout
        spacing: 3

        Repeater {
            model: rightTabBar.contentModel
        }
    }

    Item {
        Layout.fillHeight: true
    }

    FeatureButton {
        id: mapsButton
        text: qsTr("Maps")
        icon.name: "windows"

        Layout.fillHeight: true

        property int myIndex: 0
        onClicked: rightTabBar.currentIndex = myIndex
        checked: rightTabBar.currentIndex == myIndex
    }
    FeatureButton {
        text: qsTr("Windows")
        icon.name: "windows"

        Layout.fillHeight: true

        property int myIndex: 1
        onClicked: rightTabBar.currentIndex = myIndex
        checked: rightTabBar.currentIndex == myIndex
    }
    FeatureButton {
        text: qsTr("Air Con.")
        icon.name: "air-con"

        Layout.fillHeight: true

        property int myIndex: 2
        onClicked: rightTabBar.currentIndex = myIndex
        checked: rightTabBar.currentIndex == myIndex
    }
    FeatureButton {
        text: qsTr("Seats")
        icon.name: "seats"

        Layout.fillHeight: true

        property int myIndex: 3
        onClicked: rightTabBar.currentIndex = myIndex
        checked: rightTabBar.currentIndex == myIndex
    }
    FeatureButton {
        text: qsTr("Statistics")
        icon.name: "statistics"

        Layout.fillHeight: true

        property int myIndex: 4
        onClicked: rightTabBar.currentIndex = myIndex
        checked: rightTabBar.currentIndex == myIndex
    }
}
