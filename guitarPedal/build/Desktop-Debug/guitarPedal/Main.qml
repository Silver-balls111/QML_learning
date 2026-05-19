import QtQuick

Window {
    id: root
    minimumWidth: 260
    minimumHeight: 380
    maximumWidth: minimumWidth
    maximumHeight: minimumHeight
    visible: true
    title: qsTr("Guitar Pedal")

    Image{
        source: "assets/Guitar-Pedal-Background.png"
        anchors.fill: parent
        //fillMode: fit

    }

    FontLoader{
        id: russoFontLoader
        source: "fonts/RussoOne-Regular.ttf"
    }

    FontLoader{
        id: prismaFontLoader
        source: "fonts/Prisma.ttf"
    }

    Item{
        anchors{
            fill: parent
            leftMargin: 15			//Margin dont apply to edge that isn't anchored
            rightMargin: 15
            topMargin: 17
            bottomMargin: 17
        }

        component ScrewImage: Image{
            source: "assets/Screw.png"
        }

        ScrewImage{
            anchors.left: parent.left
            anchors.top: parent.top
        }

        ScrewImage{
            anchors.right: parent.right
            anchors.top: parent.top
        }
        ScrewImage{
            anchors.left: parent.left
            anchors.bottom: parent.bottom
        }

        ScrewImage{
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }

        component DeviceText: Text{
            color: 'black'
            font.family: russoFontLoader.font.family
            font.weight: russoFontLoader.font.weight
            font.pixelSize: 14
        }

        component InfoLabel: Column{
            id: infoLabel
            spacing: 5

            property int lineWidth: 30
            property int lineHeight: 2
            property color color: 'black'
            property alias text: label.text
            property alias font: label.font

            Rectangle{
                width: infoLabel.lineWidth
                height: infoLabel.lineHeight
                color: infoLabel.color
            }

            DeviceText{
                id: label
                anchors.horizontalCenter: infoLabel.horizontalCenter
            }

            Rectangle{
                width: infoLabel.lineWidth
                height: infoLabel.lineHeight
                color: infoLabel.color
            }
        }

        InfoLabel{
            text: qsTr("OUT")

            anchors{
                left: parent.left
                top: parent.top
                topMargin: 60
            }
        }

        InfoLabel{
            text: qsTr("IN")

            anchors{
                right: parent.right
                top: parent.top
                topMargin: 60
            }
        }

        InfoLabel{
            text: qsTr("TIME BLENDER")
            spacing: 10
            lineWidth: 200

            font {family: prismaFontLoader.font.family; pixelSize: 18}

            anchors{
                horizontalCenter: parent.horizontalCenter
                top: parent.verticalCenter
                topMargin: 16
            }
        }
    }

    component SwitchImage: Image{
        required property string sourceImage
        property bool checked

        source: `assets/${sourceImage}${checked ? "-Checked" : ""}.png`
    }

    component DeviceSwitch: SwitchImage{
        property alias tapMargin: tapHandler.margin

        TapHandler{
            id: tapHandler
            onTapped: parent.checked = !parent.checked
        }
    }

    SwitchImage{
        x: parent.width * 0.33 - width /2
        y: 14

        sourceImage: 'LED'
        checked: buttonPedal.checked

        DeviceText{
            text: qsTr("CHECK")
            font.pixelSize: 11
            anchors{
                top: parent.bottom
                horizontalCenter: parent.horizontalCenter
                topMargin: 5
            }
        }
    }

    DeviceSwitch{
        x: parent.width * 0.66 - width /2
        y: 14

        sourceImage: "Switch"
        checked: false
        tapMargin: 16

        DeviceText{
            text: qsTr("MODE")
            font.pixelSize: 11
            anchors{
                top: parent.bottom
                horizontalCenter: parent.horizontalCenter
                topMargin: 4
            }
        }
    }


    DeviceSwitch{
        id: buttonPedal

        sourceImage: "Button-Pedal"
        checked: false

        anchors{
            bottom: parent.bottom
            bottomMargin: 17
            horizontalCenter: parent.horizontalCenter
        }
    }

    component Knobs: Image{
        id: knob
        source: 'assets/Knob-Markings.png'

        property alias label: knobLabel.text

        property int value
        property real angle

        readonly property int minimumValue: 0
        readonly property int maximumValue: 100
        readonly property int range: knob.maximumValue - knob.minimumValue

        DragHandler{
            target: null

            onCentroidChanged: updateValueAndRotation()

            function updateValueAndRotation(){
                if (centroid.pressedButtons !== Qt.LeftButton){
                    return
                }

                const startAngle = -140
                const endAngle = 140

                const yy = knob.height / 2.0 - centroid.position.y
                const xx = centroid.position.x - knob.width / 2.0

                const radianAngle = Math.atan2(yy, xx)
                let newAngle = (-radianAngle / Math.PI * 180) + 90

                newAngle = ((newAngle - knob.angle + 180) % 360) + knob.angle - 180

                knob.angle = Math.max(startAngle, Math.min(newAngle, endAngle))
                knob.value = (knob.angle - startAngle) / (endAngle - startAngle) * knob.range

                console.log("anlge: ", knob.angle, "value: ", knob.value)
            }
        }

        Image{
            anchors.centerIn: parent
            source: 'assets/Knob-Dial.png'
            rotation: knob.angle
        }

        DeviceText{
            id: knobLabel
            anchors{
                top: knob.bottom
                horizontalCenter: knob.horizontalCenter
            }
            font.pixelSize: 11
        }
        DeviceText{
            text: qsTr("MIN")
            anchors{
                left: knob.left
                bottom: knob.bottom
            }
            font.pixelSize: 6
        }
        DeviceText{
            text: qsTr("MAX")
            anchors{
                right: knob.right
                bottom: knob.bottom
            }
            font.pixelSize: 6
        }
    }

    Knobs{
        y: 67 - height / 2
        anchors.horizontalCenter: parent.horizontalCenter
        label: qsTr("Level")
    }
    Knobs{
        anchors.left: buttonPedal.left
        y: 145 - height / 2
        label: qsTr("TIME")
    }
    Knobs{
        anchors.right: buttonPedal.right
        y: 145 - height / 2
        label: qsTr("FEEDBACK")
    }

}
