"""CS 210, Introduction to Programming, Fall 2015, Dr. Bower.

This version of Tic Tac Toe is played in a GUI with buttons.

Documentation: None.
"""

# Import any one of the Tic Tac Toe Models.
# from ModelList import TicTacToeModel
from ModelNestedLists import TicTacToeModel
# from ModelString import TicTacToeModel

# Import GUI and remaining modules.
from ButtonsGui import Ui_TicTacToe as Gui
from PyQt4 import QtCore, QtGui
import sys


def main():
    """Launch a GUI created with Qt Designer."""
    # Create a QApplication to handle event processing.
    qt_app = QtGui.QApplication( sys.argv )

    # Create an instance of the app and show the main window.
    my_app = App()
    my_app.main_window.show()

    # Execute the QApplication, exiting when it returns (i.e., the window is closed).
    sys.exit( qt_app.exec_() )  # Note the underscore at the end of exec_().


class App:
    """Application class to create and control the gui.

    This version implements the Tic Tac Toe game using a grid of buttons.
    """

    def __init__( self ):
        """Initialize the gui."""
        # Create the main window in which the gui will display.
        self.main_window = QtGui.QWidget()

        # Create an instance of our gui and set it up in the main window.
        self.gui = Gui()
        self.gui.setupUi( self.main_window )

        # Connect the buttons to the make_move method using lambda functions to allow passing arguments.
        # The lambda expressions are short, anonymous function definitions that are not executed until
        # the button is actually clicked. See https://en.wikipedia.org/wiki/Lambda_(programming)
        self.gui.button_1.clicked.connect( lambda: self.make_move( 1, self.gui.button_1 ) )
        self.gui.button_2.clicked.connect( lambda: self.make_move( 2, self.gui.button_2 ) )
        self.gui.button_3.clicked.connect( lambda: self.make_move( 3, self.gui.button_3 ) )
        self.gui.button_4.clicked.connect( lambda: self.make_move( 4, self.gui.button_4 ) )
        self.gui.button_5.clicked.connect( lambda: self.make_move( 5, self.gui.button_5 ) )
        self.gui.button_6.clicked.connect( lambda: self.make_move( 6, self.gui.button_6 ) )
        self.gui.button_7.clicked.connect( lambda: self.make_move( 7, self.gui.button_7 ) )
        self.gui.button_8.clicked.connect( lambda: self.make_move( 8, self.gui.button_8 ) )
        self.gui.button_9.clicked.connect( lambda: self.make_move( 9, self.gui.button_9 ) )

        # Create a new instance of the Tic Tac Toe model.
        self.ttt = TicTacToeModel()

    def make_move( self, square, button ):
        """Called when one of the buttons is clicked.

        :param int square: Integer value indicating a square on the board.
        :param QtGui.QPushButton button: The button that was clicked.
        :return: None
        """
        # Use a try/except in case the user clicks on an already occupied square.
        try:
            # Get the current player before attempting to make the move
            # because a successful move changes the current player.
            player = self.ttt.current_player

            # Attempt to make the move.
            self.ttt.make_move( square )

            # If the move was successful, update the button and status label.
            button.setText( player )
            if self.ttt.winner() in "XO":
                self.gui.status_label.setText( "Player {} wins!".format( self.ttt.winner() ) )
            elif self.ttt.is_full():
                self.gui.status_label.setText( "Tie game." )
            else:
                self.gui.status_label.setText( "Player {}'s turn...".format( self.ttt.current_player ) )

        except ( ValueError, RuntimeError ) as e:
            # The error is ignored and it will remain the same player's turn.
            pass


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()
