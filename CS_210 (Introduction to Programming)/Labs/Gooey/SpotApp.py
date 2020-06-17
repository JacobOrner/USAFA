"""CS 210, Introduction to Programming, Fall 2015, Jake Orner.

Instructor: Dr. Bower

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

from Labs.Gooey.SpotGui import Ui_SpotGui as Gui
from PyQt4 import QtCore, QtGui
import math
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


# TODO 0a: Read, discuss, and understand the following code.
class Spot:
    """Spot class for representing a spot with (x,y) coordinates and color."""

    # The COLORS dictionary is a class attribute, available to all instances.
    COLORS = { "Red": QtGui.QColor( 255, 0, 0 ), "Green": QtGui.QColor( 0, 255, 0 ),
               "Blue": QtGui.QColor( 0, 0, 255 ), "Yellow": QtGui.QColor( 255, 255, 0 ),
               "Cyan": QtGui.QColor( 0, 255, 255 ), "Magenta": QtGui.QColor( 255, 0, 255 ) }

    def __init__( self, x=0, y=0, r=16, c="Blue" ):
        """Create a new Spot with the given x, y, and color values.

        :param int x: The x-coordinate; default is zero.
        :param int y: The y-coordinate; default is zero.
        :param int r: The radius; default is 16.
        :param str c: The color name; default is "Blue";  must be a key value in COLORS dictionary.
        """
        # Assign the values passed as parameters as attributes of self.
        self.x, self.y, self.r, self.c = x, y, r, c

    def __str__( self ):
        """Build and return a string representation of the object.

        :return: A string representation of this Spot in the format "(x,y):color".
        :rtype: str
        """
        return "({},{}):{}:{}".format( self.x, self.y, self.r, self.c )

    def draw( self, painter ):
        """Draw this Spot object using the given QPainter.

        :param QtGui.QPainter painter: The QPainter object to do the drawing.
        :return: None
        """
        # Use the COLORS dictionary to get a QColor object for the painter.
        painter.setBrush( Spot.COLORS[ self.c ] )  # The brush determines the fill color.
        painter.setPen( Spot.COLORS[ self.c ] )    # The pen determines the outline color.
        # The parameters to drawEllipse are the (x,y) of the upper-left corner and width, height.
        painter.drawEllipse( self.x - self.r, self.y - self.r, self.r * 2, self.r * 2 )


class App:
    """Application class to create and control the gui."""

    def __init__( self ):
        """Initialize the gui."""
        # Create the main window in which our gui will display.
        self.main_window = QtGui.QMainWindow()  # QMainWindow() for menu and status bar.

        # Create an instance of our gui and set it up in the main window.
        self.gui = Gui()  # Generic name "Gui" from "as Gui" clause of import statement.
        self.gui.setupUi( self.main_window )

        # TODO 0b: Read, discuss, and understand the following code.
        # Connect the menu buttons to methods.
        self.gui.action_exit.triggered.connect( self.main_window.close )
        self.gui.action_add_spot.triggered.connect( self.add_spot )
        self.gui.action_del_spot.triggered.connect( self.del_spot )
        self.gui.action_about.triggered.connect( self.about )

        # Connect the color button group to know when any button in the group is clicked.
        self.gui.color_group.buttonClicked.connect( self.button_clicked )
        # Catch mouse press events to be able to click on the map.
        self.gui.drawing_widget.mousePressEvent = self.mouse_press
        # Catch the mouse move events to be able to drag spots.
        self.gui.drawing_widget.mouseMoveEvent = self.mouse_move
        # Catch the paint event so the spots can be drawn.
        self.gui.drawing_widget.paintEvent = self.paint_event

        # All Spot objects are kept in a list.
        self.spots = []
        # The current Spot, if one has been clicked.
        self.current_spot = None

        # An attribute to determine if mouse move events are moving or sizing a spot.
        self.moving = True

    def add_spot( self ):
        """Adds a new spot when the Spot --> Add menu item is selected."""
        # TODO 0c: Read, discuss, and understand the following code.
        # The QInputDialog works fine, but for reasons I cannot figure out, PyCharm shows warnings.
        radius, ok_button = QtGui.QInputDialog.getInt( self.main_window, "Input", "Enter radius:", 16 )
        if ok_button:
            # Get the width and height of the drawing widget.
            w, h = self.gui.drawing_widget.width(), self.gui.drawing_widget.height()
            # Create a new Spot object in the middle of the drawing widget with the selected color.
            self.current_spot = Spot( w // 2, h // 2, radius, self.gui.color_group.checkedButton().text() )
            # Append the spot to the list of spots so it can be drawn in paint_event.
            self.spots.append( self.current_spot )
            # Show a message about the new spot in the status bar.
            self.gui.statusbar.showMessage( "New Spot: {}".format( self.current_spot ) )
            # Update the drawing widget, which causes the system to call paint_event.
            self.gui.drawing_widget.update()

    def del_spot( self ):
        """Deletes the current spot when the Spot --> Delete menu item is selected."""
        if self.current_spot is not None:
            self.gui.statusbar.showMessage( "Spot: {}".format( self.current_spot ) )
            self.spots.remove( self.current_spot )
            self.current_spot = self.spots[-1]
            self.gui.drawing_widget.update()

    def button_clicked( self, button ):
        """Called automatically when any button in the color button group is clicked.

        If a spot is currently selected, it's color is changed.
        Also, new spots will be created with this color.

        :param QtGui.QRadioButton button: The button that was clicked.
        :return: None
        """
        # TODO 0d: Read, discuss, and understand the following code.
        # Make sure there is a currently selected spot.
        if self.current_spot is not None:
            # Set the current spot's color to the color name on the button.
            self.current_spot.c = button.text()
            # Update the drawing widget, which causes the system to call paint_event.
            self.gui.drawing_widget.update()

    def mouse_press( self, event ):
        """Called automatically when the user presses the mouse button on the drawing widget.

        Sets the application's current spot to the one clicked; None if the click was not on a spot.

        :param PyQt.QtGui.QMouseEvent event: The event object from PyQt.
        :return: None
        """
        # TODO 0e: Read, discuss, and understand the following code.
        # Get the (x,y) coordinate of the click.
        x, y = event.x(), event.y()

        # Find the Spot object at the click.
        index = 0
        self.current_spot = None
        while index < len( self.spots ) and self.current_spot is None:
            if math.hypot( x - self.spots[ index ].x, y - self.spots[ index ].y ) < self.spots[ index ].r:
                self.current_spot = self.spots[ index ]
            index += 1

        # Ensure the click was on a spot.
        if self.current_spot is not None:
            # TODO 2a: Set the self.moving attribute as described in the lab document.
            if self.current_spot.r / 2 >= math.hypot( x - self.current_spot.x, y - self.current_spot.y ):
                self.moving = True
            else:
                self.moving = False

        # Show a message in the status bar; if current_spot is None, this shows "None".
        self.gui.statusbar.showMessage( "Spot at ({},{}): {}".format( x, y, self.current_spot ) )
        # Update the drawing widget, which causes the system to call paint_event.
        self.gui.drawing_widget.update()

    def mouse_move( self, event ):
        """Called automatically when the user moves the mouse while holding a button down.

        :param PyQt.QtGui.QMouseEvent event: The event object from PyQt.
        :return: None
        """
        # TODO 0f: Read, discuss, and understand the following code.
        if self.current_spot is not None:
            # Get the (x,y) coordinate of the mouse event.
            x, y = event.x(), event.y()

            if self.moving:
                # Move the spot to the coordinate of the mouse event.
                self.current_spot.x, self.current_spot.y = x, y
            else:
                # TODO 2b: Resize the spot based on the coordinate of the mouse event.
                self.current_spot.r = math.hypot(x - self.current_spot.x, y - self.current_spot.y)

            # Update the drawing widget, which causes the system to call paint_event.
            self.gui.drawing_widget.update()

    def about( self ):
        """Shows the about dialog."""
        # TODO 0g: Read, discuss, and understand the following code.
        # The QMessageBox works fine, but for reasons I cannot figure out, PyCharm shows warnings.
        QtGui.QMessageBox.about( self.main_window, "About", "CS 210, Fall 2015, Spots\n\nAuthor: Dr. Bower" )

    def paint_event( self, q_paint_event ):
        """Called automatically whenever the drawing widget needs to repaint.

        :param PyQt.QtGui.QPaintEvent q_paint_event: The event object from PyQt (not used).
        """
        # TODO 0h: Read, discuss, and understand the following code.
        # Get a QPainter object that can paint on the drawing widget.
        painter = QtGui.QPainter( self.gui.drawing_widget )

        # Draw the spots.
        for spot in self.spots:
            spot.draw( painter )

        if self.current_spot is not None:
            # Re-draw the current spot to ensure it is on top of any other spots.
            self.current_spot.draw( painter )
            # Draw a small white circle in the center to indicate it is the current spot.
            painter.setBrush( QtCore.Qt.white )  # The brush determines the fill color.
            painter.setPen( QtCore.Qt.white )    # The pen determines the outline color.
            # The parameters to drawEllipse are the (x,y) of the upper-left corner and width, height.
            painter.drawEllipse( self.current_spot.x - 2, self.current_spot.y - 2, 4, 4 )


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()