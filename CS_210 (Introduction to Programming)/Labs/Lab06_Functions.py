"""CS 210, Introduction to Programming, Fall 2015, Jacob Orner.

Instructor: Dr. Bower

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

import math


def main():
    """Main program to test solutions for each exercise."""
    # Print the docstring at the top of the file so your instructor can see your name.
    print( __doc__ )

    # Call each individual exercise; comment/un-comment these lines as you work.
    # exercise1()
    # exercise2()
    exercise3()
    exercise4()
    exercise5()


# TODO 0: Read and understand the square and bad_square functions below, discussing with a classmate.
def square( n ):
    """Calculate and return the square of the given number.

    :param int n: The number to be squared.
    :return: The square of the given number.
    :rtype: int
    """
    return n ** 2


def bad_square( n ):
    """Calculate and print the square of the given number.

    :param int n: The number to be squared.
    """
    print( n ** 2 )


# TODO 1: Run exercise1() and observe the results, discussing with a classmate.
def exercise1():
    """Demonstrate the very common error of a function printing rather than returning a value."""
    print( "Exercise 1:\n===========")

    print( "Calling the square function with the actual parameter 7:" )
    result = square( 7 )         # Calculates the square of 7 and puts the value in the variable result.
    print( "result =", result )  # Prints the value obtained from the square function.
    print( flush=True )          # Prints a blank line and forces all buffered output to the console.

    print( "Calling the bad_square function with the actual parameter 7:" )
    result = bad_square( 7 )     # Calculates the square of 7, but only prints it (does not return it).
    print( "result =", result )  # Prints the value obtained from the bad_square function, which is None.
    print( flush=True )          # Prints a blank line and forces all buffered output to the console.


# TODO 2: Run exercise2() and observe the results, discussing with a classmate.
def exercise2():
    """Demonstrate the very common error of a function printing rather than returning a value."""
    print( "Exercise 2:\n===========")

    print( "Using the square function to calculate a hypotenuse:")
    result = math.sqrt( square( 3 ) + square( 4 ) )  # This works fine, passing 9 + 16 to math.sqrt.
    print( "result =", result )                      # Prints the expected result of 5.
    print( flush=True )

    print( "Using the bad_square function to calculate a hypotenuse:")
    result = math.sqrt( bad_square( 3 ) + bad_square( 4 ) )  # This passes None + None to math.sqrt ... Error!
    print( "result =", result )                              # This never happens because the above line is an error.
    print( flush=True )


# TODO 3a: Run exercise3() and observe the results, discussing with a classmate.
def exercise3():
    """Use the get_celsius function to create a table of temperature conversions."""
    # Print column headers.
    print( " F     C  " )
    print( "===  =====" )

    # Print the temperature conversions.
    for f in range( 0, 101, 10 ):
        # Use the string format() method to make the output pretty.
        print( " {}   {:.1f}".format( f, get_celsius( f ) ) )

    print()  # A blank line after the table.


# TODO 3b: Complete the get_celsius function so it calculates and returns the celsius temperature.
def get_celsius( fahrenheit ):
    """Calculate and return the celsius temperature equivalent to the given fahrenheit temperature.

    :param float fahrenheit: The fahrenheit temperature to convert to celsius.
    :return: The celsius temperature equivalent to the given fahrenheit temperature.
    :rtype: float
    """

    return float((fahrenheit - 32) * (5 / 9))


# TODO 4b: Use the get_fahrenheit function to display a table of temperature conversions.
def exercise4():
    """Use the get_fahrenheit function to create a table of temperature conversions."""
    print( " C     F  " )
    print( "===  =====" )

    for c in range( 0, 101, 10 ):
        # Use the string format() method to make the output pretty.
        print( " {}   {:.1f}".format( c, get_fahrenheit( c ) ) )

    print()

# TODO 4a: In the space below, write the get_fahrenheit function.
def get_fahrenheit( c ):
    """Calculate and return the fahrenheit temperature equivalent to the given celsius temperature.

    :param float c: The celsius temperature to convert to fahrenheit.
    :return: The fahrenheit temperature equivalent to the given celsius temperature.
    :rtype: float
    """
    return float((c * (9 / 5)) + 32)

# TODO 5b: Use the packing_material function to display a table of packing material requirements.
def exercise5():
    """Use the packing_material function to create a table of packing material for globe shipping."""
    print( "Globe  Packing" )
    print( "=====  =======" )

    for radius in range( 6, 13, 2 ):
        # Use the string format() method to make the output pretty.
        print( " {}     {:.2f}".format( radius, packing_material( radius ) ) )

    print()


# TODO 5a: In the space below, write the packing_material function.
def packing_material( radius ):
    """Calculate and return the packing material needed depending on the radius given.

    :param float radius: The radius of the globe being packed.
    :return: The amount of packing material needed to fill the void.
    :rtype: float
    """
    globe_volume = (4 / 3) * math.pi * pow(radius, 3)
    box_volume = pow((radius + 1) * 2, 3)

    return float(box_volume - globe_volume)

# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()