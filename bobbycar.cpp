#include <QGuiApplication>
#include <QCommandLineParser>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QQuickStyle>
#include <QIcon>
#include <QtWebEngine/QtWebEngine>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication::setApplicationName("Bobbycar HUD");
    QGuiApplication::setOrganizationName("Bobbycar Graz");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);

    QGuiApplication app(argc, argv);

    QtWebEngine::initialize();

    QIcon::setThemeName("bobbycar");

    QCommandLineParser parser;
    parser.addHelpOption();
    parser.addVersionOption();

    QCommandLineOption fullscreenOption {
        QStringList{"f", "fullscreen"},
        QCoreApplication::translate("main", "Show in fullscreen (only raspberry)")
    };
    parser.addOption(fullscreenOption);

    if (!parser.parse(app.arguments()))
    {
        qCritical("could not parse arguments!");
        return -1;
    }

    QQmlApplicationEngine engine;
    engine.load(QUrl(parser.isSet(fullscreenOption) ? "qrc:/qml/main-raspberry.qml" : "qrc:/qml/main-dev.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
