import QtQuick 2.9
import QtQml 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Imagine 2.3
import QtQuick.Window 2.0
import QtWebEngine 1.0
import "./leftPanes"
import "./rightPanes"
import "./inputdemo"

ApplicationWindow {
    id: window
    width: 800
    height: 480
    minimumWidth: 800
    minimumHeight: 480
    title: "Bobbycar"

    readonly property color colorGlow: "#1d6d64"
    readonly property color colorWarning: "#d5232f"
    readonly property color colorMain: "#6affcd"
    readonly property color colorBright: "#ffffff"
    readonly property color colorLightGrey: "#888"
    readonly property color colorDarkGrey: "#333"

    readonly property int fontSizeExtraSmall: Qt.application.font.pixelSize * 0.8
    readonly property int fontSizeMedium: Qt.application.font.pixelSize * 1.5
    readonly property int fontSizeLarge: Qt.application.font.pixelSize * 2
    readonly property int fontSizeExtraLarge: Qt.application.font.pixelSize * 5

    RowLayout {
        anchors.fill: parent
        anchors.margins: 0
        spacing: 10

        StackLayout {
            currentIndex: rightTabBar.currentIndex == 0 ? 1 : (rightTabBar.currentIndex == 1 ? 2 : 0)

            RowLayout {
                anchors.fill: parent
                anchors.margins: 0
                spacing: 10

                LeftButtonBar {
                    id: leftTabBar
                }

                StackLayout {
                    currentIndex: leftTabBar.currentIndex

                    Layout.preferredWidth: 200
                    //Layout.maximumWidth: 150
                    Layout.fillWidth: false

                    NavigationPane {
                    }

                    MusicPane {
                    }

                    MessagePane {
                    }

                    CommandPane {
                    }

                    SettingsPane {
                    }
                }

                Rectangle {
                    color: colorMain
                    implicitWidth: 1
                    Layout.fillHeight: true
                }

                CenterPane {
                }

                Rectangle {
                    color: colorMain
                    implicitWidth: 1
                    Layout.fillHeight: true
                }

                StackLayout {
                    currentIndex: rightTabBar.currentIndex

                    Layout.preferredWidth: 150
                    Layout.maximumWidth: 150
                    Layout.fillWidth: false

                    StatusPane {
                    }

                    StatusPane {
                    }

                    AirCondPane {
                    }

                    SeatsPane {
                    }

                    StatisticsPane {
                    }
                }
            }

            WebEngineView {
                anchors.fill: parent
                url: "https://maps.google.com"
            }

            InputDemo {
            }
        }

        RightButtonBar {
            id: rightTabBar
        }
    }
}
