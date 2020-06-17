"""CS 210, Introduction to Programming, Fall 2015, Dr. Bower.

This version of Tic Tac Toe is played in a GUI with a drawing widget.

Documentation: None.
"""

# Import any one of the Tic Tac Toe Models.
# from ModelList import TicTacToeModel
# from ModelNestedLists import TicTacToeModel
from ModelString import TicTacToeModel

# Import GUI and remaining modules.
from DrawGui import Ui_TicTacToe as Gui
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

    This version implements the Tic Tac Toe game using a drawing widget.
    """

    def __init__( self ):
        """Initialize the gui."""
        # Create the main window in which the gui will display.
        self.main_window = QtGui.QWidget()

        # Create an instance of our gui and set it up in the main window.
        self.gui = Gui()
        self.gui.setupUi( self.main_window )

        # Set the drawing widget's mouse press method to use this application's method.
        self.gui.drawing_widget.mousePressEvent = self.mouse_press

        # Set the drawing widget's paint method to use this application's paint method.
        self.gui.drawing_widget.paintEvent = self.paint_event

        # Create a new instance of the Tic Tac Toe model.
        self.ttt = TicTacToeModel()

    def mouse_press( self, event ):
        """Called automatically whenever the drawing widget is clicked.

        :param PyQt.QtGui.QMouseEvent event: The event object from PyQt.
        :return: None
        """
        # Determine which square was clicked.
        w = self.gui.drawing_widget.width() // 3
        h = self.gui.drawing_widget.height() // 3
        square = event.y() // h * 3 + event.x() // w + 1

        # Use a try/except in case the user clicks on an already occupied square.
        try:
            self.ttt.make_move( square )

            # If the move was successful, update the status label.
            if self.ttt.winner() in "XO":
                self.gui.status_label.setText( "Player {} wins!".format( self.ttt.winner() ) )
            elif self.ttt.is_full():
                self.gui.status_label.setText( "Tie game." )
            else:
                self.gui.status_label.setText( "Player {}'s turn...".format( self.ttt.current_player ) )

        except ( ValueError, RuntimeError ) as e:
            # The error is ignored and it will remain the same player's turn.
            pass

        # Update the drawing widget, which causes the system to call paint_event.
        self.gui.drawing_widget.update()

    def paint_event( self, event ):
        """Called automatically whenever the drawing widget needs to repaint.

        :param PyQt.QtGui.QPaintEvent event: The event object from PyQt (not used).
        :return: None
        """
        # Get a QPainter object that can paint on the drawing widget.
        painter = QtGui.QPainter( self.gui.drawing_widget )
        painter.setBrush( QtCore.Qt.black )  # The brush determines the fill color.
        painter.setPen( QtCore.Qt.black )    # The pen determines the outline color.

        # Draw the grid lines.
        w = self.gui.drawing_widget.width()
        h = self.gui.drawing_widget.height()
        painter.drawLine( w // 3, 0, w // 3, h )
        painter.drawLine( w * 2 // 3, 0, w * 2 // 3, h )
        painter.drawLine( 0, h // 3, w, h // 3 )
        painter.drawLine( 0, h * 2 // 3, w, h * 2 // 3 )

        # Increase the font size and determine the necessary offset.
        f = painter.font()
        f.setPointSize( min( w, h ) // 6 )
        painter.setFont( f )
        fm = painter.fontMetrics()
        dx = fm.width( "X" ) // 2
        dy = fm.height() // 3

        # Draw the contents of the board.
        for square in range( 1, 10 ):
            # Only draw X and O (i.e., don't draw the digits).
            if self.ttt.player_at( square ) in "XO":
                x = ( square - 1 ) % 3 * w // 3 + w // 6
                y = ( square - 1 ) // 3 * h // 3 + h // 6
                painter.drawText( x - dx, y + dy, self.ttt.player_at( square ) )


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()
