"""CS 210, Introduction to Programming, Fall 2015, Jake Orner.

This version of the Connect Four model is implemented with nested lists of strings.

Documentation: None.
"""


class ConnectFourModel:
    """This class contains a model of a Connect Four game board.

    A Connect Four board contains fourty-two squares, numbered 1 through 42,
    arranged as follows:
         1 | 2 | 3 | 4 | 5 | 6 | 7
        ---+---+---+---+---+---+---
         8 | 9 | 10| 11| 12| 13| 14
        ---+---+---+---+---+---+---
         15| 16| 17| 18| 19| 20| 21
        ---+---+---+---+---+---+---
         22| 23| 24| 25| 26| 27| 28
        ---+---+---+---+---+---+---
         29| 30| 31| 32| 33| 34| 35
        ---+---+---+---+---+---+---
         36| 37| 38| 39| 40| 41| 42


    There are two players, Red and Blue, who attempt to connect four
    adjacent circle horizontally, vertically, or diagonally.

    The model keeps track of the current player and allows a client
    controller/view to query the model to determine the current
    player and also the player stored in any single circle.

    The model also allows a client controller/view to determine
    if there has been a winner and if the game board is full.

    Finally, the model allows a client controller/view to make
    a move in a given square.
    """

    def __init__( self ):
        """Creates a new Connect Four board ready for the first move."""
        # The Connect Four board will be represented as nested lists
        # of characters with each being a 'Red', 'Blue', or digit.
        # A digit represents a square that has not yet been used.
        self._board = [ [ "01", "02", "03", "04", "05", "06", "07"], ["08", "09", "10", "11", "12", "13", "14"],
                        ["15", "16", "17", "18", "19", "20", "21"], ["22", "23", "24", "25", "26", "27", "28"],
                        ["29", "30", "31", "32", "33", "34", "35"], ["36", "37", "38", "39", "40", "41", "42"]]

        # The board also keeps track of the current player; Red goes first.
        self._current_player = 'Red'

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
        # Returns the fourty-two characters actually representing the board.
        # This would primarily be used for debugging purposes.
        return "".join( [ square for row in self._board for square in row ] )

    def player_at( self, square ):
        """Returns the player at the indicated square.

        :param int square: Integer value indicating a square on the board.
        :return: 'Red', 'Blue', or digit currently occupying the indicated square.
        :rtype: str
        :raises ValueError: If the value of square is not between 1 and 42, inclusive.
        """
        if square < 1 or square > 42:
            raise ValueError( "Square must be between 1 and 42, inclusive." )

        return self._board[ ( square - 1 ) // 7 ][ ( square - 1 ) % 7 ]

    def make_move( self, square ):
        """Places the current player in the indicated square and changes players.

        If no exceptions are raised, the internal state of the board is updated
        by placing the current player in the indicated square. The current player
        is also updated.

        :param int square: Integer value indicating a square on the board.
        :returns: None
        :raises ValueError: If the value of square is not between 1 and 49, inclusive.
        :raises RuntimeError: If the indicated square is not empty.
        """
        if self.is_full() or self.winner() != ' ':
            raise RuntimeError( "Game is over; no moves allowed." )

        if square < 1 or square > 42:
            raise ValueError( "Square must be between 1 and 42, inclusive." )
        elif not self._board[ ( square - 1 ) // 7 ][ ( square - 1 ) % 7 ].isdigit():
            raise RuntimeError( "Square must be empty." )
        else:
            # Put the current player in the specified square and change players.
            while self._board[(square - 1) // 7][(square - 1) % 7].isdigit() and square < 36 and self._board[(square + 6) // 7][(square + 6) % 7].isdigit():
                square += 7
            self._board[ ( square - 1 ) // 7 ][ ( square - 1 ) % 7 ] = self._current_player
            if self._current_player == 'Red':
                self._current_player = 'Blue'
            else:
                self._current_player = 'Red'

    def winner( self ):
        """Determines if there has been an winner.

        :return: 'Red' or 'Blue' if player that player has won the game; ' ' otherwise.
        :rtype: str
        """
        # Checks the horizontal sets of four for a game-winning scenario.
        for r in range(6):
            for c in range(4):
                if self._board[r][c] == self._board[r][c + 1] == self._board[r][c + 2] == self._board[r][c + 3]:
                    return self._board[r][c]

        # Checks the vertical sets of four for a game-winning scenario.
        for c in range(7):
            for r in range(3):
                if self._board[r][c] == self._board[r + 1][c] == self._board[r + 2][c] == self._board[r + 3][c]:
                    return self._board[r][c]

        # Checks the upward diagonal sets of four for a game-winning scenario.
        for r in range(3):
            for c in range(4):
                if self._board[r][c] == self._board[r + 1][c + 1] == \
                        self._board[r + 2][c + 2] == self._board[r + 3][c + 3]:
                    return self._board[r][c]

        # Checks the downward diagonal sets of four for a game-winning scenario.
        for r in range(3):
            for c in range(4):
                if self._board[r + 3][c] == self._board[r + 2][c + 1] == \
                        self._board[r + 1][c + 2] == self._board[r][c + 3]:
                    return self._board[r + 3][c]

        return ' '  # A space indicates no winner.

    def is_full( self ):
        """Determines if the game board is full.

        :return: True if the board is full; False otherwise.
        :rtype: bool
        """
        # Check all squares on the board (ignoring location 0 in the list).
        for row in self._board:
            for square in row:
                # If any square is still a digit the board is not full.
                if square.isdigit():
                    return False
        # No squares are still digits, so the board must be full.
        return True
