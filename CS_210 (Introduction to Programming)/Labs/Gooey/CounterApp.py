"""CS 210, Introduction to Programming, Fall 2015, Jake Orner.

Instructor: Dr. Bower / Col Gibson / LtCol Harder / LtCol (Ret) Christman

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

from CounterGui import Ui_CounterGUI as Gui
from PyQt4 import QtCore, QtGui
import sys


def main():
    """Launch a GUI created with Qt Designer."""
    # Create a QApplication to handle event processing.
    qt_app = QtGui.QApplication( sys.argv )

    # Create an instance of the app and show the main window.
    my_app = App( "Blue" )
    my_app.main_window.show()

    my_app2 = App( "Silver", 300 )
    my_app2.main_window.show()

    # Execute the QApplication, exiting when it returns (i.e., the window is closed).
    sys.exit( qt_app.exec_() )  # Note the underscore at the end of exec_().


class App:
    """Application class to create and control the gui."""

    def __init__( self, title="Counter", x=40, y=40, w=200, h=150 ):
        """Initialize the gui."""
        # Create the main window in which our gui will display.
        self.main_window = QtGui.QWidget()  # QMainWindow() for menu and status bar.

        # Create an instance of our gui and set it up in the main window.
        self.gui = Gui()  # Generic name "Gui" from "as Gui" clause of import statement.
        self.gui.setupUi( self.main_window )

        #  Set the connections between the gui components and this application.
        self.gui.increment_button.clicked.connect( self.increment )
        self.gui.decrement_button.clicked.connect( self. decrement )
        self.gui.reset_button.clicked.connect( self.reset )

        #  Set a few properties of the main window containing our gui.
        self.main_window.setWindowTitle( title )
        self.main_window.setGeometry( x, y, w, h )

        #  Beyond the gui components, our CounterApp needs a counter attirbute.
        self.counter = 0

    def increment( self ):
        """Increment the counter and update the gui."""
        self.counter += 1
        self.gui.count_label.setText( str( self.counter ) )

    def decrement( self ):
        """Decrement the counter and update the gui."""
        self.counter -= 1
        self.gui.count_label.setText( str( self.counter ) )

    def reset( self ):
        """Reset the counter and update the gui."""
        self.counter = 0
        self.gui.count_label.setText( str( self.counter ) )

# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()