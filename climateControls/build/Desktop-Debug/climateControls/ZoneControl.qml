import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Pane{
    id: root

    property string zoneName
    property int celsius: temperatureDial.value
    property int fahrenheit: (celsius * 1.8) + 32

    readonly property color temperatureColor: {
        if (celsius < 10)
            return Qt.color("lightblue")
        else if (celsius >= 10 && celsius < 20)
            return Qt.color("cyan")
        else if (celsius >= 20 && celsius < 30)
            return Qt.color("orange")
        else
            return Qt.color("red")
    }

    palette{
        windowText: root.temperatureColor
        dark: root.temperatureColor
    }

    background: Rectangle{
        color: 'black'
        opacity: 0.5
    }

    RowLayout{

        anchors.fill: parent
        spacing: 10

        ColumnLayout{
            //leftColumn

            Layout.alignment: "AlignTop"
            Layout.topMargin: 5

            spacing: 10

            RowLayout{
                spacing: 10

                CheckBox{
                    id: zoneEnabledCheckBox
                    checked: true
                    text: qsTr("Enable %1").arg(root.zoneName)
                }

                Switch{
                    id: unitsSwitch

                    text: "\u00B0C / \u00B0F"
                }
            }

            RowLayout{
                enabled: zoneEnabledCheckBox.checked
                spacing: 10
                Layout.topMargin: 15

                Image{
                    //cool temperature image
                    source: Qt.resolvedUrl("assets/cool.svg")
                    Layout.alignment: Qt.AlignBottom

                }

                Dial{
                    id: temperatureDial

                    from: 0 // degree celcius
                    to: 40

                    value: 21
                    stepSize: 1
                    snapMode: Dial.SnapOnRelease
                }
                Image{
                    //hot temperature image
                    source: Qt.resolvedUrl("assets/heat.svg")
                    Layout.alignment: Qt.AlignBottom
                }
            }
        }

        ColumnLayout{
            id: rightColumn

            enabled: zoneEnabledCheckBox.checked
            spacing: 10

            Label{
                text: unitsSwitch.checked ? root.fahrenheit + "\u00B0F" : root.celsius + "\u00B0C"

                font{
                    weight: Font.ExtraLight
                    pixelSize: 200
                }

                Layout.fillWidth: true
                horizontalAlignment: Qt.AlignRight

                renderType: Text.CurveRendering
            }

            RowLayout{

                spacing: 10

                Image{
                    source: fanSpeedSlider.value > 0 ?
                            Qt.resolvedUrl("assets/fan_outline.svg") :
                            Qt.resolvedUrl("assets/fan_off.svg")
                    scale: 0.75
                }

                Slider{
                    id: fanSpeedSlider

                    from: 0 // fan off
                    to: 100 // fan max speed

                    Layout.fillWidth: true
                    //Layout.fillHeight: true
                }

                Image{
                    source: Qt.resolvedUrl("assets/fan_fill.svg")
                    scale: 1.25 //slightly larger image
                }
            }
        }
    }
}
