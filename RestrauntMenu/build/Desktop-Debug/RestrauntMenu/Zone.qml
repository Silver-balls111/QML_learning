import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Pane {

    background: Rectangle{
        color: "green"
    }

    ColumnLayout{

        Layout.fillWidth: true
        spacing: 10


        Label{
            text: qsTr("Starters")
        }

        GridLayout{
            rows: 3
            columns: 2

            component FoodName: Text{
                id: foodName

                property string food
                property double rate

                text: qsTr("%1: $%2").arg(foodName.food).arg(foodName.rate)
            }

            component Counter: RowLayout{
                id: counterRow
                spacing: 0

                property int count: 0

                Rectangle{

                    enabled: counterRow.count > 0
                    implicitWidth: 30
                    implicitHeight: 30
                    color: "lightgray"

                    Text{
                        text: "-"
                        anchors.centerIn: parent
                        font.pixelSize: 18
                        opacity: counterRow.count > 0 ? 1 : 0.5
                    }

                    TapHandler{
                        onTapped: counterRow.count = counterRow.count - 1
                    }
                }

                Rectangle{
                    implicitWidth: 45
                    implicitHeight: 30
                    color: 'white'

                    Text{
                        text: counterRow.count
                        anchors.centerIn: parent
                    }
                }

                Rectangle{
                    implicitWidth: 30
                    implicitHeight: 30
                    color: "lightgray"

                    Text{
                        text: "+"
                        anchors.centerIn: parent
                    }

                    TapHandler{
                        onTapped: counterRow.count = counterRow.count + 1
                    }
                }
            }

            FoodName{
                food: "alu chop"
                rate: 50.4
            }

            //Counter{}

            SpinBox{}
             FoodName{
                food: "alu chop"
                rate: 50.4
            }

            SpinBox{}

            FoodName{
                food: "alu chop"
                rate: 50.4
            }
            SpinBox{}
        }

        Rectangle{
            color: 'blue'
        }



    }
}
