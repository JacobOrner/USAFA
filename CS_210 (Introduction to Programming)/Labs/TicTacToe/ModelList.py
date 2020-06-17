"""CS 210, Introduction to Programming, Fall 2015, Dr. Bower.

This version of the Tic Tac Toe model is implemented with a list of strings.

Documentation: None.
"""


class TicTacToeModel:
    """This class contains a model of a Tic Tac Toe game board.

    A Tic Tac Toe board contains nine squares, numbered 1 through 9,
    arranged as follows:
        1|2|3
        -+-+-
        4|5|6
        -+-+-
        7|8|9

    There are two players, X and O, who attempt to connect three
    adjacent squares horizontally, vertically, or diagonally.

    The model keeps track of the current player and allows a client
    controller/view to query the model to determine the current
    player and also the player stored in any single square.

    The model also allows a client controller/view to determine
    if there has been a winner and if the game board is full.

    Finally, the model allows a client controller/view to make
    a move in a given square.
    """

    def __init__( self ):
        """Creates a new Tic Tac Toe board ready for the first move."""
        # The Tic Tac Toe board will be represented as a 9-element list
        # of single characters with each being an 'X', 'O', or digit.
        # A digit represents a square that has not yet been used.
        self._board = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" ]
        # NOTE: To make the string indices align with the square numbers,
        # the first character in the string is ignored.

        # The board also keeps track of the current player; X goes first.
        self._current_player = 'X'

        # NOTE: The class attribute variable names begin with an underscore
        # to indicate they are intended to be "private" to this class. See
        # https://docs.python.org/3.4/tutorial/classes.html#tut-private

    @property
    def current_player( self ):
        """Returns the current player."""
        return self._current_player

    @current_player.setter
    def current_player( self, player ):
        """Setter method for the current player attribute.

        :param str player: The new player.
        :return: None
        """
        raise RuntimeError( "Current player cannot be set by client." )

    def __str__( self ):
        """Returns a string representation of the board."""
        # Returns the nine characters actually representing the board.
        # This would primarily be used for debugging purposes.
        return "".join( self._board[ 1: ] )

    def player_at( self, square ):
        """Returns the player at the indicated square.

        :param int square: Integer value indicating a square on the board.
        :return: An 'X', 'O', or digit currently occupying the indicated square.
        :rtype: str
        :raises ValueError: If the value of square is not between 1 and 9, inclusive.
        """
        if square < 1 or square > 9:
            raise ValueError( "Square must be between 1 and 9, inclusive." )

        return self._board[ square ]

    def make_move( self, square ):
        """Places the current player in the indicated square and changes players.

        If no exceptions are raised, the internal state of the board is updated
        by placing the current player in the indicated square. The current player
        is also updated.

        :param int square: Integer value indicating a square on the board.
        :returns: None
        :raises ValueError: If the value of square is not between 1 and 9, inclusive.
        :raises RuntimeError: If the indicated square is not empty.
        """
        if self.is_full() or self.winner() != ' ':
            raise RuntimeError( "Game is over; no moves allowed." )

        if square < 1 or square > 9:
            raise ValueError( "Square must be between 1 and 9, inclusive." )
        elif not self._board[ square ].isdigit():
            raise RuntimeError( "Square must be empty." )
        else:
            # Put the current player in the specified square and change players.
            self._board[ square ] = self._current_player
            if self._current_player == 'X':
                self._current_player = 'O'
            else:
                self._current_player = 'X'

    def winner( self ):
        """Determines if there has been an winner.

        :return: 'X' or 'O' if player that player has won the game; ' ' otherwise.
        :rtype: str
        """
        if self._board[ 1 ] == self._board[ 2 ] == self._board[ 3 ]:
            return self._board[ 1 ]
        elif self._board[ 4 ] == self._board[ 5 ] == self._board[ 6 ]:
            return self._board[ 4 ]
        elif self._board[ 7 ] == self._board[ 8 ] == self._board[ 9 ]:
            return self._board[ 7 ]
        elif self._board[ 1 ] == self._board[ 4 ] == self._board[ 7 ]:
            return self._board[ 1 ]
        elif self._board[ 2 ] == self._board[ 5 ] == self._board[ 8 ]:
            return self._board[ 2 ]
        elif self._board[ 3 ] == self._board[ 6 ] == self._board[ 9 ]:
            return self._board[ 3 ]
        elif self._board[ 1 ] == self._board[ 5 ] == self._board[ 9 ]:
            return self._board[ 1 ]
        elif self._board[ 3 ] == self._board[ 5 ] == self._board[ 7 ]:
            return self._board[ 3 ]
        else:
            return ' '  # A space indicates no winner.

    def is_full( self ):
        """Determines if the game board is full.

        :return: True if the board is full; False otherwise.
        :rtype: bool
        """
        # Check all squares on the board (ignoring location 0 in the list).
        for square in self._board[ 1: ]:
            # If any square is still a digit the board is not full.
            if square.isdigit():
                return False
        # No squares are still digits, so the board must be full.
        return True
