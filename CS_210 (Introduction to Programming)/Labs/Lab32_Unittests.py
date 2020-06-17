"""CS 210, Introduction to Programming, Fall 2015, _YOUR_NAME_HERE_.

Instructor: Dr. Bower / Col Gibson / LtCol Harder / LtCol (Ret) Christman

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

import unittest
import sys

from Labs.Lab32_Objects import Fraction


class FractionTests( unittest.TestCase ):
    """Tests the Fraction class."""

    def test_add( self ):
        """Test the + operator."""

        # Two positive fractions, positive result less than one.
        a, b, c = Fraction( 1, 3 ), Fraction( 1, 4 ), Fraction( 7, 12 )
        with self.subTest( "{} + {} = {}".format( a, b, c ) ):
            self.assertEqual( a + b, c )
            self.assertEqual( b + a, c )

        # Two positive fractions, positive result greater than one.
        a, b, c = Fraction( 2, 3 ), Fraction( 3, 4 ), Fraction( 17, 12 )
        with self.subTest( "{} + {} = {}".format( a, b, c ) ):
            self.assertEqual( a + b, c )
            self.assertEqual( b + a, c )

        # Two positive fractions, result equal one.
        a, b, c = Fraction( 1, 3 ), Fraction( 6, 9 ), Fraction( 1, 1 )
        with self.subTest( "{} + {} = {}".format( a, b, c ) ):
            self.assertEqual( a + b, c )
            self.assertEqual( b + a, c )

        # Two negative fractions, negative result greater than negative one.
        a, b, c = Fraction( -1, 3 ), Fraction( -1, 4 ), Fraction( -7, 12 )
        with self.subTest( "{} + {} = {}".format( a, b, c ) ):
            self.assertEqual( a + b, c )
            self.assertEqual( b + a, c )

        # Two negative fractions, negative result less than negative one.
        a, b, c = Fraction( -2, 3 ), Fraction( -3, 4 ), Fraction( -17, 12 )
        with self.subTest( "{} + {} = {}".format( a, b, c ) ):
            self.assertEqual( a + b, c )
            self.assertEqual( b + a, c )

        # Two negative fractions, result equal negative one.
        a, b, c = Fraction( -1, 3 ), Fraction( -6, 9 ), Fraction( -1, 1 )
        with self.subTest( "{} + {} = {}".format( a, b, c ) ):
            self.assertEqual( a + b, c )
            self.assertEqual( b + a, c )

        # One positive fraction, one negative fraction, result greater than zero.
        a, b, c = Fraction( 1, 3 ), Fraction( -1, 4 ), Fraction( 1, 12 )
        with self.subTest( "{} + {} = {}".format( a, b, c ) ):
            self.assertEqual( a + b, c )
            self.assertEqual( b + a, c )

        # One positive fraction, one negative fraction, result less than zero.
        a, b, c = Fraction( -1, 3 ), Fraction( 1, 4 ), Fraction( -1, 12 )
        with self.subTest( "{} + {} = {}".format( a, b, c ) ):
            self.assertEqual( a + b, c )
            self.assertEqual( b + a, c )

        # One positive fraction, one negative fraction, result equal zero.
        a, b, c = Fraction( -1, 3 ), Fraction( 1, 4 ), Fraction( -1, 12 )
        with self.subTest( "{} + {} = {}".format( a, b, c ) ):
            self.assertEqual( a + b, c )
            self.assertEqual( b + a, c )

    def test_sub( self ):
        """Test the - operator."""

        # Two positive fractions, positive result less than one.
        a, b, c = Fraction( 1, 3 ), Fraction( 1, 4 ), Fraction( 1, 12 )
        with self.subTest( "{} - {} = {}".format( a, b, c ) ):
            self.assertEqual( a - b, c )

        # Two positive fractions, positive result greater than one.
        a, b, c = Fraction( 2, 3 ), Fraction( 3, 4 ), Fraction( -1, 12 )
        with self.subTest( "{} - {} = {}".format( a, b, c ) ):
            self.assertEqual( a - b, c )

        # Two positive fractions, result equal one.
        a, b, c = Fraction( 1, 3 ), Fraction( 6, 9 ), Fraction( -1, 3 )
        with self.subTest( "{} - {} = {}".format( a, b, c ) ):
            self.assertEqual( a - b, c )

        # Two negative fractions, negative result greater than negative one.
        a, b, c = Fraction( -1, 3 ), Fraction( -1, 4 ), Fraction( -1, 12 )
        with self.subTest( "{} - {} = {}".format( a, b, c ) ):
            self.assertEqual( a - b, c )

        # Two negative fractions, negative result less than negative one.
        a, b, c = Fraction( -2, 3 ), Fraction( -3, 4 ), Fraction( 1, 12 )
        with self.subTest( "{} - {} = {}".format( a, b, c ) ):
            self.assertEqual( a - b, c )

    def test_mul(self):
        """Test the * operator."""

        # Two positive fractions, positive result less than one.
        a, b, c = Fraction( 1, 3 ), Fraction( 1, 4 ), Fraction( 1, 12 )
        with self.subTest( "{} * {} = {}".format( a, b, c ) ):
            self.assertEqual( a * b, c )

        # Two positive fractions, positive result greater than one.
        a, b, c = Fraction( 2, 3 ), Fraction( 3, 4 ), Fraction( 1, 2 )
        with self.subTest( "{} * {} = {}".format( a, b, c ) ):
            self.assertEqual( a * b, c )

        # Two positive fractions, result equal one.
        a, b, c = Fraction( 1, 3 ), Fraction( 6, 9 ), Fraction( 2, 9 )
        with self.subTest( "{} * {} = {}".format( a, b, c ) ):
            self.assertEqual( a * b, c )

        # Two negative fractions, negative result greater than negative one.
        a, b, c = Fraction( -1, 3 ), Fraction( -1, 4 ), Fraction( 1, 12 )
        with self.subTest( "{} * {} = {}".format( a, b, c ) ):
            self.assertEqual( a * b, c )

        # One negative fraction, negative result equal one half.
        a, b, c = Fraction( 2, 3 ), Fraction( -3, 4 ), Fraction( -1, 2 )
        with self.subTest( "{} * {} = {}".format( a, b, c ) ):
            self.assertEqual( a * b, c )

    def test_truediv(self):
        """Test the / operator."""

        # Two positive fractions, positive result less than one.
        a, b, c = Fraction( 1, 3 ), Fraction( 1, 4 ), Fraction( 4, 3 )
        with self.subTest( "{} / {} = {}".format( a, b, c ) ):
            self.assertEqual( a / b, c )

        # Two positive fractions, positive result greater than one.
        a, b, c = Fraction( 2, 3 ), Fraction( 3, 4 ), Fraction( 8, 9 )
        with self.subTest( "{} / {} = {}".format( a, b, c ) ):
            self.assertEqual( a / b, c )

        # Two positive fractions, result equal one.
        a, b, c = Fraction( 1, 3 ), Fraction( 6, 9 ), Fraction( 1, 2 )
        with self.subTest( "{} / {} = {}".format( a, b, c ) ):
            self.assertEqual( a / b, c )

        # Two negative fractions, negative result greater than negative one.
        a, b, c = Fraction( -1, 3 ), Fraction( -1, 4 ), Fraction( 4, 3 )
        with self.subTest( "{} / {} = {}".format( a, b, c ) ):
            self.assertEqual( a / b, c )

        # Two negative fractions, negative result less than negative one.
        a, b, c = Fraction( -2, 3 ), Fraction( 3, 4 ), Fraction( -8, 9 )
        with self.subTest( "{} / {} = {}".format( a, b, c ) ):
            self.assertEqual( a / b, c )

    def test_floordiv(self):
        """Test the // operator."""

        # Two positive fractions, positive result less than one.
        a, b, c = Fraction( 1, 3 ), Fraction( 1, 4 ), Fraction( 1, 1 )
        with self.subTest( "{} // {} = {}".format( a, b, c ) ):
            self.assertEqual( a // b, c )

        # Two positive fractions, positive result greater than one.
        a, b, c = Fraction( 2, 3 ), Fraction( 3, 4 ), Fraction( 0, 1 )
        with self.subTest( "{} // {} = {}".format( a, b, c ) ):
            self.assertEqual( a // b, c )

        # Two positive fractions, result equal one.
        a, b, c = Fraction( 1, 3 ), Fraction( 6, 9 ), Fraction( 0, 1 )
        with self.subTest( "{} // {} = {}".format( a, b, c ) ):
            self.assertEqual( a // b, c )

        # Two negative fractions, negative result greater than negative one.
        a, b, c = Fraction( -1, 3 ), Fraction( -1, 4 ), Fraction( 1, 1 )
        with self.subTest( "{} // {} = {}".format( a, b, c ) ):
            self.assertEqual( a // b, c )

        # Two negative fractions, negative result less than negative one.
        a, b, c = Fraction( -3, 4 ), Fraction( 3, 4 ), Fraction( -1, 1 )
        with self.subTest( "{} // {} = {}".format( a, b, c ) ):
            self.assertEqual( a // b, c )

    def test_eq(self):
        """Test the == operator."""

        # Two positive fractions, positive result less than one.
        a, b, c = Fraction( 1, 3 ), Fraction( 1, 4 ), False
        with self.subTest( "{} == {}".format( a, b ) ):
            self.assertEqual( a == b, c )

        # Two positive fractions, positive result greater than one.
        a, b, c = Fraction( 3, 4 ), Fraction( 3, 4 ), True
        with self.subTest( "{} == {}".format( a, b ) ):
            self.assertEqual( a == b, c )

        # Two positive fractions, result equals False.
        a, b, c = Fraction( -1, 3 ), Fraction( -3, 9 ), True
        with self.subTest( "{} == {}".format( a, b ) ):
            self.assertEqual( a == b, c )

        # Two negative fractions, negative result greater than negative one.
        a, b, c = Fraction( -1, 3 ), Fraction( -1, 3 ), True
        with self.subTest( "{} == {}".format( a, b ) ):
            self.assertEqual( a == b, c )


if __name__ == '__main__':
    sys.argv.append( "-v" )  # Add the verbose command line flag.
    unittest.main()