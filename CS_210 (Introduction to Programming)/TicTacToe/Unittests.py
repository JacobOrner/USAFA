"""CS 210, Introduction to Programming, Fall 2015, Dr. Bower.

Unit tests of the Tic Tac Toe Model.

Documentation: None.
"""

import unittest
import sys

# Import any one of the Tic Tac Toe Models.
from ModelList import TicTacToeModel
# from ModelNestedLists import TicTacToeModel
# from ModelString import TicTacToeModel


class TicTacTests( unittest.TestCase ):
    """Tests the Tic Tac Toe model."""

    def test_tie_game( self ):
        """Test filling every square on the board without a winner."""
        ttt = TicTacToeModel()

        with self.subTest( "0 moves: Empty board." ):
            self.assertEqual( 'X', ttt.current_player )
            self.assertEqual( ' ', ttt.winner() )
            self.assertEqual( "123456789", str( ttt ) )
            self.assertFalse( ttt.is_full() )

        with self.subTest( "1st move: Player X moves in square 1." ):
            ttt.make_move( 1 )
            self.assertEqual( 'X', ttt.player_at( 1 ) )
            self.assertEqual( 'O', ttt.current_player )
            self.assertEqual( ' ', ttt.winner() )
            self.assertEqual( "X23456789", str( ttt ) )
            self.assertFalse( ttt.is_full() )

        with self.subTest( "2nd move: Player O moves in square 2." ):
            ttt.make_move( 2 )
            self.assertEqual( 'O', ttt.player_at( 2 ) )
            self.assertEqual( 'X', ttt.current_player )
            self.assertEqual( ' ', ttt.winner() )
            self.assertEqual( "XO3456789", str( ttt ) )
            self.assertFalse( ttt.is_full() )

        with self.subTest( "3rd move: Player X moves in square 3." ):
            ttt.make_move( 3 )
            self.assertEqual( 'X', ttt.player_at( 3 ) )
            self.assertEqual( 'O', ttt.current_player )
            self.assertEqual( ' ', ttt.winner() )
            self.assertEqual( "XOX456789", str( ttt ) )
            self.assertFalse( ttt.is_full() )

        with self.subTest( "4th move: Player O moves in square 5." ):
            ttt.make_move( 5 )
            self.assertEqual( 'O', ttt.player_at( 5 ) )
            self.assertEqual( 'X', ttt.current_player )
            self.assertEqual( ' ', ttt.winner() )
            self.assertEqual( "XOX4O6789", str( ttt ) )
            self.assertFalse( ttt.is_full() )

        with self.subTest( "5th move: Player X moves in square 4." ):
            ttt.make_move( 4 )
            self.assertEqual( 'X', ttt.player_at( 4 ) )
            self.assertEqual( 'O', ttt.current_player )
            self.assertEqual( ' ', ttt.winner() )
            self.assertEqual( "XOXXO6789", str( ttt ) )
            self.assertFalse( ttt.is_full() )

        with self.subTest( "6th move: Player O moves in square 6." ):
            ttt.make_move( 6 )
            self.assertEqual( 'O', ttt.player_at( 6 ) )
            self.assertEqual( 'X', ttt.current_player )
            self.assertEqual( ' ', ttt.winner() )
            self.assertEqual( "XOXXOO789", str( ttt ) )
            self.assertFalse( ttt.is_full() )

        with self.subTest( "7th move: Player X moves in square 8." ):
            ttt.make_move( 8 )
            self.assertEqual( 'X', ttt.player_at( 8 ) )
            self.assertEqual( 'O', ttt.current_player )
            self.assertEqual( ' ', ttt.winner() )
            self.assertEqual( "XOXXOO7X9", str( ttt ) )
            self.assertFalse( ttt.is_full() )

        with self.subTest( "8th move: Player O moves in square 7." ):
            ttt.make_move( 7 )
            self.assertEqual( 'O', ttt.player_at( 7 ) )
            self.assertEqual( 'X', ttt.current_player )
            self.assertEqual( ' ', ttt.winner() )
            self.assertEqual( "XOXXOOOX9", str( ttt ) )
            self.assertFalse( ttt.is_full() )

        with self.subTest( "9th move: Player X moves in square 9." ):
            ttt.make_move( 9 )
            self.assertEqual( 'X', ttt.player_at( 9 ) )
            self.assertEqual( 'O', ttt.current_player )
            self.assertEqual( ' ', ttt.winner() )
            self.assertEqual( "XOXXOOOXX", str( ttt ) )
            self.assertTrue( ttt.is_full() )

    def test_winner_x( self ):
        """Test each possible winning combination for player X."""
        # Create lists of the winning moves.
        tests = [
            [ 1, 4, 2, 5, 3, "X wins in first row" ],
            [ 4, 1, 5, 2, 6, "X wins in second row" ],
            [ 7, 1, 8, 2, 9, "X wins in third row" ],
            [ 1, 2, 4, 5, 7, "X wins in first column" ],
            [ 2, 1, 5, 4, 8, "X wins in second column" ],
            [ 3, 1, 6, 4, 9, "X wins in third column" ],
            [ 1, 2, 5, 6, 9, "X wins in first diagonal" ],
            [ 3, 2, 5, 4, 7, "X wins in second diagonal" ],
        ]

        for moves in tests:
            with self.subTest( moves[ -1 ] ):
                ttt = TicTacToeModel()
                for move in moves[ :-1 ]:
                    ttt.make_move( move )
                self.assertEqual( 'X', ttt.winner() )

    def test_winner_o( self ):
        """Test each possible winning combination for player O."""
        # Create lists of the winning moves.
        tests = [
            [ 9, 1, 4, 2, 5, 3, "O wins in first row" ],
            [ 9, 4, 1, 5, 2, 6, "O wins in second row" ],
            [ 4, 7, 1, 8, 2, 9, "O wins in third row" ],
            [ 9, 1, 2, 4, 5, 7, "O wins in first column" ],
            [ 9, 2, 1, 5, 4, 8, "O wins in second column" ],
            [ 2, 3, 1, 6, 4, 9, "O wins in third column" ],
            [ 7, 1, 2, 5, 6, 9, "O wins in first diagonal" ],
            [ 9, 3, 2, 5, 4, 7, "O wins in second diagonal" ],
        ]

        for moves in tests:
            with self.subTest( moves[ -1 ] ):
                ttt = TicTacToeModel()
                for move in moves[ :-1 ]:
                    ttt.make_move( move )
                self.assertEqual( 'O', ttt.winner() )

    def test_exceptions( self ):
        """Test the expected exceptions."""
        ttt = TicTacToeModel()

        error_message = "Current player cannot be set by client."
        with self.subTest( error_message ):
            with self.assertRaises( RuntimeError ) as e:
                ttt.current_player = 'O'
                self.assertEqual( error_message, str( e ) )

        error_message = "Square must be between 1 and 9, inclusive."
        with self.subTest( error_message ):
            # Test player_at square locations.
            with self.assertRaises( ValueError ) as e:
                ttt.player_at( -1 )
                self.assertEqual( error_message, str( e ) )
            with self.assertRaises( ValueError ) as e:
                ttt.player_at( 0 )
                self.assertEqual( error_message, str( e ) )
            with self.assertRaises( ValueError ) as e:
                ttt.player_at( 10 )
                self.assertEqual( error_message, str( e ) )
            with self.assertRaises( ValueError ) as e:
                ttt.player_at( 11 )
                self.assertEqual( error_message, str( e ) )

            # Test make_move square locations.
            with self.assertRaises( ValueError ) as e:
                ttt.make_move( -1 )
                self.assertEqual( error_message, str( e ) )
            with self.assertRaises( ValueError ) as e:
                ttt.make_move( 0 )
                self.assertEqual( error_message, str( e ) )
            with self.assertRaises( ValueError ) as e:
                ttt.make_move( 10 )
                self.assertEqual( error_message, str( e ) )
            with self.assertRaises( ValueError ) as e:
                ttt.make_move( 11 )
                self.assertEqual( error_message, str( e ) )

        error_message = "Square must be empty."
        with self.subTest( error_message ):
            # List of moves that result in a tie game.
            for move in [ 1, 2, 3, 5, 4, 6, 8, 7, 9 ]:
                ttt.make_move( move )  # Make a move to fill a square.
                with self.assertRaises( RuntimeError ) as e:
                    ttt.make_move( move )  # Try to make the same move in the now filled square.
                    self.assertEqual( error_message, str( e ) )

        error_message = "Game is over; no moves allowed."
        with self.subTest( error_message ):
            # Game is over from previous test due to a tie game (i.e., full board).
            with self.assertRaises( RuntimeError ) as e:
                ttt.make_move( 5 )  # Try to make another move.
                self.assertEqual( error_message, str( e ) )

            # Create a new model and end the game due to a winner.
            ttt = TicTacToeModel()
            for move in [ 1, 2, 5, 6, 9 ]:
                ttt.make_move( move )  # Make a move to fill a square.
            with self.assertRaises( RuntimeError ) as e:
                ttt.make_move( 5 )  # Try to make another move in a full square.
                self.assertEqual( error_message, str( e ) )
            with self.assertRaises( RuntimeError ) as e:
                ttt.make_move( 3 )  # Try to make another move in an empty square.
                self.assertEqual( error_message, str( e ) )


if __name__ == '__main__':
    sys.argv.append( "-v" )  # Add the verbose command line flag.
    unittest.main()
