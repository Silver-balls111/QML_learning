import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

ApplicationWindow {
    id: window

    minimumWidth: 540
    minimumHeight: 650
    maximumHeight: 650
    maximumWidth: 540
    visible: true
    title: qsTr("Ahji-Bhaji")

    background: Image{
        source: Qt.resolvedUrl("images/curry.jpg")
        fillMode: Image.PreserveAspectCrop
        opacity: 0.85
    }

    FontLoader{
        id: kalamFont
        source: Qt.resolvedUrl("fonts/Kalam-Regular.ttf")
    }

    font{
        family: kalamFont.font.family
        pixelSize: 24
    }

    RestroMenu {
        anchors.fill: parent
    }

}
