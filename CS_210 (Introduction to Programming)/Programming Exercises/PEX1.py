"""CS 210, Introduction to Programming, Fall 2015, Jake Orner.

Instructor: Dr. Bower

Documentation: I used this website http://www.ferg.org/easygui/easygui.html#-buttonbox to learn about easygui commands
as well as finding the necessary parameters required to use these functions in my program. Specifically in the main
function when I used enterboxs as well as in my roll_die function to create a boolbox asking the user to roll or hold.
"""

import easygui
import random
import turtle

# Define several useful constants to be used by the Turtle graphics.
WIDTH = 960              # Usually 720, 960, 1024, 1280, 1600, or 1920.
HEIGHT = WIDTH * 9 / 16  # Produces the eye-pleasing 16:9 HD aspect ratio.
MARGIN = 32              # Somewhat arbitrary value, but it looks nice.
FONT_SIZE = 16           # Somewhat arbitrary value, but it looks nice.
DRAW_FAST = True        # Set to True for fast, stealthy turtles.
SQUARE_SIDE = (WIDTH - (9 * MARGIN)) / 8  # Creates the length of the side of the square
PIP_SIZE = SQUARE_SIDE / 7  # Sets the size of the pips


def main():
    """Main program to run the Pig game program."""
    # Create the turtle screen and two turtles (leave this as the first line of main).
    screen, artist, writer = turtle_setup()
    game_over = False  # Instantiates the game_over boolean used to declare when the game is finished
    screen.bgcolor("green")  # Sets the background color to green
    name1 = easygui.enterbox("Player 1", "What is Player 1's name?", "")  # Asks the user for the player's names
    name2 = easygui.enterbox("Player 2", "What is Player 2's name?", "")
    score1 = 0  # Instantiates the initial scores for each player
    score2 = 0
    writer.write("{}:  {}, {}:  {}".format(name1, score1, name2, score2), align="center",
                 font=( "Arial", FONT_SIZE, "bold"))  # Writes the player's names and scores at the top of the screen

    while not game_over:  # Creates a while loop to run the game
        writer.write("{}:  {}, {}:  {}".format(name1, score1, name2, score2), align="center",
                     font=( "Arial", FONT_SIZE, "bold"))  # Continues writing names and scores through each turn cycle
        score1 += roll_die( artist, name1, score1 )  # Adds the player's turn score to their overall score
        writer.clear()  # Clears the last iteration of scores from the screens
        writer.write("{}:  {}, {}:  {}".format(name1, score1, name2, score2), align="center",
                     font=( "Arial", FONT_SIZE, "bold"))
        artist.clear()  # Clears the last depictions of dice from the screen
        if score1 >= 100:  # Checks for a game over scenario
            game_over = True
            writer.setposition(0, 0)
            writer.write("{} wins!".format(name1), align="center", font=("Arial", FONT_SIZE, "bold"))
        if not game_over:
            score2 += roll_die( artist, name2, score2 )
            writer.clear()
            writer.write("{}:  {}, {}:  {}".format(name1, score1, name2, score2), align="center",
                         font=( "Arial", FONT_SIZE, "bold"))
            artist.clear()
        if score2 >= 100:
            game_over = True
            writer.setposition(0, 0)
            writer.write("{} wins!".format(name2), align="center", font=("Arial", FONT_SIZE, "bold"))
    # Wait for the user to click before closing the window (leave this as the last line of main).
    screen.exitonclick()


def roll_die( tom, name, current_score ):
    """Rolls the die to produce a value between 1 and 6

    :param turtle.Turtle tom: The turtle to be pushed to the draw die function
    :param str name: The name of the user who is rolling
    :param int current_score: The current score of the player rolling the die
    :return: The score of the turn
    :rtype: int
    """
    turn_done = False
    score = 0
    roll_number = 0
    while not turn_done:  # Creates a while loop to run a turn
        die_value = random.randint(1, 6)  # Returns a random integer between 1 and 6 for the die value
        row_number = int(roll_number / 8) + 1

        # if roll_number < 8:  # Draws the first line of dice
        draw_die( tom, die_value, - (WIDTH / 2) + MARGIN + ((MARGIN + SQUARE_SIDE) * (roll_number % 8)), HEIGHT / 2 -
                  (row_number * (MARGIN + SQUARE_SIDE)))  # Positions the dice across the upper level

        # Checks for a game over scenario within the turn being played
        if current_score + score + die_value >= 100 and die_value != 1:
            easygui.msgbox("{} scores {}.".format(name, score + die_value), 'Pig!', 'OK')
            return score + die_value
        if die_value == 1:  # Checks for a turn ending scenario
            easygui.msgbox("{} scores 0.".format(name), title='Pig!', ok_button='OK')
            return 0
        else:
            roll_number += 1  # Upticks the roll number
            score += die_value  # Adds to the score of the turn
            if easygui.boolbox("{}'s turn score is {}. Roll or Hold?".format(name, score), title='Pig!',
                               choices=["Roll", "Hold"]) != 1:  # Asks the user whether or not to continue
                easygui.msgbox("{} scores {}.".format(name, score), title='Pig!', ok_button='OK')
                turn_done = True  # Ends the turn
    return score  # Returns the turn score to be added to the player's overall score


def draw_die( tom, die_value, x, y):
    """Draws the die on the screen.

    :param turtle.Turtle tom: The turtle to do the drawing
    :param int die_value: The value of the die rolled.
    :param int x: The x-coordinate of the lower left corner of the square
    :param int y: The y-coordinate of the lower left corner of the square
    """

    tom.pencolor("black")  # Makes the turtle's pen color black
    tom.fillcolor("red")  # Makes the turtle's fill color red

    # Move the turtle to the correct position
    tom.penup()
    tom.setposition( x, y )
    tom.pendown()

    # Draw the square.
    tom.begin_fill()
    for _ in range( 4 ):
        tom.forward( (WIDTH - (9 * MARGIN)) / 8 )
        tom.left( 90 )
    tom.end_fill()

    tom.fillcolor("black")  # Makes the turtle's fill color black for the pips
    tom.penup()
    if die_value % 2 == 1:  # Checks to see if the number rolled is odd
        tom.setposition( x + SQUARE_SIDE / 2, y + (SQUARE_SIDE / 2))  # Sets the position for the center pip
        tom.dot( PIP_SIZE, "black")
    if die_value != 1:  # Checks if the number rolled is not 1
        # Sets the position for the upper-left pip
        tom.setposition( x + 3 * PIP_SIZE / 2, y + SQUARE_SIDE - (3 * PIP_SIZE / 2))
        tom.dot(PIP_SIZE, "black")
        # Sets the position for the lower-right pip
        tom.setposition( x + SQUARE_SIDE - (3 * PIP_SIZE / 2), y + 3 * PIP_SIZE / 2)
        tom.dot(PIP_SIZE, "black")
    if die_value > 3:  # Check if the number rolled is greater than 3
        # Sets the position for the lower-left pip
        tom.setposition( x + 3 * PIP_SIZE / 2, y + 3 * PIP_SIZE / 2)
        tom.dot(PIP_SIZE, "black")
        # Sets the position for the upper-right pip
        tom.setposition( x + SQUARE_SIDE - (3 * PIP_SIZE / 2), y + SQUARE_SIDE - (3 * PIP_SIZE / 2))
        tom.dot(PIP_SIZE, "black")
    if die_value == 6:  # Checks if the number rolled is a six
        # Sets the position for the center-left pip
        tom.setposition( x + 3 * PIP_SIZE / 2, y + (SQUARE_SIDE / 2))
        tom.dot(PIP_SIZE, "black")
        # Sets the position for the center-right pip
        tom.setposition( x + SQUARE_SIDE - (3 * PIP_SIZE / 2), y + (SQUARE_SIDE / 2))
        tom.dot(PIP_SIZE, "black")
    tom.hideturtle()  # Hides the turtle after drawing is complete


def turtle_setup():
    """Setup the turtle environment with a screen and two turtles, one for drawing and one for writing.

    Using separate turtles for drawing and writing makes it easy to clear one or the other by
    doing artist.clear() or writer.clear() to clear only the drawing or writing, respectively.

    :return: The screen, a drawing turtle, and a writing turtle.
    :rtype: (turtle.Screen, turtle.Turtle, turtle.Turtle)
    """
    # Create the turtle graphics screen and set a few basic properties.
    screen = turtle.Screen()
    screen.setup( WIDTH, HEIGHT, MARGIN, MARGIN )
    screen.bgcolor( "SkyBlue" )

    # Create two turtles, one for drawing and one for writing.
    artist = turtle.Turtle()
    writer = turtle.Turtle()

    # Change the artist turtle's shape so the artist and writer are distinguishable.
    artist.shape( "turtle" )

    # Make the animation as fast as possible and hide the turtles.
    if DRAW_FAST:
        screen.delay( 0 )
        artist.hideturtle()
        artist.speed( "fastest" )
        writer.hideturtle()
        writer.speed( "fastest" )

    # Set a few properties of the writing turtle useful since it will only be writing.
    writer.setheading( 90 )   # Straight up, which makes it look sort of like a cursor.
    writer.penup()            # A turtle's pen does not have to be down to write text.
    writer.setposition( 0, HEIGHT // 2 - FONT_SIZE * 2 )  # Centered at top of the screen.

    return screen, artist, writer


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()
