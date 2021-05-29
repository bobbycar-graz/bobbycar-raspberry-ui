import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtLocation 5.6
import QtPositioning 5.6
import ".."

Item {
    Plugin {
        id: mapPlugin
        // name: "osm"
        // name: "mapboxgl"
        name: "esri"
        // specify plugin parameters if necessary
        // PluginParameter {
        //     name:
        //     value:
        // }
    }

    Map {
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(47.0582267, 15.4460315)
        zoomLevel: 14
    }
}
