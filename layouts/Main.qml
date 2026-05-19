import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

ApplicationWindow {
    id: window
    minimumWidth: 1280
    minimumHeight: 800
    maximumWidth: 1280
    maximumHeight: 800

    visible: true
    title: qsTr("Hello Layouts")

    color: 'black'
    palette.windowText: 'white'

    property int currentImageIndex: 0

    Component {
        id: thumbnailDelegate

        Image{
            id: thumbnail

            required property int index

            source: Qt.resolvedUrl(`assets/image${index}.jpg`)
            asynchronous: true

            Layout.preferredHeight: 100
            Layout.preferredWidth: 100

            Rectangle{
                color: 'transparent'
                border.color: 'white'
                border.width: window.currentImageIndex == thumbnail.index ? 2 : 0
                anchors.fill: parent
            }

            Label{
                anchors.centerIn: parent
                text: thumbnail.index
                style: Text.Outline
                styleColor: 'black'
                font.pixelSize: 30
            }

            MouseArea{
                anchors.fill: parent
                onClicked: window.currentImageIndex = thumbnail.index
            }
        }
    }

    RowLayout{
        anchors.fill: parent
        anchors.margins: 5

        Flickable{
            id: flickable

            contentWidth: gridLayout.width
            contentHeight: gridLayout.height

            Layout.fillHeight: true
            Layout.preferredWidth: gridLayout.width

            clip: true

            GridLayout{
                id: gridLayout

                columns: 2

                Repeater{
                    model: 10
                    delegate: thumbnailDelegate
                }
            }
        }

        ColumnLayout{
            id: preview

            //Layout.fillWidth: true
            //Layout.fillHeight: true

            Image{
                id: previewImage
                Layout.fillWidth: true
                Layout.fillHeight: true

                source: Qt.resolvedUrl(`assets/image${window.currentImageIndex}.jpg`)
                asynchronous: true

            }

            RowLayout{
                id: imageDetails

                Layout.minimumHeight: 40

                Label{
                    text: qsTr("Source")
                    font.bold: true
                }

                Label{
                    text: previewImage.source
                }

                Label{
                    text: qsTr("Width")
                    font.bold: true
                }

                Label{
                    text: previewImage.sourceSize.width
                }

                Label{
                    text: qsTr("Height")
                    font.bold: true
                }

                Label{
                    text: previewImage.sourceSize.height
                }

                Label{
                    text: qsTr("Painted Width")
                    font.bold: true
                }

                Label{
                    text: previewImage.paintedWidth
                }

                Label{
                    text: "Painted Height"
                    font.bold: true
                }

                Label{
                    text: previewImage.paintedHeight
                }

            }
        }
    }
}
