import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Volume equilizer")

    Pane{
        anchors.fill: parent

        background: Rectangle{
            color: "black"
        }

        RowLayout{
            id: horizontalContainer

            anchors{
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            //orientation: Qt.Horizontal
            spacing: 3

            property var frequencyList: frequency_gen()
            Repeater{
                model: 100
                delegate: LedBar{
                    required property int index
                    property double bandFreq: horizontalContainer.frequencyList[index]
                }
            }

            Timer{
                interval: 250;
                running: true
                repeat: true

                onTriggered: horizontalContainer.frequencyList = horizontalContainer.frequency_gen()
            }

            function frequency_gen(){
                var frequencyList = []
                for(var i = 0; i < 100; i++){
                    frequencyList.push(Math.random())
                }
                return frequencyList
            }
        }
    }
}
