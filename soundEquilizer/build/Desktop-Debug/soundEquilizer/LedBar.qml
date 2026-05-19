import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtCore

ColumnLayout{
    id: ledBar

    //required property int index

    //height: horizontalContainer.height
    //verticalLayoutDirection: ListView.BottomToTop
    spacing: 2

    //layoutDirection: Qt.BottomToTop
    //property double bandFreq: 0.75

    Repeater{
        model: 50
        delegate: Led{}
    }

}
