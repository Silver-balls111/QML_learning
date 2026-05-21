import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    id: rootWindow
    width: 640
    height: 480
    title: "easing types example"
    visible: true

    Column{
        anchors.fill: parent
        spacing: 20

        Rectangle{
            id: red
            width: 100; height: 50; color: "red"
        }
        Rectangle{
            id: blue
            width: 100; height: 50; color: "blue"
        }
        Rectangle{
            id: green
            width: 100; height: 50; color: "green"
        }
    }

    PropertyAnimation{
        target: red
        property: "x"
        from: 0
        to: rootWindow.width - red.width
        running: true
        easing.type: Easing.InOutQuad
        loops: Animation.Infinite
        duration: 4000
    }
    PropertyAnimation{
        target: blue
        property: "x"
        from: 0
        to: rootWindow.width - blue.width
        running: true
        easing.type: Easing.OutBounce
        loops: Animation.Infinite
        duration: 4000
    }
    PropertyAnimation{
        target: green
        property: "x"
        from: 0
        to: rootWindow.width - green.width
        running: true
        easing.type: Easing.InElastic
        loops: Animation.Infinite
        duration: 4000
    }
}
