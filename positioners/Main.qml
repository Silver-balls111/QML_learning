import QtQuick

Window {
    minimumWidth: 800
    minimumHeight: 800
    //maximumWidth: 1200
    //maximumHeight: 800
   visible: true
    title: qsTr("Hello Positioners")

    Component{
        id: imageDelegate

        Image {
            id: image

            required property int index

            source: Qt.resolvedUrl(`assets/image${index}.jpg`)
            asynchronous: true

            width: 100
            height: 100
            Text {
                anchors.centerIn: parent
                text: image.Positioner.index
                font.pixelSize: 30
                color: "white"
                style: Text.Outline
                styleColor: "black"
            }

            Rectangle {
                anchors.fill: parent
                color: "transparent"
                border {
                    width: 5
                    color: image.Positioner.isFirstItem ?
                           "green" : image.Positioner.isLastItem ?
                           "red" : "transparent"
                }
            }
        }
    }

    Flow{
        id: row

        spacing: 10
        //padding: 10

        anchors.fill: parent
        Repeater {
        model: 10
        delegate: imageDelegate
        }
    }
}
