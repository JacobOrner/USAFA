"""CS 210, Introduction to Programming, Fall 2015, _YOUR_NAME_HERE_.

Instructor: Dr. Bower / Col Gibson / LtCol Harder / LtCol (Ret) Christman

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

# Import specific functions from the math library, just to demonstrate how to do it.
from math import atan2, sqrt, degrees
import easygui
import turtle
import math

# Define several useful constants to be used by the Turtle graphics.
WIDTH = 640              # A smaller window for this problem.
HEIGHT = WIDTH           # A square window for this problem.
MARGIN = 32              # Somewhat arbitrary value, but it looks nice.
FONT_SIZE = 16           # Somewhat arbitrary value, but it looks nice.
DRAW_FAST = False        # Set to True for fast, non-animated turtle movement.


def main():
    """Main program to test solutions for each problem."""
    # Print the docstring at the top of the file so your instructor can see your name.
    print( __doc__ )

    # Call each individual exercise; comment/un-comment these lines as you work.
    # exercise1()
    exercise2()
    # exercise3()


def exercise1():
    """Odd and Even Sums exercise."""
    # TODO 1c: Write code to use the sum_odds and sum_evens functions, as described in the lab document.
    num = easygui.integerbox(msg='Enter an integer', title=' ', default='', lowerbound=0, upperbound=99)

    odd_sum = sum_odds( num )
    even_sum = sum_evens( num )

    easygui.msgbox(msg='n = num {} \nsum of odds: {} \nsum of evens: {} '.format(num, odd_sum, even_sum))


# TODO 1a: In the space below, write the sum_odds function as described in the lab document.
def sum_odds( num ):
    """Calculates the sum of the odd numbers between 1 and the given number inclusively

    :param int num: The number to be used to calculate the sum
    :return: The sum of the odds between the number and 1
    :rtype: int
    """
    result = 0

    if num % 2 == 0:
        num -= 1

    while num > 0:
        result += num
        num -= 2

    return result


# TODO 1b: In the space below, write the sum_evens function as described in the lab document.
def sum_evens( num ):
    """Calculates the sum of the even numbers between 1 and the given value inclusively

    :param int num: The number to be used to calculate the sum
    :return: The sum of the evens between num and 1
    :rtype: int
    """
    result = 0
    if num % 2 == 1:
        num -= 1

    while num > 0:
        result += num
        num -= 2

    return result


def exercise2():
    """Summations exercise."""
    # TODO 2b: Write code to use the summation function, as described in the lab document.
    n = easygui.integerbox(msg='Enter an integer', title=' ', default='', lowerbound=0, upperbound=999)

    easygui.msgbox(msg='n = {}, summation(n,1) = {}, formula result = {} '.format(n, summation(n, 1), summation(n, 1)))
    easygui.msgbox(msg='n = {}, summation(n,2) = {}, formula result = {} '.format(n, summation(n, 2), summation(n, 2)))
    easygui.msgbox(msg='n = {}, summation(n,3) = {}, formula result = {} '.format(n, summation(n, 3), summation(n, 3)))


# TODO 2a: In the space below, write the summation function as described in the lab document.
def summation( n, exponent):
    """Calculates the sum using the accumulator pattern to find the summation

    :param int n: The number used in the summing
    :param int exponent: The exponent to be used in summation
    :return: The value of the summation
    :rtype: int
    """
    if exponent == 1:
        return n * (n + 1) / 2
    if exponent == 2:
        return n * (n + 1) * (2 * n + 1) / 6
    if exponent == 3:
        return pow((n * (n+1) / 2),2)

def exercise3():
    """Use the screen and turtle defined below to solve the given exercise."""
    # Create the turtle screen and two turtles (leave this as the first line).
    screen, artist, writer = turtle_setup()

    # TODO 3b: In the space below, write code to use the draw_inner_square function, as described in the lab document.
    # draw_square( artist, 100)
    # draw_inner_square( artist, 100, .4)

    # TODO 3d: In the space below, write code to use the draw_inner_squares function, as described in the lab document.
    artist.up()
    artist.right(90)
    artist.forward(300)
    artist.right(90)
    artist.forward(60)
    artist.left(180)
    artist.down()
    draw_square( artist, 300)
    draw_inner_squares( artist, 300, 2)
    artist.up()
    artist.forward(350)
    artist.right(90)
    artist.down()
    draw_square( artist, 100)
    draw_inner_square( artist, 100, 9)

    # TODO 3f: In the space below, write code to use the draw_art function, as described in the lab document.
    pass  # Remove the pass statement (and this comment) when writing your own code.

    # Wait for the user to click before closing the window (leave this as the last line).
    screen.exitonclick()


# TODO 3a: In the space below, write the draw_inner_square function as described in the lab document.
def draw_inner_square( artist, outer_size, percent ):
    """ Draws the inner square after calculating necessary values.
    :param turtle artist:
    :param int size:
    :param int percent:
    :return:
    """

    a = percent * outer_size
    b = outer_size - a
    inner_size = math.sqrt( a * a + b * b )
    theta = degrees(math.atan( a / b ))  # In Python, degrees( atan2( a, b ) )
    artist.setheading(90)
    artist.forward(a)
    artist.right(90 + theta)
    draw_square(artist, inner_size)
    print("270")
    artist.setheading(270)
    artist.forward(a)
    artist.setheading(90)
    print("lolol")


# TODO 3c: In the space below, write the draw_inner_squares function as described in the lab document.
def draw_inner_squares( artist, outer_size, squares ):
    """Draws the number of inner squares specified in the parameters and calculates how to draw them

    :param artist: The turtle drawing the squares
    :param outer_size: The size of the squares being drawn
    :param squares: The number of squares to be drawn within the original square
    :return:
    """
    percent = (outer_size / (squares + 1)) / outer_size
    for num in range(squares):
        draw_inner_square(artist, outer_size, percent)
        percent += percent
# TODO 3e: In the space below, write the draw_art function as described in the lab document.


# Leave this function below those written in steps 3a, 3c, and 3e.
def draw_square( art, size ):
    """Use the given turtle to draw a square with one corner at the turtle's current location.

    :param turtle.Turtle art: The turtle to do the drawing.
    :param int size: The length of one side of the square.
    """
    for _ in range( 4 ):
        art.forward( size )
        art.left( 90 )


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
