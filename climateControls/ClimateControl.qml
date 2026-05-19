import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

Page {
    padding: 10

    background: null

    header: Label {
        text: qsTr("Climate Controls")
        color: 'white'
        font.pixelSize: 48
        padding: 10
    }

    ColumnLayout{
        anchors.fill: parent
        spacing: 10

        ZoneControl{
            id: zone1

            zoneName: qsTr("Zone 1")

            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        ZoneControl{
            id: zone2

            zoneName: qsTr("Zone 2")
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
