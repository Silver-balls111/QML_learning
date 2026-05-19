import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page{

    //padding: 10

    background: null

    header: Label{
        text: qsTr("Ahji-Bhaji")
        font.pixelSize: 24
        font.bold: true
        topPadding: 5
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
    }

    RowLayout{
        spacing: 0

        anchors.fill: parent

        Zone1 {
           id: leftColumn

           Layout.fillHeight: true
           Layout.fillWidth: true
        }

        Zone2 {
            id: rightColumn
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }


    footer: RowLayout{
        anchors{
            left: parent.left
            right: parent.right
        }

        Label{
            text: qsTr("Total Order Cost:")
            Layout.leftMargin: 5
        }

        Button{
            text: qsTr("Order Now")
            onClicked: {
                processingPopup.open()
                processTime.restart()
            }
            Layout.alignment: Qt.AlignRight
            Layout.preferredHeight: 40
            Layout.margins: 3
        }
    }

    Popup{
        id: processingPopup

        x: 100
        y: 100
        width: 350
        height: 350
        focus: true

        ColumnLayout{
            anchors.centerIn: parent

            Label{
                text:qsTr("Processing")
            }

            BusyIndicator{
                running: true
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }

    Timer{
        id: processTime
        interval: 2000
        onTriggered: {
            processingPopup.close()
            processedPopup.open()
        }
    }

    Popup{
        id: processedPopup

        anchors.centerIn: parent
        width: 350
        height: 350
        focus: true

        Label{
            text: qsTr("Order Processed")
            anchors.centerIn: parent
        }
    }
}
