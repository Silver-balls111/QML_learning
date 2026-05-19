import QtQuick.Controls
import QtQuick

Button{
    padding: 10

    contentItem: Label {
        text: "Click Here"

        Rectangle {
            anchors.fill: parent
            color: 'red'
            opacity: 0.2
        }
    }
}
