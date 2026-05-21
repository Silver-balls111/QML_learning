import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    id: rootWindow

    width: 640
    height: 480
    visible: true
    title: qsTr("QML Property Animation Example")

    property int currentColorIndex: 1;

    Rectangle{
        id: animatedRectangle
        width: 100
        height: 100
        color: "red"


        Behavior on color{

            ColorAnimation {
                duration: 1000
                easing.type: Easing.InOutQuad
            }
        }


    }

    PropertyAnimation{
        target: animatedRectangle
        property: "rotation"
        from: 0
        to: 360
        duration: 2000
        loops: Animation.Infinite
        easing.type: Easing.InOutQuad
        running: true
    }

    SequentialAnimation {
        loops: Animation.Infinite
        PropertyAnimation {
            target: animatedRectangle
            property: "scale"
            from: 1.0
            to: 1.5
            duration: 1000
        }
        PauseAnimation {
            duration: 500
        }
        PropertyAnimation {
            target: animatedRectangle
            property: "scale"
            from: 1.5
            to: 1.0
            duration: 1000
        }
        running: true
    }

    ParallelAnimation{
        running: true
        loops: Animation.Infinite

        NumberAnimation {
            target: animatedRectangle
            property:"x"
            from: 0
            to: 640
            duration: 2000
        }
        NumberAnimation {
            target: animatedRectangle
            property:"y"
            from: 0
            to: 480
            duration: 2000
        }
    }
    Timer{
            interval: 1000
            repeat: true
            running: true
            onTriggered: {
                rootWindow.currentColorIndex = rootWindow.currentColorIndex === 1 ? 2:1;
                animatedRectangle.color = rootWindow.currentColorIndex === 1 ? "red" : "blue";
           }
        }
}
