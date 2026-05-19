import QtQuick

Window {
    width: 1200
    height: 800
    visible: true
    title: qsTr("Anchors")

    contentItem{
        scale: 0.1
        transformOrigin: Item.TopLeft
    }

    Image{
        id: image0

        source: Qt.resolvedUrl("assets/image0.jpg")
    }
     Image{
        id: image1

        source: Qt.resolvedUrl("assets/image1.jpg")
        anchors.left: image0.right
    }
     Image{
        id: image2

        source: Qt.resolvedUrl("assets/image2.jpg")
        anchors.left: image1.right
    }
     Image{
        id: image3

        source: Qt.resolvedUrl("assets/image3.jpg")
        anchors.left: image2.right
    }
     Image{
        id: image4

        source: Qt.resolvedUrl("assets/image4.jpg")
        anchors.left: image3.right
    }
     Image{
        id: image5

        source: Qt.resolvedUrl("assets/image5.jpg")
        anchors.left: image4.right
    }
    Image{
        id: image6

        source: Qt.resolvedUrl("assets/image6.jpg")
        anchors.left: image5.right
    }
    Image{
        id: image7

        source: Qt.resolvedUrl("assets/image7.jpg")
        anchors.left: image6.right
    }
    Image{
        id: image8

        source: Qt.resolvedUrl("assets/image8.jpg")
        anchors.left: image7.right
    }
    Image{
        id: image9

        source: Qt.resolvedUrl("assets/image9.jpg")
        anchors.left: image8.right
    }
}