import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Chat App")

    color: 'lightgray'
    font.pixelSize: 18

    property string reciverName: 'Bob'

    RowLayout{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        ColumnLayout{
            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.alignment: Qt.AlignTop
            Layout.preferredWidth: 75
            Button{
                id: button1

                Layout.fillWidth: true
                background: Rectangle{
                    color: root.reciverName === button1.text ? "black" : "gray"
                    radius: 7
                }

                highlighted: true
                text: qsTr("Bob")
                onClicked: root.reciverName = button1.text
            }

            Button{
                id: button2

                Layout.fillWidth: true
                background: Rectangle{
                    color: root.reciverName === button2.text ? "black" : "gray"
                    radius: 7
                }

                highlighted: true
                text: qsTr("Alice")
                onClicked: root.reciverName = button2.text
            }

            Button{
                id: button3

                Layout.fillWidth: true

                background: Rectangle{
                    color: root.reciverName === button3.text ? "black" : "gray"
                    radius: 7
                }

                highlighted: true
                text: qsTr("Jhon")
                onClicked: root.reciverName = button3.text
            }
        }

        ColumnLayout{
            id: inputArea
            Layout.fillWidth: true
            Layout.fillHeight: true

            Layout.preferredWidth: 200

            Label{

                Layout.preferredHeight: 40
                Layout.fillWidth: true
                //Layout.alignment: Qt.AlignVCenter
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter

                background: Rectangle{
                    color: 'gray'
                    radius: 7
                }

                text: qsTr(`Chatting with ${root.reciverName}`)
            }

            Pane{
                Layout.fillWidth: true
                Layout.fillHeight: true
                //Layout.preferredWidth: 200

                background: Rectangle{
                    color: "gray"
                    radius: 7
                }

                ColumnLayout{
                    //Layout.margins: 10
                    anchors.fill: parent
                    spacing: 10

                    TextArea{
                        id: reply

                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredHeight: 350
                        Layout.maximumWidth: parent.width

                        background: Rectangle{
                            anchors.fill: parent
                            radius: 7
                            border.color: reply.enabled ? "blue" : 'transparent'
                        }

                        //elide: Text.ElideRight

                        placeholderText: qsTr("My Text")
                        wrapMode: TextEdit.Wrap
                        //TextArea.flickable: TextArea
                    }

                    RowLayout{

                        Layout.fillHeight: true
                        Layout.fillWidth: true


                        CheckBox{

                            background: Rectangle{
                                color: "white"
                                radius: 7
                            }

                            // leftPadding: 5
                            // rightPadding: 5
                            // topPadding: 3
                            // bottomPadding: 3
                            padding: 1

                            checked: true
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Layout.preferredWidth: 10
                        }

                        Button{
                            background: Rectangle{
                                //color: "red"
                                radius: 7
                            }

                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            text: qsTr("Send")
                        }
                    }
                }
            }
        }

        component ReciverLabel: Label{
            id: reciverLabel

            property alias message: reciverLabel.text

            Layout.maximumWidth: 250
            Layout.alignment: Qt.AlignLeft

            wrapMode: TextEdit.WordWrap
            padding: 7

            background: Rectangle{
                anchors.fill: parent
                color: "blue"
                radius: 7
            }
        }

        component SenderLabel: Label{
            id: senderLabel

            property alias message: senderLabel.text

            Layout.maximumWidth: 250
            Layout.alignment: Qt.AlignRight

            wrapMode: TextEdit.WordWrap
            padding: 7

            background: Rectangle{
                anchors.fill: parent
                color: "orange"
                radius: 7
            }
        }


        ScrollView{
            Layout.fillWidth: true

            contentWidth: availableWidth
            Layout.preferredWidth: 300
            Layout.fillHeight: true

            visible: root.reciverName == "Bob"
            //Layout.alignment: Qt.AlignTop

            ColumnLayout{
                id: chatViewBob

                spacing: 7
                anchors.fill: parent
                //Layout.preferredWidth: 350
                //Layout.fillHeight: true
                //Layout.fillWidth: true
                //Layout.alignment: Qt.AlignTop


                ReciverLabel{
                    message: "Hi, Mike!"
                }

                SenderLabel{
                    message: "hey Bob, how's it going? It's been a while!"
                }

                ReciverLabel{
                    message: "Great thanks! Want to go out for a steak?"
                }

                SenderLabel{
                    message: "You don't have to ask me twice! What time and where?"
                }

                ReciverLabel{
                    message: "The Red Meat Shack at 7pm?"
                }

                SenderLabel{
                    message: "Done! Medium Well;-)"
                }

                ReciverLabel{
                    message: "Hi, Mike!"
                }

                SenderLabel{
                    message: "hey Bob, how's it going? It's been a while!"
                }

                ReciverLabel{
                    message: "Great thanks! Want to go out for a steak?"
                }

                SenderLabel{
                    message: "You don't have to ask me twice! What time and where?"
                }

                ReciverLabel{
                    message: "The Red Meat Shack at 7pm?"
                }

                SenderLabel{
                    message: "Done! Medium Well;-)"
                }
            }
        }

        ScrollView{
            Layout.fillWidth: true

            contentWidth: availableWidth
            Layout.preferredWidth: 300
            Layout.fillHeight: true

            visible: root.reciverName == "Alice"

            ColumnLayout{
                id: chatViewAlice

                anchors.fill: parent
                spacing: 7

                ReciverLabel{
                    message: "Hi, Mike!"
                }

                SenderLabel{
                    message: "hey Alice, how's it going? It's been a while!"
                }
            }
        }

        ScrollView{
            Layout.fillWidth: true

            contentWidth: availableWidth
            Layout.preferredWidth: 300
            Layout.fillHeight: true

            visible: root.reciverName == "Jhon"
            ColumnLayout{
                id: chatViewJhon

                spacing: 7
                anchors.fill: parent

                ReciverLabel{
                    message: "Hi, Mike!"
                }

                SenderLabel{
                    message: "hey Jhon, how's it going? It's been a while!"
                }
            }
        }
    }
}
