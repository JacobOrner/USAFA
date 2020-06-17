"""CS 210, Introduction to Programming, Fall 2015, Jake Orner.

Instructor: Dr. Bower

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

from Labs.Gooey.TemperatureGui import Ui_TemperatureGui as Gui
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
    """Application class to create and control the gui."""

    def __init__( self, title="Temperature Conversion" ):
        """Initialize the gui."""
        # Create the main window in which our gui will display.
        self.main_window = QtGui.QWidget()  # QMainWindow() for menu and status bar.

        # Create an instance of our gui and set it up in the main window.
        self.gui = Gui()  # Generic name "Gui" from "as Gui" clause of import statement.
        self.gui.setupUi( self.main_window )

        # Set the connections between the gui components and this application.
        self.gui.f_to_c_button.clicked.connect( self.f_to_c )
        self.gui.c_to_f_button.clicked.connect( self.c_to_f )

        #  Set a few properties of the main window containing our gui
        self.main_window.setWindowTitle( title )
        self.main_window.setGeometry( 40, 40, 200, 150 )

    def f_to_c( self ):
        """Convert from fahrenheit to celsius."""
        f = float( self.gui.fahrenheit_edit.text() )
        c = float(((f - 32) * (5 / 9)))
        self.gui.celsius_edit.setText( str( c ) )

    def c_to_f( self ):
        """Convert from celsius to fahrenheit."""
        c = float( self.gui.celsius_edit.text() )
        f = float(((c * (9 / 5)) + 32))
        self.gui.fahrenheit_edit.setText( str( f ) )

# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()
