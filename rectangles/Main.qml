import QtQuick

Window {
    maximumWidth: 400
    maximumHeight: 400
    color: "grey"

     Rectangle {
        id: upper
        x: 50; y: 50
        height: 100
        width: height * 2
        color: 'lightblue'
        Rectangle {
            x: 30; y: 30
            width: 30
            height: width
        }
    }
    Rectangle {
        x: 50;y: 150
        width: upper.width
        height: upper.height
        color:'green'
        Rectangle {
            x: 60; y: 45
            width: height * 3
            height: 30
            color: 'blue'

        }
    }
}
