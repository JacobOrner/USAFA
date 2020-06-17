"""CS 210, Introduction to Programming, Fall 2015, Dr. Bower.

This version of Tic Tac Toe is played in the console window.

Documentation: None.
"""


# Import any one of the Tic Tac Toe Models.
from ModelList import TicTacToeModel
# from ModelNestedLists import TicTacToeModel
# from ModelString import TicTacToeModel


def main():
    """Main program to play a game of Tic Tac Toe in the console window."""
    # Create a new instance of the Tic Tac Toe model.
    ttt = TicTacToeModel()

    # The game continues until the winner is either 'X' or 'O'
    # and the board is not full.
    while ttt.winner() == ' ' and not ttt.is_full():
        # Show the current game board.
        show( ttt )

        # Use a try/except in case the user types invalid input
        # or the board cannot make the move.
        try:
            ttt.make_move( int( input( "Player {}, pick a square: ".format( ttt.current_player ) ) ) )
        except ValueError as e:
            print( e )

    # When the loop finishes, determine if there was a winner and show an
    # appropriate message. Note that is_full() cannot be used here because
    # the last move may both fill the board and win the game.
    show( ttt )
    if ttt.winner() == ' ':
        print( "Tie game." )
    else:
        print( "Player {} wins!".format( ttt.winner() ) )


def show( ttt ):
    """Shows the Tic Tac Toe board using some not-too-fancy ASCII Art.

    :param TicTacToeModel ttt: An instance of the Tic Tac Toe Model class.
    :return: None
    """
    print( "\n{}|{}|{}\n-+-+-\n{}|{}|{}\n-+-+-\n{}|{}|{}\n".format(
        ttt.player_at( 1 ), ttt.player_at( 2 ), ttt.player_at( 3 ),
        ttt.player_at( 4 ), ttt.player_at( 5 ), ttt.player_at( 6 ),
        ttt.player_at( 7 ), ttt.player_at( 8 ), ttt.player_at( 9 ) ) )


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()
