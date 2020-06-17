"""CS 210, Introduction to Programming, Fall 2015, Jake Orner.

Instructor: Dr. Bower

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""


def main():
    """Main program to test solutions for each exercise."""
    # Print the docstring at the top of the file so your instructor can see your name.
    print( __doc__ )

    # Example from text; printing a Fraction object and accessing individual attributes.
    f = Fraction( 3, 4 )
    print( "In the fraction {}, the numerator is {} and the denominator is {}.".format( f, f.n, f.d ) )
    print()

    # Example from text; demonstrating object mutability.
    f = Fraction( 12, 16 )
    print( "f = {}".format( f ) )
    f.simplify()
    print( "f = {} after being simplified.".format( f ) )
    print()

    # TODO 1b: In the space below, write code to test the method as described in the lab document.
    one_half = Fraction( 1, 2 )
    one_third = Fraction( 1, 3 )
    result = one_half.add( one_third )
    print( "{} + {} = {}".format( one_half, one_third, result ) )
    result = one_third.add( one_half )
    print( "{} + {} = {}".format( one_half, one_third, result ) )


    # TODO 2b: In the space below, write code to test the method as described in the lab document.
    f = Fraction( 1, 2 )
    g = Fraction( 1, 3 )
    print( "{} += {}".format( f, g ), end=" " )
    f.plus( g )
    print( "= {} ... note {} did not change.".format( f, g ) )


class Fraction:
    """Class for representing a fraction with integer values for numerator and denominator."""

    def __init__( self, n=0, d=1 ):
        """Create a new Fraction with the given values.

        :param int n: The numerator.
        :param int d: The denominator.
        """
        self.n = n
        self.d = d

    def __str__( self ):
        """Build and return a string representation of the object.

        :return: A string representation of this Raindrop in the format "(x,y):r".
        :rtype: str
        """
        return "{}/{}".format( self.n, self.d )

    def simplify( self ):
        """Simplifies this Fraction object such that it is in lowest terms."""
        # Find the greatest common divisor of this Fraction object's numerator and denominator.
        divisor = gcd( self.n, self.d )
        # Simplify this Fraction object's numerator and denominator.
        self.n //= divisor
        self.d //= divisor

    def add( self, other ):
        """Adds two Fraction objects, building and returning a new Fraction object.

        Note: This method does NOT modify the self or other Fraction objects.

        Note: This method ensures the result Fraction object is in lowest terms after the addition.

        :param Fraction other: The other Fraction object to be added to this Fraction object.
        :return: A new Fraction object equal to the sum of the self and other Fraction objects.
        :rtype: Fraction
        """
        # TODO 1a: In the space below, complete the method as described in the lab document.
        d = self.d * other.d
        a = (self.n * ( d / self.d ) )
        b = (other.n * ( d / other.d ) )
        r = Fraction( int(a + b), int(d) )
        r.simplify()
        return r

    def plus( self, other ):
        """Adds two Fraction objects, modifying the self Fraction object.

        Note: This method does NOT modify the other Fraction object.

        Note: This method ensures the Fraction object is in lowest terms after the addition.

        :param Fraction other: The other Fraction object to be added to this Fraction object.
        :return: None
        """
        # TODO 2a: In the space below, complete the method as described in the lab document.
        d = self.d * other.d
        a = (self.n * ( d / self.d ) )
        b = (other.n * ( d / other.d ) )
        self.n = int(a + b)
        self.d = int(d)
        self.simplify()
        return self


def gcd( a, b ):
    """Uses division-based version of Euclid's algorithm to calculate the greatest common divisor of two integers.

    https://en.wikipedia.org/wiki/Euclidean_algorithm#Implementations

    :param int a: An integer.
    :param int b: An integer.
    :return: The greatest common divisor of a and b.
    :rtype: int
    """
    while b != 0:
        temp = b
        b = a % b
        a = temp
    return a


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()