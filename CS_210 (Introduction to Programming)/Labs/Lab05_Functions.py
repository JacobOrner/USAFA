"""CS 210, Introduction to Programming, Fall 2015, Jacob Orner.

Instructor: Dr. Bower

Documentation: None.
"""

import math
import turtle

# Define several useful constants to be used by the Turtle graphics.
WIDTH = 960              # Usually 720, 960, 1024, 1280, 1600, or 1920.
HEIGHT = WIDTH * 9 / 16  # Produces the eye-pleasing 16:9 HD aspect ratio.
MARGIN = 32              # Somewhat arbitrary value, but it looks nice.
FONT_SIZE = 16           # Somewhat arbitrary value, but it looks nice.
DRAW_FAST = True        # Set to True for fast, stealthy turtles.


def main():
    """Main program to call each individual lab exercise."""
    # Print the docstring at the top of the file so your instructor can see your name.
    print( __doc__ )

    # Call each individual exercise; comment/un-comment these lines as you work.
    exercise1()
    exercise2()
    exercise3()
    exercise4()


def exercise1():
    """Use the draw_square function to draw the image shown.

    + - - - - - - + - - - - + - - - - - +
    |             |         |           |
    |             |    4    |           |
    |      6      |         |     5     |
    |             + - - - + +           |
    |             |       + + - - - - - +
    + - - - - - + +   3   |             |
    |           + + - - - +             |
    |     5     |         |      6      |
    |           |    4    |             |
    |           |         |             |
    + - - - - - - + - - - - + - - - - - +
    """
    # Create the turtle screen and two turtles (leave this as the first line).
    screen, artist, writer = turtle_setup()

    # Use the writer turtle to display a message at the top of the window.
    writer.write( "Square of Squares", align="center", font=( "Arial", FONT_SIZE, "bold" ) )

    # TODO 1: Delete the following two lines and draw the specified image using the draw_square function.
    draw_square( artist, -75, 60, 60 )
    draw_square( artist, -75, 10, 50)
    draw_square( artist, -25, 10, 40)
    draw_square( artist, 15, 10, 60)
    draw_square( artist, 25, 70, 50)
    draw_square( artist, -15, 80, 40)
    draw_square( artist, -15, 50, 30)
    # Wait for the user to click before closing the window (leave this as the last line).
    screen.exitonclick()


def draw_square( tom, x, y, size ):
    """Use the given turtle to draw a square with one corner at coordinate (x,y).

    Note: The orientation of the square is dependent on the heading of the turtle.
    If the turtle's heading is zero, the (x,y) coordinate is the lower-left corner.

    :param turtle.Turtle tom: The turtle to do the drawing.
    :param int x: The x-coordinate of one corner of the square.
    :param int y: The y-coordinate of one corner of the square.
    :param int size: The length of one side of the square.
    """
    # Lift the pen and move to the indicated position.
    tom.penup()
    tom.setposition( x, y )
    tom.pendown()

    # Draw the square.
    for _ in range( 4 ):
        tom.forward( size )
        tom.left( 90 )


def exercise2():
    """Use the draw_square function to draw seven squares equally spaced across the screen."""
    # Create the turtle screen and two turtles (leave this as the first line).
    screen, artist, writer = turtle_setup()

    # Use the writer turtle to display a message at the top of the window.
    writer.write( "Seven Squares", align="center", font=( "Arial", FONT_SIZE, "bold" ) )

    # TODO 2: Use the draw_square function to draw seven squares equally spaced across the screen.
    for num in range(7):
        draw_square(artist, (-WIDTH / 2 + (2 * num * (WIDTH / 14)) + WIDTH / 28), 0, 64)

    # Wait for the user to click before closing the window (leave this as the last line).
    screen.exitonclick()


def exercise3():
    """Use the draw_triangle function to draw a hexagram.

    http://www.wpclipart.com/education/geometry/hexagram.png
    """
    # Create the turtle screen and two turtles (leave this as the first line).
    screen, artist, writer = turtle_setup()

    # Use the writer turtle to display a message at the top of the window.
    writer.write( "Hexagram", align="center", font=( "Arial", FONT_SIZE, "bold" ) )

    # Use the turtle screen's numinput function to prompt the user for the size of the triangle.
    # The parameters are the dialog title, the message to show the user, the default value (200),
    # the minimum allowed value (30), and the maximum allowed value (500), respectively.
    size = int( screen.numinput( "Input", "Enter size of each triangle:", 200, 30, 500 ) )

    # TODO 3b: Use the draw_triangle function to draw the hexagram.
    draw_triangle( artist, -(size/2), -math.sqrt((size * size) - ((size / 2)*(size / 2)))/3, size)
    artist.up()
    artist.forward(size)
    artist.left(90)
    artist.forward(math.sqrt((size * size) - ((size / 2) * (size / 2))))
    artist.left(90)
    draw_triangle( artist, (size/2), math.sqrt((size * size) - ((size / 2) * (size / 2)))/3 , size)

    # Wait for the user to click before closing the window (leave this as the last line).
    screen.exitonclick()


# TODO 3a: Define a draw_triangle function below this comment, as specified in the lab document.
def draw_triangle( tom, x, y, size ):
    """Use the given turtle to draw a square with one corner at coordinate (x,y).

    Note: The orientation of the triangle is dependent on the heading of the turtle.
    If the turtle's heading is zero, the (x,y) coordinate is the lower-left corner.

    :param turtle.Turtle tom: The turtle to do the drawing.
    :param int x: The x-coordinate of one corner of the triangle.
    :param int y: The y-coordinate of one corner of the triangle.
    :param int size: The length of one side of the triangle.
    """
    # Lift the pen and move to the indicated position.
    tom.penup()
    tom.setposition( x, y )
    tom.pendown()

    # Draw the triangle.
    for _ in range( 3 ):
        tom.forward( size )
        tom.left( 120 )



def exercise4():
    """Draw a square and a triangle evenly spaced on the screen."""
    # Create the turtle screen and two turtles (leave this as the first line).
    screen, artist, writer = turtle_setup()

    # TODO 4: Use the draw_square and draw_triangle functions to draw a square and a triangle
    # TODO 4: evenly spaced on the screen, as described in the lab document.
    size = 400
    margin = (WIDTH-(2*size))/3
    draw_square( artist, -(size+(margin/2)), -(size/2), size )
    draw_triangle( artist, (margin/2), -(size/2), size)

    # Wait for the user to click before closing the window (leave this as the last line).
    screen.exitonclick()


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
