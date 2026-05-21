import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root
    visible: true
    width:800
    height: 600
    title:"behaviour animation example"

    Rectangle{
        id: sky
        width:  root.width
        height: 20
        color: "lightblue"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
    }

    Rectangle{
        id: trampoline
        width:  root.width
        height: 100
        color: "green"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }

    Rectangle {
        id: ball
        width: 50
        height: width
        radius: width / 2
        color: "red"
        anchors.horizontalCenter: parent.horizontalCenter
        y: trampoline.y - height

        Behavior on y{
            SpringAnimation{
                id: behaviorAnimation
                spring: 4
                damping: 0.2
            }
        }
    }

    Label{
        anchors.centerIn: parent
        text: "Click to bounce"
        font{
            pixelSize: 24
            bold: true
        }
        visible: !behaviorAnimation.running
    }

    MouseArea{
        anchors.fill: parent

        onClicked: {
            ball.y = (ball.y === sky.height) ? trampoline.y - ball.height : sky.height
        }
    }
}
