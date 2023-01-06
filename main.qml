import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Bouncing Ball Game")

    // Properties for storing game state
    property int xincrement: 2
    property int yincrement: 10
    property int hit: 0
    property int miss: 0
    property int finalScore: hit - miss

    // Timer to update game state and redraw screen
    Timer{
        id: mainTimer
        interval: 2
        running: true
        repeat: true

        onTriggered: {
            // Reverse direction of ball if it hits an edge
            if(ball.x + ball.width >= container.width || ball.x <= 0){
                xincrement *= -1
            }
            if(ball.y >= container.height || ball.y <= 0) {
                yincrement *= -1
            }
            // Reverse direction of ball if it hits paddle
            else if(ball.y + ball.height >= mainRect.y && ball.x >= mainRect.x && ball.x <= mainRect.x + mainRect.width) {
                yincrement *= -1
                ball.y = mainRect.y - ball.height
                hit += 1
            }
            // If ball falls off bottom of screen, increment miss count
            if(ball.y >= container.height){
                miss += 1
            }

            // Update ball position
            ball.x += xincrement
            ball.y += yincrement
        }
    }

    // Container for game elements
    Rectangle{
        id: container
        anchors.fill: parent
        border.color: "orange"
        border.width: 3

        // Ball
        Rectangle {
            id: ball
            width: 50
            height: width
            radius: width / 2
            color: "lightgreen"
            border.color: "black"
            x:300
            y:300
        }

        // Paddle
        Rectangle{
            id: mainRect
            anchors.bottom: container.bottom
            width: 150
            height:50
            x:parent.width / 2
            y:100
            color: "yellow"
            border.color: "black"
            border.width: 2
            radius: 10
            focus: true

            // Display text on paddle
            Text {
                anchors.centerIn: parent
                text: qsTr("Drag Me")
            }

            // Move paddle left or right when arrow keys are pressed
            Keys.onRightPressed: {
                if(mainRect.x + mainRect.width < container.width)
                    mainRect.x += 50;
                else
                    mainRect.x = container.width - mainRect.width
            }

            Keys.onLeftPressed: {
                if(mainRect.x > 0)
                    mainRect.x -= 50;
                else
                    mainRect.x = 0
            }

            // Animate paddle movement
            Behavior on x{
                NumberAnimation {
                    duration: mainTimer.interval
                    easing.type: Easing.OutElastic
                }
            }


        }

        // Display player's score
        Text {
            id: textCount
            anchors.left: parent.left
            anchors.top: parent.top
            color: "black"
            font.pointSize: 20
            textFormat: Text.RichText
            lineHeight: 2
            text: "<b>Hits:</b> " + hit + " <b>Misses:</b> " + miss  + " <b>Final Score:</b> " + finalScore
        }
    }
}
