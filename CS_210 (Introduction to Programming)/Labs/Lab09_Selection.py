"""CS 210, Introduction to Programming, Fall 2015, _YOUR_NAME_HERE_.

Instructor: Dr. Bower / Col Gibson / LtCol Harder / LtCol (Ret) Christman

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

import easygui
import math
import random
import turtle

# Define several useful constants to be used by the Turtle graphics.
WIDTH = 960               # Usually 720, 960, 1024, 1280, 1600, or 1920.
HEIGHT = WIDTH * 9 // 16  # Produces the eye-pleasing 16:9 HD aspect ratio.
MARGIN = WIDTH // 30      # Somewhat arbitrary value, but it looks nice.
FONT_SIZE = MARGIN // 2   # Somewhat arbitrary value, but it looks nice.
DRAW_FAST = True          # Set to True for fast, non-animated turtle movement.


def main():
    """Main program to test solutions for each problem."""
    # Print the docstring at the top of the file so your instructor can see your name.
    print( __doc__ )

    # Call each individual exercise; comment/un-comment these lines as you work.
    # exercise1()
    # exercise2()
    # exercise3()
    # exercise4()
    # exercise5()
    # exercise6()
    exercise7()


def exercise1():
    """Interact with the user and test the even_odd function."""
    # TODO 1b: Write code to use the even_odd function as described in the lab document.
    num = easygui.integerbox('Enter an integer', ' ', '', 0, 2 ** 31)
    easygui.msgbox(msg="The number {} is {}".format(num, even_odd(num)))


# TODO 1a: In the space below, write the even_odd function as described in the lab document.
def even_odd( number ):
    """Takes a number in and returns a string saying whether it is even or odd

    :param int number: The number entered by the user
    :return: A string stating whether number was even or odd
    :rtype: string
    """
    if number % 2 == 0:
        return "even"
    if number % 1 == 0:
        return "odd"


def exercise2():
    """Interact with the user and test the pass_fail function."""
    # TODO 2b: Write code to use the pass_fail function as described in the lab document.
    num = easygui.integerbox('Enter score:', ' ', '', 0, 100)
    easygui.msgbox(msg="{} earns a grade of {}".format(num, pass_fail(num)))


# TODO 2a: In the space below, write the pass_fail function as described in the lab document.
def pass_fail( num ):
    """Determines whether the number is a passing or failing grade

    param: num: The number grade being determined
    :return: Returns a string stating whether the grade is a pass or fail
    :rtype: string
    """

    if num >= 70:
        return "Pass"
    else:
        return "Fail"


def exercise3():
    """Interact with the user and test the residence_hall function."""
    # TODO 3b: Write code to use the residence_hall function as described in the lab document.
    squad = easygui.integerbox('Enter squad number:', ' ', '', 1, 40)
    easygui.msgbox(msg="Squad {} lives in {}".format(squad, residence_hall(squad)))


# TODO 3a: In the space below, write the residence_hall function as described in the lab document.
def residence_hall( squad ):
    """Determines the residence hall depending on the squad entered.

    :param: squad: Gives the squad number
    :return: The name of the hall that squad lives in
    rtype: string
    """

    if squad > 22:
        return "Sijan"
    else:
        return "Vandy"

def exercise4():
    """Interact with the user and test the days_in_year function."""
    # TODO 4b: Write code to use the days_in_year function as described in the lab document.
    year = easygui.integerbox('Enter year:', ' ', '', 0, 2 ** 31)
    easygui.msgbox(msg="The year {} has {} days".format(year, days_in_year(year)))

# TODO 4a: In the space below, write the days_in_year function as described in the lab document.
def days_in_year( year ):
    """Calculates how many days are in a given year.

    :param year: The year to be determined
    :return days: The number of days in that year
    :rtype: int
    """
    if year % 4 == 0:
        return 366
    else:
        return 365

def exercise5():
    """Interact with the user and test the count_multiples function."""
    # TODO 5b: Write code to use the count_multiples function as described in the lab document.
    start = easygui.integerbox('Enter start value:', ' ', '', 0, 2 ** 31)
    stop = easygui.integerbox('Enter stop value:', ' ', '', start, 2 ** 31)
    divisor = easygui.integerbox('Enter divisor value:', ' ', '', 0, 2 ** 31)
    result = count_multiples(start, stop, divisor)

    easygui.msgbox(msg="There are {} multiples of {} in the range [{},{}]".format(result, divisor, start, stop))


# TODO 5a: In the space below, write the count_multiples function as described in the lab document.
def count_multiples( start, stop, divisor):
    """Counts the mutiples inclusively of the divisor within the stop and start parameters.

    :param start: The number the counting begins at
    :param stop: The number the counting ends with
    :param divisor: The number whose multiples are to be counted
    :return count: The number of multiples in the given range
    :rtype: int
    """
    count = 0
    for num in range(start, stop + 1):
        if num % divisor == 0:
            count +=1

    return count
# Define a random size box/target in a random location for use in the next exercise.
#      ___   ___     _  _  ___ _____    __  __  ___  ___ ___ _____   __
#     |   \ / _ \   | \| |/ _ \_   _|  |  \/  |/ _ \|   \_ _| __\ \ / /
#     | |) | (_) |  | .` | (_) || |    | |\/| | (_) | |) | || _| \ V /
#     |___/ \___/   |_|\_|\___/ |_|    |_|  |_|\___/|___/___|_|   |_|
#  _____ _  _ ___ ___ ___    ___  ___ ___ ___ _  _ ___ _____ ___ ___  _  _ ___
# |_   _| || | __/ __| __|  |   \| __| __|_ _| \| |_ _|_   _|_ _/ _ \| \| / __|
#   | | | __ | _|\__ \ _|   | |) | _|| _| | || .` || |  | |  | | (_) | .` \__ \
#   |_| |_||_|___|___/___|  |___/|___|_| |___|_|\_|___| |_| |___\___/|_|\_|___/
#
BOX_W = random.randint( WIDTH // 8, WIDTH // 4 )    # The width of the box/target.
BOX_H = random.randint( HEIGHT // 8, HEIGHT // 4 )  # The height of the box/target.
# The x-coordinate of the lower-right corner of the box/target.
BOX_X = random.randint( -WIDTH // 2 + MARGIN, WIDTH // 2 - BOX_W - MARGIN )
# The y-coordinate of the lower-right corner of the box/target.
BOX_Y = random.randint( -HEIGHT // 2 + MARGIN, HEIGHT // 2 - BOX_H - MARGIN )


def exercise6():
    """Use the screen and turtle defined below to solve the given exercise."""
    #  ___   ___     _  _  ___ _____    __  __  ___  ___ ___ _____   __
    # |   \ / _ \   | \| |/ _ \_   _|  |  \/  |/ _ \|   \_ _| __\ \ / /
    # | |) | (_) |  | .` | (_) || |    | |\/| | (_) | |) | || _| \ V /
    # |___/ \___/   |_|\_|\___/ |_|    |_|  |_|\___/|___/___|_|   |_|
    #  _____ _  _ ___ ___    ___ _   _ _  _  ___ _____ ___ ___  _  _
    # |_   _| || |_ _/ __|  | __| | | | \| |/ __|_   _|_ _/ _ \| \| |
    #   | | | __ || |\__ \  | _|| |_| | .` | (__  | |  | | (_) | .` |
    #   |_| |_||_|___|___/  |_|  \___/|_|\_|\___| |_| |___\___/|_|\_|
    #
    # Create the turtle screen and two turtles (leave this as the first line).
    screen, artist, writer = turtle_setup()

    # Give the user some instructions.
    writer.write( "Try to click in the box...", align="center", font=( "Arial", FONT_SIZE, "bold" ) )

    # Draw a box/target in the middle of the screen.
    artist.color( "blue" )
    artist.penup()
    artist.setposition( BOX_X, BOX_Y )
    artist.pendown()
    artist.begin_fill()
    for _ in range( 2 ):
        artist.forward( BOX_W )
        artist.left( 90 )
        artist.forward( BOX_H )
        artist.left( 90 )
    artist.end_fill()

    # Tell the screen to call the click() function when the user clicks on the screen.
    screen.onclick( box_click )

    # Rather than exitonclick(), enter the main event loop to listen for clicks.
    screen.mainloop()


def box_click( x, y ):
    """Display a Hit or Miss message if the (x,y) coordinate is in or out of the box drawn in exercise6().

    Note: The "screen.onclick( box_click )" function call in exercise6() results in
    this function being called automatically when the turtle screen is clicked.

    :param int x: The x-coordinate of the click.
    :param int y: The y-coordinate of the click.
    """
    # TODO 6: Replace True in the line below with a single condition to display the appropriate message.
    # TODO 6: Use the existing definitions of BOX_X, BOX_Y, BOX_W, and BOX_H in your selection statement.
    if BOX_X < x < BOX_X+BOX_W and BOX_Y < y < BOX_Y+BOX_H:
        easygui.msgbox( "Hit!", "Result" )
    else:
        easygui.msgbox( "Miss", "Result" )


# Define random location/size for the earth and moon for use in the next exercise.
#      ___   ___     _  _  ___ _____    __  __  ___  ___ ___ _____   __
#     |   \ / _ \   | \| |/ _ \_   _|  |  \/  |/ _ \|   \_ _| __\ \ / /
#     | |) | (_) |  | .` | (_) || |    | |\/| | (_) | |) | || _| \ V /
#     |___/ \___/   |_|\_|\___/ |_|    |_|  |_|\___/|___/___|_|   |_|
#  _____ _  _ ___ ___ ___    ___  ___ ___ ___ _  _ ___ _____ ___ ___  _  _ ___
# |_   _| || | __/ __| __|  |   \| __| __|_ _| \| |_ _|_   _|_ _/ _ \| \| / __|
#   | | | __ | _|\__ \ _|   | |) | _|| _| | || .` || |  | |  | | (_) | .` \__ \
#   |_| |_||_|___|___/___|  |___/|___|_| |___|_|\_|___| |_| |___\___/|_|\_|___/
#
EARTH_R = random.randint( WIDTH // 16, WIDTH // 8 )
EARTH_X = random.randint( -WIDTH // 2 + EARTH_R + MARGIN, -EARTH_R )  # Left half of the screen.
EARTH_Y = random.randint( -HEIGHT // 2 + EARTH_R + MARGIN, HEIGHT // 2 - EARTH_R - MARGIN )
MOON_R = int( EARTH_R * 0.2726 )  # The moon is just over a quarter of the size of earth.
MOON_X = random.randint( 0, WIDTH // 2 - MOON_R - MARGIN )  # Right half of the screen.
MOON_Y = random.randint( -HEIGHT // 2 + MOON_R + MARGIN, HEIGHT // 2 - MOON_R - MARGIN )


def exercise7():
    """Use the screen and turtle defined below to solve the given exercise."""
    #  ___   ___     _  _  ___ _____    __  __  ___  ___ ___ _____   __
    # |   \ / _ \   | \| |/ _ \_   _|  |  \/  |/ _ \|   \_ _| __\ \ / /
    # | |) | (_) |  | .` | (_) || |    | |\/| | (_) | |) | || _| \ V /
    # |___/ \___/   |_|\_|\___/ |_|    |_|  |_|\___/|___/___|_|   |_|
    #  _____ _  _ ___ ___    ___ _   _ _  _  ___ _____ ___ ___  _  _
    # |_   _| || |_ _/ __|  | __| | | | \| |/ __|_   _|_ _/ _ \| \| |
    #   | | | __ || |\__ \  | _|| |_| | .` | (__  | |  | | (_) | .` |
    #   |_| |_||_|___|___/  |_|  \___/|_|\_|\___| |_| |___\___/|_|\_|
    #
    # Create the turtle screen and two turtles (leave this as the first line).
    screen, artist, writer = turtle_setup()

    # Give the user some instructions.
    writer.write( "Try to click on the Earth or the Moon...", align="center", font=( "Arial", FONT_SIZE, "bold" ) )

    # Draw a blue dot for the earth and a silver dot for the moon.
    artist.penup()
    artist.color( "Blue" )
    artist.setposition( EARTH_X, EARTH_Y )
    artist.dot( EARTH_R * 2 )
    artist.color( "LightGray" )
    artist.setposition( MOON_X, MOON_Y )
    artist.dot( MOON_R * 2 )

    # Tell the screen to call the click() function when the user clicks on the screen.
    screen.onclick( planet_click )

    # Rather than exitonclick(), enter the main event loop to listen for clicks.
    screen.mainloop()


def planet_click( x, y ):
    """Display a Hit or Miss message if the (x,y) coordinate hit the earth or moon drawn in exercise7().

    Note: The "screen.onclick( planet_click )" function call in exercise7() results in
    this function being called automatically when the turtle screen is clicked.

    :param int x: The x-coordinate of the click.
    :param int y: The y-coordinate of the click.
    """
    # TODO 7: Replace True in the line below with a single condition to display the appropriate message.
    # TODO 7: Use the existing definitions of EARTH_X, EARTH_Y, EARTH_R, MOON_X, MOON_Y, and MOON_R.
    if (EARTH_X-EARTH_R/2< x < EARTH_X+EARTH_R/2 and EARTH_Y-EARTH_R/2< y < EARTH_Y+EARTH_R/2)or(MOON_X-MOON_R/2 < x < MOON_X+MOON_R/2 and MOON_Y-MOON_R/2< y < MOON_Y+MOON_R/2 ):
        easygui.msgbox( "Hit!", "Result" )
    else:
        easygui.msgbox( "Miss", "Result" )


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
