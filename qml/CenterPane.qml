import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

ColumnLayout {
    Layout.preferredWidth: 250
    Layout.fillWidth: true
    Layout.fillHeight: true

    GlowingLabel {
        id: timeLabel
        font.pixelSize: fontSizeExtraLarge
        text: Qt.formatTime(new Date(), "hh:mm:ss")

        Layout.alignment: Qt.AlignHCenter
    }

    Label {
        id: dateLabel
        color: colorLightGrey
        font.pixelSize: fontSizeMedium
        text: Qt.formatDate(new Date(), "dd.MM.yyyy")

        Layout.alignment: Qt.AlignHCenter
        Layout.topMargin: 2
        Layout.bottomMargin: 10
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered:
        {
            const ts = new Date();
            timeLabel.text = Qt.formatTime(ts, "hh:mm:ss");
            dateLabel.text = Qt.formatDate(ts, "dd.MM.yyyy");
        }
    }

    Image {
        source: "qrc:/icons/car.png"
        fillMode: Image.PreserveAspectFit

        Layout.fillHeight: true

        Column {
            x: parent.width * 0.88
            y: parent.height * 0.56
            spacing: 3

            Image {
                source: "qrc:/icons/warning.png"
                anchors.horizontalCenter: parent.horizontalCenter

                layer.enabled: true
                layer.effect: CustomGlow {
                    spread: 0.2
                    samples: 40
                    color: colorWarning
                }
            }

            GlowingLabel {
                text: qsTr("FOC err 4")
                color: colorWarning
                glowColor: Qt.rgba(colorWarning.r, colorWarning.g, colorWarning.b, 0.4)
            }
        }
    }
}
