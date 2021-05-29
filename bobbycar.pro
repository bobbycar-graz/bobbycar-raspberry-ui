TEMPLATE = app

TARGET = bobbycar

QT += qml quick quickcontrols2 webengine

CONFIG += link_pkgconfig

static {
    QT += svg
    QTPLUGIN += qtvirtualkeyboardplugin
}

SOURCES += \
    bobbycar.cpp

RESOURCES += \
    icons/icons.qrc \
    imagine-assets/imagine-assets.qrc \
    qml/qml.qrc \
    qtquickcontrols2.conf
