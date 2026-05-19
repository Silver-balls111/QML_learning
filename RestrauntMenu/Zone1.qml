import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Pane {

    background: Rectangle{
        color: Qt.rgba(1,1,1,0.25)
        border.color: 'black'
        border.width: 1
    }

    padding: 5
    leftPadding: 7

    //property double Total: starters.sectionTotal + mains.sectionTotal

    ColumnLayout{
        //Layout.fillWidth: true
        //Layout.fillHeight: true
        spacing: 5

        anchors.fill: parent

        component Section: ColumnLayout{
            id: section

            spacing: 5
            property alias title: sectionTitle.text
            property list<string> food
            property list<double> rate
            //property double sectionTotal: item1.total + item2.total + item3.total

            Label{
                id: sectionTitle
            }

            GridLayout{
                id: grido
                rows: 3
                columns:2

                Layout.fillHeight: true
                Layout.fillWidth: true

                columnSpacing: 10

                Label{
                    text: qsTr("%1: $%2").arg(section.food[0]).arg(section.rate[0])
                    font.pixelSize: 14
                }
                SpinBox{
                    id: item1; value: 0

                    contentItem: Label{
                        text: item1.textFromValue(item1.value, item1.locale)

                        horizontalAlignment: Qt.AlignHCenter
                        //verticalAlignment: Qt.AlignVCenter
                    }

                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 120
                    //property double total: value * rate[0]

                }


                Label{
                    text: qsTr("%1: $%2").arg(section.food[1]).arg(section.rate[1])
                    font.pixelSize: 14
                }
                SpinBox{
                    id: item2; value: 0
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 120

                    contentItem: Label{
                        text: item2.textFromValue(item2.value, item2.locale)

                        horizontalAlignment: Qt.AlignHCenter
                    }
                    //property double total: value * rate[0]

                }

                Label{
                    text: qsTr("%1: $%2").arg(section.food[2]).arg(section.rate[2])
                    font.pixelSize: 14
                }

                SpinBox{
                    id: item3; value: 0
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 120

                    contentItem: Label{
                        text: item3.textFromValue(item3.value, item3.locale)

                        horizontalAlignment: Qt.AlignHCenter
                    }
                    //property double total: value * rate[0]

                }
            }
        }

        Section{
            id: starters

            title: "Starters"
            food: ['Onion Bhaji', 'Meat Samosa', 'Nargis Kebab']
            rate: [10, 12, 15]
        }

        Section{
            id: mains
            title: "Mains"
            food: ['Panner Tikka', 'Lamb Bhuna', 'Murgh Tikka']
            rate: [20, 25, 28]
        }

        Label{
            text: qsTr("Spice Level")
        }

        Dial{
            Layout.alignment: Qt.AlignHCenter

            Layout.preferredHeight: 130
            Layout.preferredWidth: 130
            from: 0
            to: 5
            stepSize: 1

            Image{
                source: Qt.resolvedUrl("images/light/mild.svg")

                scale: 0.75
                anchors{
                    right: parent.left
                    bottom: parent.bottom
                }
            }

            Image{
                source: Qt.resolvedUrl("images/light/very_hot.svg")
                scale: 0.75
                anchors{
                    left: parent.right
                    bottom: parent.bottom
                }
            }
        }
    }
}

