import QtQuick

Rectangle{
    id: led

    width: 10
    height: 10
    radius: 2

    required property int index

    opacity: (index/50) > (1 - ledBar.bandFreq) ? 1 : 0
    color: Qt.hsla(ledBar.bandFreq, 1, 0.5, 1)

    //visible: (index/50) > (1 - ledBar.bandFreq) ? true : false

    Behavior on opacity{
        OpacityAnimator{
            duration: 100
            easing.type: Easing.InOutSine
        }
    }

    function color_gen(n){
        if(n >= 1 - 0.1)
            return "red"
        else if(n < 1 - 0.1 && n >= 0.76)
            return "yellow"
        else if(n < 0.76 && n >=  0.56)
            return "green"
        else if (n < 0.56 && n >= 0.36)
            return "blue"
        else if (n < 0.36 && n >= 0.2)
            return "purple"
        else
            return "pink"
    }
}
