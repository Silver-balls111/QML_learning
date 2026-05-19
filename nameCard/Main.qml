import QtQuick

Window {
    id: root

   // width: 800
    //height: 600
    maximumWidth: 900
    maximumHeight: maximumWidth / 1.586
    visible: true
    title: qsTr("Bussiness Card")


    Rectangle {
        id: outerBorder

        x: 10; y: 10
        width:  root.width -20
        height:  root.height - 20
        //color: "lightgray"
        border.color: "black"
        border.width: 2
        radius: 10


        Rectangle {
            id: innerElements
            x: 10; y: 10
            width: outerBorder.width - 20
            height: outerBorder.height - 20

            //color: "red"


            Text{
                id: name
                text: "YOUR NAME"
                font.pixelSize: 56
                font.family: "Helvetica"
                font.bold: true
                topPadding: 5

            }
            Rectangle{
                id: imageBorder

                width: 300; height: width
                border.color:	outerBorder.border.color
                border.width: outerBorder.border.width
                radius: outerBorder.radius
                anchors.right: innerElements.right

                Image{
                    source: "IDPhoto"
                    anchors.fill: parent
                    anchors.margins: 5
                    fillMode: Image.Stretch
                }
            }

            property bool isClicked: false

            Rectangle{
                id: details

                visible: innerElements.isClicked

                property string address: "Candy Cane Lane"
                property string country: "North Pole"
                property string phone: "+01 2353 344 547"
                property string email: "email@server.com"
                property string website: "https://qt.io"
                anchors.top: name.bottom

                Text {
                    id: address
                    text: parent.address
                    font.pixelSize: 36
                }
                Text {
                    id: country
                    text: parent.country
                    font.pixelSize: 36
                    anchors.top: address.bottom
                    topPadding: 5
                }
                Text {
                    id: phone
                    text: parent.phone
                    font.pixelSize: 24
                    anchors.top: country.bottom
                    topPadding: 5
                }
                Text {
                    id: email
                    text:parent.email
                    font.pixelSize: 24
                    anchors.top: phone.bottom
                    topPadding: 5
                }
                Text {
                    id: website
                    text: parent.website
                    font.pixelSize: 24
                    anchors.top: email.bottom
                    topPadding: 5
                }
            }

            Rectangle{
                id:	basicInfo

                visible: !innerElements.isClicked
                anchors.top: name.bottom

                Text {
                    id: job
                    text: qsTr("QML STUDENT")
                    font.pixelSize: 40
                    font.bold: true
                }
                Text {
                    text: qsTr("First Project")
                    font.pixelSize: 30
                    anchors.top: job.bottom
                }
            }

            Rectangle {
               id:	button

               y: innerElements.height - 50
               radius: 20
               width: 150
               height: 50
               color: innerElements.isClicked ? "lightgrey" : "white"
               border.color: outerBorder.border.color
               border.width: outerBorder.border.width
               clip: true

               Text {
                   text: qsTr("Details")
                   font.pixelSize:20
                   font.bold: true
                   //width: parent
                   //height: parent

                   anchors.centerIn: parent
                   //anchors.verticalCenter: parent.verticalCenter
                   //anchors.horizontalCenter: parent.horizontalCenter
               }

            }

            MouseArea {
                anchors.fill: button

                onClicked: innerElements.isClicked = !innerElements.isClicked
            }
        }

    }
}
