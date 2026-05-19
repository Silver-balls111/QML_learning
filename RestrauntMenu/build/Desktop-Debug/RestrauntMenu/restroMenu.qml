import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page{

    padding: 10

    background: Rectangle{
        color: 'red'
    }

    RowLayout{
        spacing: 10

        anchors.fill: parent

        Zone {
           id: leftColumn

           Layout.fillHeight: true
           Layout.fillWidth: true
        }

        Zone {
            id: rightColumn
           Layout.fillHeight: true
           Layout.fillWidth: true
        }
    }

}
