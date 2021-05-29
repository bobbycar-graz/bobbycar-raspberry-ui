import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import ".."

ColumnLayout {
    Row {
        spacing: 8

        Image {
            source: "qrc:/icons/weather.png"
        }

        Column {
            spacing: 8

            Row {
                anchors.horizontalCenter: parent.horizontalCenter

                GlowingLabel {
                    id: outsideTempValueLabel
                    text: qsTr("31")
                    font.pixelSize: fontSizeLarge
                }

                GlowingLabel {
                    text: qsTr("°C")
                    font.pixelSize: Qt.application.font.pixelSize * 2.5
                    anchors.baseline: outsideTempValueLabel.baseline
                }
            }

            Label {
                text: qsTr("Graz")
                color: colorLightGrey
                font.pixelSize: fontSizeMedium
            }
        }
    }

    ColumnLayout {
        id: airConRowLayout
        spacing: 8

        Layout.preferredWidth: 32
        Layout.preferredHeight: 380
        Layout.fillHeight: true

        Item {
            Layout.fillHeight: true
        }

        SwitchDelegate {
            text: qsTr("AC")
            leftPadding: 0
            rightPadding: 0
            topPadding: 0
            bottomPadding: 0

            Layout.fillWidth: true
        }

        // QTBUG-63269
        Item {
            implicitHeight: temperatureValueLabel.implicitHeight
            Layout.fillWidth: true
            Layout.topMargin: 16

            Label {
                text: qsTr("Temperature")
                anchors.baseline: temperatureValueLabel.bottom
                anchors.left: parent.left
            }

            GlowingLabel {
                id: temperatureValueLabel
                text: qsTr("24°C")
                font.pixelSize: fontSizeLarge
                anchors.right: parent.right
            }
        }

        Slider {
            value: 0.35
            Layout.fillWidth: true
        }

        // QTBUG-63269
        Item {
            implicitHeight: powerValueLabel.implicitHeight
            Layout.fillWidth: true
            Layout.topMargin: 16

            Label {
                text: qsTr("Power")
                anchors.baseline: powerValueLabel.bottom
                anchors.left: parent.left
            }

            GlowingLabel {
                id: powerValueLabel
                text: qsTr("10%")
                font.pixelSize: fontSizeLarge
                anchors.right: parent.right
            }
        }

        Slider {
            value: 0.25
            Layout.fillWidth: true
        }

        SwitchDelegate {
            text: qsTr("Low")
            leftPadding: 0
            rightPadding: 0
            topPadding: 0
            bottomPadding: 0

            Layout.fillWidth: true
            Layout.topMargin: 16
        }

        SwitchDelegate {
            text: qsTr("High")
            checked: true
            leftPadding: 0
            rightPadding: 0
            topPadding: 0
            bottomPadding: 0

            Layout.fillWidth: true
        }

        SwitchDelegate {
            text: qsTr("Defog")
            leftPadding: 0
            rightPadding: 0
            topPadding: 0
            bottomPadding: 0

            Layout.fillWidth: true
        }

        SwitchDelegate {
            text: qsTr("Recirculate")
            leftPadding: 0
            rightPadding: 0
            topPadding: 0
            bottomPadding: 0

            Layout.fillWidth: true
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
