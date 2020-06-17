"""CS 210, Introduction to Programming, Fall 2015, _YOUR_NAME_HERE_.

Instructor: Dr. Bower / Col Gibson / LtCol Harder / LtCol (Ret) Christman

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

import math
import random
import turtle

# Define several useful constants to be used by the Turtle graphics.
WIDTH = 960               # Usually 720, 960, 1024, 1280, 1600, or 1920.
HEIGHT = WIDTH * 9 // 16  # Produces the eye-pleasing 16:9 HD aspect ratio.
MARGIN = WIDTH // 30      # Somewhat arbitrary value, but it looks nice.
FONT_SIZE = MARGIN // 2   # Somewhat arbitrary value, but it looks nice.
DRAW_FAST = False         # Set to True for fast, non-animated turtle movement.

COLORS = [ "red", "green", "blue", "yellow", "cyan", "magenta", "white", "black" ]


def main():
    """Main program to test solutions for each exercise."""
    # Print the docstring at the top of the file so your instructor can see your name.
    print( __doc__ )

    # Call each individual exercise; comment/un-comment these lines as you work.
    # exercise0()
    # exercise1()
    exercise2()


# TODO 0a: Read, discuss, and understand the following code.
class Point:
    """Point class for representing (x,y) coordinates."""

    def __init__( self ):
        """Create a new Point with random x and y values."""
        # Uses random.randint to create values within the margins of the turtle screen.
        self.x = random.randint( -WIDTH // 2 + MARGIN, WIDTH // 2 - MARGIN )
        self.y = random.randint( -HEIGHT // 2 + MARGIN, HEIGHT // 2 - MARGIN )


def exercise0():
    """Demonstrate a Point class."""
    # Create the turtle screen and two turtles (leave this as the first line).
    screen, artist, writer = turtle_setup()

    # TODO 0b: Read, discuss, and understand the following code.
    points = []  # An empty list to be filled with Point objects.
    for _ in range( 8 ):
        p = Point()  # Calls the Point object's __init__ method to create a point object.
        points.append( p )  # Appends the point to the list of point objects.

    # Loop through the list of Point objects and use the artist turtle to draw them.
    for p in points:
        # Have the writer turtle display the Point object's x and y values.
        writer.clear()
        writer.write( "Moving to point ({}, {})...".format( p.x, p.y ),
                      align="center", font=( "Times", FONT_SIZE, "bold" ) )

        # Use the Point object's x and y values to set the heading.
        artist.setheading( artist.towards( p.x, p.y ) )
        # Use the Point object's x and y values to move the turtle.
        artist.setposition( p.x, p.y )
        # Draw a dot at the point.
        artist.dot( 4 )

    # Put things back when finished.
    writer.clear()
    artist.home()
    # Wait for the user to click before closing the window (leave this as the last line).
    screen.exitonclick()


# TODO 1a: In the space below this comment, write the class as described in the lab document.
class Spot:
    """Spot class for representing (x,y) coordinates."""

    def __init__( self ):
        """Create a new Point with random x and y values."""
        # Uses random.randint to create values within the margins of the turtle screen.
        self.x = random.randint( -WIDTH // 2 + MARGIN, WIDTH // 2 - MARGIN )
        self.y = random.randint( -HEIGHT // 2 + MARGIN, HEIGHT // 2 - MARGIN )
        self.color = COLORS[random.randint(0, 7)]


def exercise1():
    """Test a Spot class."""
    # Create the turtle screen and two turtles (leave this as the first line).
    screen, artist, writer = turtle_setup()

    # TODO 1b: In the space below, use the class as described in the lab document.
    spots = []  # An empty list to be filled with Point objects.
    for _ in range( 8 ):
        s = Spot()  # Calls the Point object's __init__ method to create a point object.
        spots.append( s )  # Appends the point to the list of point objects.

    # Loop through the list of Point objects and use the artist turtle to draw them.
    for s in spots:
        # Have the writer turtle display the Point object's x and y values.
        writer.clear()
        writer.write( "Moving to point ({}, {})...".format( s.x, s.y ),
                      align="center", font=( "Times", FONT_SIZE, "bold" ) )

        # Use the Point object's x and y values to set the heading.
        artist.setheading( artist.towards( s.x, s.y ) )
        # Use the Point object's x and y values to move the turtle.
        artist.setposition( s.x, s.y )
        # Draw a dot at the point.
        artist.dot( 32, s.color)

    # Put things back when finished.
    writer.clear()
    artist.home()
    # Wait for the user to click before closing the window (leave this as the last line).
    screen.exitonclick()


# TODO 2a: In the space below this comment, write the class as described in the lab document.
class Raindrop:
    """Raindrop class to representing (x,y) coordinates and colors of raindrops"""

    def __init__( self ):
        """Create a new Point with random x and y values."""
        # Uses random.randint to create values within the margins of the turtle screen.
        self.x = random.randint( -WIDTH // 2 + MARGIN, WIDTH // 2 - MARGIN )
        self.y = random.randint( -HEIGHT // 2 + MARGIN, HEIGHT // 2 - MARGIN )
        self.radius = random.randint(MARGIN, MARGIN * 2)


def exercise2():
    """Test a Raindrop class."""
    # Create the turtle screen and two turtles (leave this as the first line).
    screen, artist, writer = turtle_setup()

    # TODO 2b: In the space below, use the class as described in the lab document.
    raindrops = []  # An empty list to be filled with Point objects.
    stop = False
    while not stop:
        r = Raindrop()  # Calls the Point object's __init__ method to create a point object.
        raindrops.append( r )  # Appends the point to the list of point objects.

        # Have the writer turtle display the Point object's x and y values.
        writer.clear()
        writer.write( "Moving to point ({}, {})...".format( r.x, r.y ),
                      align="center", font=( "Times", FONT_SIZE, "bold" ) )

        for drop in raindrops:
            if math.hypot((r.x - drop.x), (r.y - drop.y)) < (r.radius + drop.radius):
                r.radius = math.sqrt(math.pow(r.radius, 2) + math.pow(drop.radius, 2))

        # Use the Point object's x and y values to set the heading.
        artist.setheading( artist.towards( r.x, r.y ) )
        # Use the Point object's x and y values to move the turtle.
        artist.setposition( r.x, r.y )
        # Draw a dot at the point.
        artist.dot( r.radius * 2, "blue")





    # Put things back when finished.
    writer.clear()
    artist.home()
    # Wait for the user to click before closing the window (leave this as the last line).
    screen.exitonclick()


def turtle_setup():
    """Setup the turtle environment with a screen and two turtles, one for drawing and one for writing.

    Using separate turtles for drawing and writing makes it easy to clear one or the other by
    doing artist.clear() or writer.clear() to clear only the drawing or writing, respectively.

    :return: The screen, a drawing turtle, and a writing turtle.
    :rtype: (turtle.Screen, turtle.Turtle, turtle.Turtle)
    """
    #  ___   ___     _  _  ___ _____    __  __  ___  ___ ___ _____   __
    # |   \ / _ \   | \| |/ _ \_   _|  |  \/  |/ _ \|   \_ _| __\ \ / /
    # | |) | (_) |  | .` | (_) || |    | |\/| | (_) | |) | || _| \ V /
    # |___/ \___/   |_|\_|\___/ |_|    |_|  |_|\___/|___/___|_|   |_|
    #  _____ _  _ ___ ___    ___ _   _ _  _  ___ _____ ___ ___  _  _
    # |_   _| || |_ _/ __|  | __| | | | \| |/ __|_   _|_ _/ _ \| \| |
    #   | | | __ || |\__ \  | _|| |_| | .` | (__  | |  | | (_) | .` |
    #   |_| |_||_|___|___/  |_|  \___/|_|\_|\___| |_| |___\___/|_|\_|
    #
    # Create the turtle graphics screen and set a few basic properties.
    screen = turtle.Screen()
    screen.setup( WIDTH, HEIGHT, MARGIN, MARGIN )
    screen.bgcolor( "SkyBlue" )

    # Create two turtles, one for drawing and one for writing.
    artist = turtle.Turtle()
    writer = turtle.Turtle()

    # Change the artist turtle's shape so the artist and writer are distinguishable.
    artist.shape( "turtle" )
    # Lift the artist's pen and slow it down to see the movements from object to object.
    artist.penup()
    artist.speed( "slowest" )

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
