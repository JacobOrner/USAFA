"""CS 210, Introduction to Programming, Fall 2015, _YOUR_NAME_HERE_.

Instructor: Dr. Bower / Col Gibson / LtCol Harder / LtCol (Ret) Christman

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

import easygui
import random
import turtle


# Define several useful constants to be used by the Turtle graphics.
WIDTH = 960               # Usually 720, 960, 1024, 1280, 1600, or 1920.
HEIGHT = WIDTH * 9 // 16  # Produces the eye-pleasing 16:9 HD aspect ratio.
MARGIN = WIDTH // 30      # Somewhat arbitrary value, but it looks nice.
FONT_SIZE = MARGIN // 2   # Somewhat arbitrary value, but it looks nice.
DRAW_FAST = False         # Set to True for fast, non-animated turtle movement.


def main():
    """Main program to test solutions for each exercise."""
    # Print the docstring at the top of the file so your instructor can see your name.
    print( __doc__ )

    # Call each individual exercise; comment/un-comment these lines as you work.
    # exercise1()
    # exercise2()
    # exercise3()
    # exercise4()
    # exercise5()
    high_low()
    # turtle_race()


def exercise1():
    """Interact with the user and test the sum_odds and sum_evens functions."""
    # You _DO_NOT_ need to modify this code for Lab 10.
    n = easygui.integerbox( "Enter n:", "Input", lowerbound=0, upperbound=2 ** 31 )
    odd = sum_odds( n )
    even = sum_evens( n )
    easygui.msgbox( "n = {}\nsum of odds = {}\nsum of evens = {}".format( n, odd, even ) )


def sum_odds( n ):
    """Calculate and return the sum of the odd numbers between 1 and n, inclusive.

    :param int n: The upper bound of the series to sum.
    :return: The sum of the odd numbers between 1 and n, inclusive.
    :rtype: int
    """
    result = 0
    num = 1
    while num < n + 1:
        result += num
        num += 2
    return result


def sum_evens( n ):
    """Calculate and return the sum of the even numbers between 1 and n, inclusive.

    :param int n: The upper bound of the series to sum.
    :return: The sum of the even numbers between 1 and n, inclusive.
    :rtype: int
    """
    result = 0
    num = 0
    while num < n + 1:
        result += num
        num += 2
    return result


def exercise2():
    """Interact with the user and test the summation function."""
    # You _DO_NOT_ need to modify this code for Lab 10.
    n = easygui.integerbox( "Enter n:", "Input", lowerbound=0, upperbound=2 ** 31 )

    s = summation( n, 1 )
    f = n * ( n + 1 ) // 2
    easygui.msgbox( "n = {}, summation( n, 1 ) = {}, formula result = {}".format( n, s, f ) )

    s = summation( n, 2 )
    f = n * ( n + 1 ) * ( 2 * n + 1 ) // 6
    easygui.msgbox( "n = {}, summation( n, 2 ) = {}, formula result = {}".format( n, s, f ) )

    s = summation( n, 3 )
    f = ( n * ( n + 1 ) // 2 ) ** 2
    easygui.msgbox( "n = {}, summation( n, 3 ) = {}, formula result = {}".format( n, s, f ) )


def summation( n, exponent ):
    """Calculation and return the summation of the series 1**exponent + 2**exponent + ... + n**exponent.

    :param int n: The upper bound of the series to sum.
    :param int exponent: The exponent for each term in the series.
    :return: The summation of the series.
    :rtype: int
    """
    result = 0
    num = 1
    while num < n + 1:
        result += num ** exponent
        num += 1
    return result


def exercise3():
    """Interact with the user and test the count_multiples function."""
    # You _DO_NOT_ need to modify this code for Lab 10.
    start = easygui.integerbox( "Enter start value:", "Input", "", -2 ** 31, 2 ** 31 )
    stop = easygui.integerbox( "Enter stop value:", "Input", "", -2 ** 31, 2 ** 31 )
    step = easygui.integerbox( "Enter divisor value:", "Input", "", -2 ** 31, 2 ** 31 )
    easygui.msgbox( "There are {} multiples of {} in the range [{},{}].".format(
        count_multiples( start, stop, step ), step, start, stop ), "Result" )


def count_multiples( start, stop, divisor ):
    """Count and return the number of values between start and stop, inclusive, evenly divisible by divisor.

    :param int start: The start value for the range, inclusive.
    :param int stop: The stop value for the range, inclusive.
    :param int divisor: The divisor to be counted.
    :return: The number of values in the range [start, stop] evenly divisible by divisor.
    :rtype: int
    """
    count = 0
    num = start
    while num < stop + 1:
        if num % divisor == 0:
            count += 1
        num += 1
    return count


def exercise4():
    """Interact with the user and test the count_sevens function."""
    rolls = easygui.integerbox('How many 7s:', 'Input', '', 0, 2 ** 31)
    total = count_sevens( rolls )
    percent = rolls * 100 / total
    easygui.msgbox("{} out of {} rolls ({:.2f}%) were 7.".format(rolls, total, percent))


def count_sevens( rolls ):
    """Rolls the two dice the number of times inputted, returns statistics about the rolls needed to reach that number.
    :param rolls: The number of 7s to roll.

    :return: total: The total number of times the dice were rolled to reach the rolls specified
    :rtype: int
    """
    count = 0
    total = 0
    while count < rolls:
        if random.randint(1, 6) + random.randint(1, 6) == 7:
            count += 1
        total += 1
        if total >= 12 * rolls:
            return total

    return total


def exercise5():
    """Interact with the user and test the scorekeeper function."""
    player1 = easygui.enterbox('Enter first player name:', ' ', '')
    player2 = easygui.enterbox('Enter second player name:', ' ', '')
    score = easygui.integerbox('Enter required winning score:', '', '', 1, 2 ** 31)
    winner = scorekeeper( player1, player2, score)
    easygui.msgbox('{} wins!'.format(winner), '', 'OK')


def scorekeeper( name1, name2, win_score):
    """Keeps the score of the game and announces a winner once the score to win has been reached.

    :param name1:
    :param name2:
    :param win_score:
    :return:
    """
    score1 = 0
    score2 = 0
    while (score1 < win_score) and (score2 < win_score):
        scorer = easygui.buttonbox("{}: {}\n vs.\n {}: {}\n Who wins current point?"
                                   .format(name1, score1, name2, score2), 'Input', [name1, name2])
        if scorer == name1:
            score1 += 1
        if scorer == name2:
            score2 += 1
    if score1 == win_score:
        return name1
    if score2 == win_score:
        return name2


def high_low():
    """Implement the number guessing game High Low."""
    # Create a random number in the range [1,100] for the user to guess.
    secret_number = 37  # random.randint( 1, 100 )
    # For debugging purposes only, it's nice to know the secret.
    print( secret_number, flush=True )  # Add the flush to ensure there's no buffering.
    count = 0
    guess = 0
    low = 0
    high = 100
    # TODO 6: Implement the High Low guessing game as described in the lab document.
    while count < 7:
        guess = easygui.integerbox( "Enter a guess between {} and {}:".format( low, high), "Input", "", 1, 100 )
        count += 1
        if guess == secret_number:
            break
        if guess > secret_number:
            result = "high"
            high = guess
        else:
            result = "low"
            low = guess
        easygui.msgbox( "Your guess of {} is too {}.".format( guess, result ), "Result" )
    if guess == secret_number:
        easygui.msgbox("You win! You guessed {} in {} guesses".format( secret_number, count ), "Result")
    else:
        easygui.msgbox("You Lose :( The secret number was {}".format( secret_number), "Result")



def turtle_race():
    """Implement a simple turtle race from left to right across the screen."""
    # Create the turtle screen and two turtles (leave this as the first line).
    screen, artist, writer = turtle_setup()

    # Rename the artist turtle and move her to the left, above the x-axis.
    flojo = artist  # Flo-Jo, https://en.wikipedia.org/wiki/Florence_Griffith_Joyner
    flojo.shape( "turtle" )
    flojo.color( "blue" )  # USA!
    flojo.penup()
    flojo.setposition( -WIDTH // 2 + MARGIN, MARGIN * 2 )
    flojo.setheading( 0 )
    flojo.pendown()

    # Create a new turtle, below the x-axis, to race against the turtle formerly known as artist.
    usain = turtle.Turtle()  # Usain Bolt, https://en.wikipedia.org/wiki/Usain_Bolt
    usain.shape( "turtle" )
    usain.color( "green" )  # Jamaica
    usain.penup()
    usain.setposition( -WIDTH // 2 + MARGIN, -MARGIN * 2 )
    usain.setheading( 0 )
    usain.pendown()

    # TODO 7: Implement the turtle race as described in the lab document.
    writer.write( "And they're off . . .", align="center", font=( "Times", FONT_SIZE, "bold" ) )
    while True:
        flojo.forward( random.randint( MARGIN // 4, MARGIN ) )
        usain.forward( random.randint( MARGIN // 4, MARGIN ) )

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
