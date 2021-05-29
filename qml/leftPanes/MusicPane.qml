import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import ".."

ColumnLayout {
    spacing: 16

    ButtonGroup {
        id: viewButtonGroup
        buttons: viewTypeRowLayout.children
    }

    RowLayout {
        id: viewTypeRowLayout
        spacing: 3

        Layout.bottomMargin: 12

        Button {
            text: qsTr("Compact")
            font.pixelSize: fontSizeExtraSmall
            checked: true

            Layout.fillWidth: true
        }
        Button {
            text: qsTr("Full")
            font.pixelSize: fontSizeExtraSmall
            checkable: true

            Layout.fillWidth: true
        }
    }

    GlowingLabel {
        text: qsTr("VOLUME")
        color: "white"
        font.pixelSize: fontSizeMedium
    }

    Dial {
        id: volumeDial
        from: 0
        value: 42
        to: 100
        stepSize: 1

        Layout.alignment: Qt.AlignHCenter
        Layout.minimumWidth: 64
        Layout.minimumHeight: 64
        Layout.preferredWidth: 128
        Layout.preferredHeight: 128
        Layout.maximumWidth: 128
        Layout.maximumHeight: 128
        Layout.fillHeight: true

        Label {
            text: volumeDial.value.toFixed(0)
            color: "white"
            font.pixelSize: Qt.application.font.pixelSize * 3
            anchors.centerIn: parent
        }
    }

    ButtonGroup {
        id: audioSourceButtonGroup
    }

    RowLayout {
        Layout.topMargin: 16

        GlowingLabel {
            id: radioOption
            text: qsTr("RADIO")
            color: "white"
            font.pixelSize: fontSizeMedium
            horizontalAlignment: Label.AlignLeft

            Layout.fillWidth: true
        }
        GlowingLabel {
            text: qsTr("AUX")
            color: colorLightGrey
            font.pixelSize: fontSizeMedium * 0.8
            horizontalAlignment: Label.AlignHCenter
            glowEnabled: false

            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
        }
        GlowingLabel {
            text: qsTr("MP3")
            color: colorDarkGrey
            font.pixelSize: fontSizeMedium * 0.6
            horizontalAlignment: Label.AlignRight
            glowEnabled: false

            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
        }
    }

    Frame {
        id: stationFrame
        leftPadding: 1
        rightPadding: 1
        topPadding: 1
        bottomPadding: 1

        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredHeight: 128

        ListView {
            clip: true
            anchors.fill: parent

            ScrollIndicator.vertical: ScrollIndicator {
                parent: stationFrame
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.rightMargin: 1
                anchors.bottom: parent.bottom
            }

            model: ListModel {
                ListElement { name: "V-Radio"; frequency: "105.5 MHz" }
                ListElement { name: "World News"; frequency: "93.4 MHz" }
                ListElement { name: "TekStep FM"; frequency: "95.0 MHz" }
                ListElement { name: "Classic Radio"; frequency: "89.9 MHz" }
                ListElement { name: "Buena Vista FM"; frequency: "100.8 MHz" }
                ListElement { name: "Drive-by Radio"; frequency: "99.1 MHz" }
                ListElement { name: "Unknown #1"; frequency: "104.5 MHz" }
                ListElement { name: "Unknown #2"; frequency: "91.2 MHz" }
                ListElement { name: "Unknown #3"; frequency: "93.8 MHz" }
                ListElement { name: "Unknown #4"; frequency: "80.4 MHz" }
                ListElement { name: "Unknown #5"; frequency: "101.1 MHz" }
                ListElement { name: "Unknown #6"; frequency: "92.2 MHz" }
            }
            delegate: ItemDelegate {
                id: stationDelegate
                width: parent.width
                height: 22
                text: model.name
                font.pixelSize: fontSizeExtraSmall
                topPadding: 0
                bottomPadding: 0

                contentItem: RowLayout {
                    Label {
                        text: model.name
                        font: stationDelegate.font
                        horizontalAlignment: Text.AlignLeft
                        Layout.fillWidth: true
                    }
                    Label {
                        text: model.frequency
                        font: stationDelegate.font
                        horizontalAlignment: Text.AlignRight
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }

    Frame {
        Layout.fillWidth: true

        RowLayout {
            anchors.fill: parent

            Label {
                text: qsTr("Sort by")
                font.pixelSize: fontSizeExtraSmall

                Layout.alignment: Qt.AlignTop
            }

            ColumnLayout {
                RadioButton {
                    text: qsTr("Name")
                    font.pixelSize: fontSizeExtraSmall
                }
                RadioButton {
                    text: qsTr("Frequency")
                    font.pixelSize: fontSizeExtraSmall
                }
                RadioButton {
                    text: qsTr("Favourites")
                    font.pixelSize: fontSizeExtraSmall
                    checked: true
                }
            }
        }
    }
}
