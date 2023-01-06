# QML BouncingBall Game
The code defines a game in which a ball bounces around the screen and can be controlled by a user-draggable paddle at the bottom of the screen. 
When the ball hits the paddle, the ball bounces back up and the player scores a hit. 
If the ball falls off the bottom of the screen, the player scores a miss. 
The player's score (number of hits minus number of misses) is displayed on the screen.

The game is implemented using the QtQuick framework, which provides a set of QML (Qt Modeling Language) elements for creating user interfaces. 
The code is made up of several elements, including Window, Timer, Rectangle, and Text.

The Window element defines the overall game window, including its size and title. 
The Timer element is used to update the game state and redraw the screen at a regular interval. 
The Rectangle elements are used to define the ball, the paddle, and the container for the game elements. 
The Text element is used to display the player's score.

The game's logic is implemented in the onTriggered event handler of the Timer element. 
This event handler is called every time the timer fires, which occurs at a regular interval specified by the interval property of the timer. 
The event handler contains several if statements that check the position of the ball and the paddle, and update their positions and the player's score accordingly.

The paddle can be moved left and right by the player using the left and right arrow keys. 
The movement of the paddle is animated using a Behavior element and a `Number
