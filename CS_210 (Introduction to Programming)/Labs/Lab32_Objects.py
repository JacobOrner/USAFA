"""CS 210, Introduction to Programming, Fall 2015, _YOUR_NAME_HERE_.

Instructor: Dr. Bower / Col Gibson / LtCol Harder / LtCol (Ret) Christman

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""


def main():
    """Main program to test solutions for each exercise."""
    # Print the docstring at the top of the file so your instructor can see your name.
    print( __doc__ )

    one_half = Fraction( 1, 2 )
    one_third = Fraction( 1, 3 )
    one_fourth = Fraction( 1, 7 )
    result = one_half == one_third
    print( "{} == {} = {}".format( one_half, one_third, result ) )
    result = one_third == one_third
    print( "{} == {} = {}".format( one_third, one_third, result ) )
    print()

    f = Fraction( 1, 2 )
    g = Fraction( 1, 3 )
    print( "{} += {} = ".format( f, g ), end="" )
    f //= ( g )
    print( "{} ... note {} did not change.".format( f, g ) )


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

    def __add__( self, other ):
        """Adds two Fraction objects, building and returning a new Fraction object.

        Note: This method does NOT modify the self or other Fraction objects.

        Note: This method ensures the result Fraction object is in lowest terms.

        :param Fraction other: The other Fraction object to be added to this Fraction object.
        :return: A new Fraction object equal to the sum of the self and other Fraction objects.
        :rtype: Fraction
        """
        n1 = self.n * other.d
        n2 = self.d * other.n
        d = self.d * other.d
        result = Fraction( n1 + n2, d )
        result.simplify()
        return result

    def __iadd__( self, other ):
        """Adds two Fraction objects, modifying the self Fraction object.

        Note: This method does NOT modify the other Fraction object.

        Note: This method ensures the Fraction object is in lowest terms.

        :param Fraction other: The other Fraction object to be added to this Fraction object.
        :return: A new Fraction object equal to the sum of the self and other Fraction objects.
        :rtype: Fraction
        """
        self.n *= other.d
        self.n += self.d * other.n
        self.d *= other.d
        self.simplify()
        return self

    def __sub__( self, other ):
        """Subtracts two Fraction objects, building and returning a new Fraction object.

        Note: This method does NOT modify the self or other Fraction objects.

        Note: This method ensures the result Fraction object is in lowest terms.

        :param Fraction other: The other Fraction object to be added to this Fraction object.
        :return: A new Fraction object equal to the sum of the self and other Fraction objects.
        :rtype: Fraction
        """
        n1 = self.n * other.d
        n2 = self.d * other.n
        d = self.d * other.d
        result = Fraction( n1 - n2, d )
        result.simplify()
        return result

    def __isub__( self, other ):
        """Subtracts two Fraction objects, modifying the self Fraction object.

        Note: This method does NOT modify the other Fraction object.

        Note: This method ensures the Fraction object is in lowest terms.

        :param Fraction other: The other Fraction object to be added to this Fraction object.
        :return: A new Fraction object equal to the sum of the self and other Fraction objects.
        :rtype: Fraction
        """
        self.n *= other.d
        self.n -= self.d * other.n
        self.d *= other.d
        self.simplify()
        return self

    def __mul__( self, other ):
        """Multiplies two Fraction objects, building and returning a new Fraction object.

        Note: This method does NOT modify the self or other Fraction objects.

        Note: This method ensures the result Fraction object is in lowest terms.

        :param Fraction other: The other Fraction object to be multiplied by this Fraction object.
        :return: A new Fraction object equal to the sum of the self and other Fraction objects.
        :rtype: Fraction
        """
        n1 = self.n * other.n
        # n2 = self.d * other.n
        # d = self.d * other.d
        result = Fraction( n1, self.d * other.d )
        result.simplify()
        return result

    def __imul__( self, other ):
        """Multiplies two Fraction objects, modifying the self Fraction object.

        Note: This method does NOT modify the other Fraction object.

        Note: This method ensures the Fraction object is in lowest terms.

        :param Fraction other: The other Fraction object to be added to this Fraction object.
        :return: A new Fraction object equal to the sum of the self and other Fraction objects.
        :rtype: Fraction
        """
        self.n *= other.n
        self.d *= other.d
        self.simplify()
        return self

    def __truediv__( self, other ):
        """Divides two Fraction objects, building and returning a new Fraction object.

        Note: This method does NOT modify the self or other Fraction objects.

        Note: This method ensures the result Fraction object is in lowest terms.

        :param Fraction other: The other Fraction object to be multiplied by this Fraction object.
        :return: A new Fraction object equal to the sum of the self and other Fraction objects.
        :rtype: Fraction
        """
        n1 = self.n * other.d
        n2 = self.d * other.n
        # d = self.d * other.d
        result = Fraction( n1, n2 )
        result.simplify()
        return result

    def __itruediv__(self, other):
        """Divides two Fraction objects, modifying the self Fraction object.

        Note: This method does NOT modify the other Fraction object.

        Note: This method ensures the Fraction object is in lowest terms.

        :param Fraction other: The other Fraction object to be added to this Fraction object.
        :return: A new Fraction object equal to the sum of the self and other Fraction objects.
        :rtype: Fraction
        """
        self.n *= other.d
        self.d *= other.n
        self.simplify()
        return self

    def __floordiv__( self, other ):
        """Divides two Fraction objects, building and returning a new Fraction object.

        Note: This method does NOT modify the self or other Fraction objects.

        Note: This method ensures the result Fraction object is in lowest terms.

        :param Fraction other: The other Fraction object to be multiplied by this Fraction object.
        :return: A new Fraction object equal to the sum of the self and other Fraction objects.
        :rtype: Fraction
        """
        n1 = self.n * other.d
        n2 = self.d * other.n
        # d = self.d * other.d
        result = Fraction( n1 // n2, 1 )
        result.simplify()
        return result

    def __ifloordiv__(self, other):
        """Divides two Fraction objects, modifying the self Fraction object.

        Note: This method does NOT modify the other Fraction object.

        Note: This method ensures the Fraction object is in lowest terms.

        :param Fraction other: The other Fraction object to be added to this Fraction object.
        :return: A new Fraction object equal to the sum of the self and other Fraction objects.
        :rtype: Fraction
        """
        self.n *= other.d
        self.d *= other.n
        self.n //= self.d
        self.d = 1
        self.simplify()
        return self

    def __eq__(self, other):
        """Test the equality of two fraction objects

        :param Fraction other: The other fraction object to be equality checked to this Fraction object.
        :return: A true or false statement of equality.
        :rtype: Boolean
        """
        if self.n * other.d == other.n * self.d:
            return True
        else:
            return False

    def __ne__(self, other):
        """Test the inequality of two fraction objects.

        :param Fraction other: The other fraction object to be equality checked to this Fraction object.
        :return: A true or false statement of equality.
        :rtype: Boolean
        """
        if self.n * other.d != other.n * self.d:
            return True
        else:
            return False

    def __lt__(self, other):
        """Test the less than operator of two fraction objects.

        :param Fraction other: The other fraction object to be equality checked to this Fraction object.
        :return: A true or false statement of equality.
        :rtype: Boolean
        """
        if self.n * other.d < other.n * self.d:
            return True
        else:
            return False

    def __le__(self, other):
        """Test the less than or equal operator of two fraction objects.

        :param Fraction other: The other fraction object to be equality checked to this Fraction object.
        :return: A true or false statement of equality.
        :rtype: Boolean
        """
        if self.n * other.d <= other.n * self.d:
            return True
        else:
            return False

    def __gt__(self, other):
        """Test the greater than operator of two fraction objects.

        :param Fraction other: The other fraction object to be equality checked to this Fraction object.
        :return: A true or false statement of equality.
        :rtype: Boolean
        """
        if self.n * other.d > other.n * self.d:
            return True
        else:
            return False

    def __ge__(self, other):
        """Test the greater than or equaloperator of two fraction objects.

        :param Fraction other: The other fraction object to be equality checked to this Fraction object.
        :return: A true or false statement of equality.
        :rtype: Boolean
        """
        if self.n * other.d >= other.n * self.d:
            return True
        else:
            return False

    def __int__(self):
        """Return the int of the fraction object.

        :return: An integer of the fraction.
        :rtype: int
        """
        return int(self.n / self.d)

    def __float__(self):
        """Return the float of the fraction object.

        :return: A float of the fraction.
        :rtype: float
        """
        return float(self.n / self.d)

    def __neg__(self):
        return -Fraction(self.n, self.d)

    def simplify( self ):
        """Simplifies this Fraction object such that it is in lowest terms."""
        # Find the greatest common divisor of this Fraction object's numerator and denominator.
        divisor = gcd( self.n, self.d )
        # Simplify this Fraction object's numerator and denominator.
        self.n //= divisor
        self.d //= divisor


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