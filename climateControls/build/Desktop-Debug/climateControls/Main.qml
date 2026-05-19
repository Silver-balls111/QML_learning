import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: window

    minimumWidth: 1024
    minimumHeight: 800
    maximumWidth: 1024
    maximumHeight: 800
    visible: true

    title: qsTr("Home Controls")

    font.pixelSize: 24

    background: Image{
        source: Qt.resolvedUrl("assets/Brushed-Metal.jpg")
        fillMode: Image.PreserveAspectCrop
    }

    ClimateControl {
        anchors.fill: parent
    }
}
