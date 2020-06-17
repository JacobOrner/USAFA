"""CS 210, Introduction to Programming, Fall 2015, Jacob Orner.

Instructor: Dr. Bower

Documentation: I used this website http://stackoverflow.com/questions/11594605/python-excepting-input-only-if-in-range
to base my while loop of off which only allowed a certain range of numbers to be input as the percentage. I also used
this website http://stackoverflow.com/questions/10677350/convert-float-to-comma-separated-string to find how to properly
format the numbers to be printed on the screen.
"""

import turtle
import math

# Define several useful constants to be used by the Turtle graphics.
WIDTH = 960              # Usually 720, 960, 1024, 1280, 1600, or 1920.
HEIGHT = WIDTH * 9 / 16  # Produces the eye-pleasing 16:9 HD aspect ratio.
MARGIN = 32              # Somewhat arbitrary value, but it looks nice.
FONT_SIZE = 16           # Somewhat arbitrary value, but it looks nice.
DRAW_FAST = False        # Set to True for fast, stealthy turtles.
SQUARE_SIDE = (WIDTH - (4 * MARGIN)) // 3  # Defines the length of the sides of the square


def main():
    """Main program to run the program, thus creating fuel gauges, asking the user for a fill percentage, drawing a line
     at the percentage level, and calculating and displaying the area underneath the level for each respective shape of
     the gauges."""
    # Create the turtle screen and two turtles (leave this as the first line of main).
    screen, artist, writer = turtle_setup()

    # Write "Fuel Gauges" on the top of the screen
    writer.write( "Fuel Gauges", align="center", font=( "Arial", FONT_SIZE, "bold" ) )

    # Draw the shapes
    draw_square( artist, (-WIDTH / 2) + MARGIN, -SQUARE_SIDE / 2, SQUARE_SIDE)
    draw_circle( artist, 0, -SQUARE_SIDE / 2, SQUARE_SIDE / 2)
    draw_triangle( artist, (HEIGHT / 4) + MARGIN, -SQUARE_SIDE / 2, SQUARE_SIDE)

    # Initiates the boolean percentage_good
    percentage_good = False

    # Ask the user what percentage the tanks will be filled to.
    while not percentage_good:  # Creates a while loop to continue asking for a valid percentage
        try:
            percentage = int(screen.numinput( "Input", "Enter fill percentage:", 200, 30, 500 ))
        except ValueError:
            print("That is not a number")  # If a number is not entered, the user will be prompted to enter a number
        else:
            if 50 <= percentage <= 95:  # Checks to ensure the percentage value is in the correct range
                break
            else:
                print("Out of range. Try again.")

    # Calculates the angle of the central angle in the circle
    theta = 2 * (math.acos(((percentage - 50) / 100) * SQUARE_SIDE / (SQUARE_SIDE / 2)))

    # Calculates the distance inside the circle
    chord = math.sqrt(math.pow(SQUARE_SIDE / 2, 2) - math.pow(SQUARE_SIDE * (percentage - 50) / 100, 2)) * 2

    # Calculates the distance from the edge of the other shapes to the circle
    distance_from_circle = MARGIN + ((SQUARE_SIDE - chord) / 2)

    # Draws the lines on the shapes
    artist.color("red")
    artist.penup()
    artist.setposition((-WIDTH / 2) + MARGIN, SQUARE_SIDE * ((percentage - 50) / 100))
    artist.left(90)  # Orients the turtle to face the correct direction
    artist.pendown()
    artist.forward(SQUARE_SIDE)  # Draws the line across the square
    artist.penup()
    artist.forward(distance_from_circle)  # Moves to the left edge of the circle
    artist.pendown()
    artist.forward(chord)  # Draws the line across the circle
    artist.penup()
    artist.forward(distance_from_circle - 2)  # Moves to the left edge of the triangle
    artist.pendown()
    artist.forward(((100 - percentage) / 100) * SQUARE_SIDE)  # Draws the line across the triangle
    artist.hideturtle()

    # Calculates the area under the fuel lines
    square_area = (SQUARE_SIDE * SQUARE_SIDE * (percentage / 100))
    circle_area = (pow(SQUARE_SIDE / 2, 2) * math.pi) - (pow((SQUARE_SIDE / 2), 2) / 2 * (theta - math.sin(theta)))
    triangle_area = (pow(SQUARE_SIDE, 2) / 2) - (pow(SQUARE_SIDE - (SQUARE_SIDE * (percentage / 100)), 2) / 2)

    # Prints the area of the tanks
    writer.setposition(-(SQUARE_SIDE + MARGIN), -SQUARE_SIDE / 2 - MARGIN)
    writer.write("{:,.2f}".format(square_area), align="center", font=( "Arial", FONT_SIZE, "bold" ) )
    writer.setposition(0, -SQUARE_SIDE / 2 - MARGIN)
    writer.write("{:,.2f}".format(circle_area), align="center", font=( "Arial", FONT_SIZE, "bold") )
    writer.setposition((MARGIN + HEIGHT / 2), -HEIGHT / 4 - MARGIN)
    writer.write("{:,.2f}".format(triangle_area), align="center", font=( "Arial", FONT_SIZE, "bold") )
    writer.hideturtle()

    # Wait for the user to click before closing the window (leave this as the last line of main).
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


def draw_triangle( tom, x, y, size ):
    """Use the given turtle to draw a triangle with one corner at coordinate (x,y).

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
    tom.forward( size )
    tom.left( 135 )
    tom.forward( math.sqrt((size * size) + (size * size)))
    tom.left( 135 )
    tom.forward( size )


def draw_circle( tom, x, y, size ):
    """Use the given turtle to draw a circle with one corner at coordinate (x,y).

    Note: The orientation of the circle is dependent on the heading of the turtle.
    If the turtle's heading is zero, the (x,y) coordinate is the bottom of the circle.

    :param turtle.Turtle tom: The turtle to do the drawing.
    :param int x: The x-coordinate of one corner of the circle.
    :param int y: The y-coordinate of one corner of the circle.
    :param int size: The length of one side of the circle.
    """
    # Lift the pen and move to the indicated position.
    tom.penup()
    tom.setposition( x, y )
    tom.pendown()

    # Draw the circle.
    tom.circle(size)


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
