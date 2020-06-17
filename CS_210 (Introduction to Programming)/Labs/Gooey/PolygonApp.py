"""CS 210, Introduction to Programming, Fall 2015, Jake Orner.

Instructor: Dr. Bower

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

from PolygonGui import Ui_PolygonGui as Gui
from PyQt4 import QtCore, QtGui
import sys, math


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

    MARGIN = 32  # A class attribute to specify a good looking margin

    def __init__( self ):
        """Initialize the gui."""
        # Create the main window in which our gui will display.
        self.main_window = QtGui.QWidget()  # QMainWindow() for menu and status bar.

        # Create an instance of our gui and set it up in the main window.
        self.gui = Gui()  # Generic name "Gui" from "as Gui" clause of import statement.
        self.gui.setupUi( self.main_window )

        #  Connect the buttons to methods in this application
        self.gui.triangle_button.clicked.connect( self.create_triangle )
        self.gui.square_button.clicked.connect( self.create_square )
        self.gui.rhombus_button.clicked.connect( self.create_rhombus )
        self.gui.blank_button.clicked.connect( self.create_blank )

        #  Sets the drawing widgets paint method to use this application's paint method
        self.gui.drawing_widget.paintEvent = self.paint_event

        #  Set the drawing widget's mouse press method to use this application's method.
        self.gui.drawing_widget.mousePressEvent = self.mouse_press_event

        #  Beyond the Gui components, our Polygon app needs a QPolygon object.
        self.polygon = QtGui.QPolygon()

    def paint_event( self, event ):
        """Called automatically when the drawing widget needs painting

        :param QtGui.QPaintEvent event: An event object created by the system
        """
        #  Get a QPainter object that can paint on the drawing widget.
        painter = QtGui.QPainter( self.gui.drawing_widget)
        painter.setBrush( QtCore.Qt.blue )  # The brush determines the fill color
        painter.setPen( QtCore.Qt.blue )  # The pen determines the outline color
        painter.drawPolygon( self.polygon )  # Draws the previously created polygon

    def mouse_press_event( self, event ):
        """Called automatically when the drawing widget is clicked.

        : param QtGui.QMouseEvent event: An event object created by the system.
        """
        # Get the x and y coordinates of the click point.
        x, y = event.x(), event.y()

        # Find the point in the polygon closest to the click point.
        index = 0  # Index of the closest point
        point = self.polygon.first()  # The closest point so far.
        distance = math.hypot( x - point.x(), y - point.y() )
        # Loop through the remaining points in the polygon
        for i in range( 1, self.polygon.count() ):
            # Get a point from the polygon and check its distance from (x,y).
            point = self.polygon.point( i )
            if math.hypot( x - point.x(), y - point.y() ) < distance:
                # If it's closer, save the distance and the index.
                distance = math.hypot( x - point.x(), y - point.y() )
                index = i

        if self.polygon.size() < 3:
            self.gui.append_radio.click()

        if self.gui.replace_radio.isChecked():
            if self.polygon.size() > 2:
                # Replace the closest point with a new point at coordinate (x,y).
                self.polygon.replace( index, QtCore.QPoint( event.x(), event.y() ) )
            else:
                print("Stop trying to crash me")
        elif self.gui.append_radio.isChecked():
            self.polygon.append( QtCore.QPoint( event.x(), event.y() ) )
        else:
            # Insert a new point at coordinate (x,y) in front of the closest point.
            self.polygon.insert( index, QtCore.QPoint( event.x(), event.y() ) )

        # Update the drawing widget, which causes the system to call paint_event.
        self.gui.drawing_widget.update()

    def create_triangle( self ):
        """Create a triangle polygon to be drawn on the drawing widget."""
        # Get the width and height of the drawing widget.
        w = self.gui.drawing_widget.width() - 1
        h = self.gui.drawing_widget.height() - 1

        # Set the points of the polygon object to the three triangle vertices.
        self.polygon.setPoints( [ App.MARGIN, h - App.MARGIN, w // 2, App.MARGIN, w - App.MARGIN, h - App.MARGIN ] )

        # Update the drawing widget, which causes the system to call paint_event.
        self.gui.drawing_widget.update()

    def create_square( self ):
        """Create a square polygon to be drawn on the drawing widget."""
        # Get the width and height of the drawing widget.
        w = self.gui.drawing_widget.width() - 1
        h = self.gui.drawing_widget.height() - 1

        # Calculate the center and the size of the square
        x = w // 2
        y = h // 2
        s = min( x, y ) - App.MARGIN

        # Set the points of the polygon to the four corners of the square
        self.polygon.setPoints( [ x - s, y - s, x + s, y - s, x + s, y + s, x - s, y + s ] )

        # Update the drawing widget, which causes the system to call paint_event.
        self.gui.drawing_widget.update()

    def create_rhombus( self ):
        """Create a square polygon to be drawn on the drawing widget."""
        # Get the width and height of the drawing widget.
        w = self.gui.drawing_widget.width() - 1
        h = self.gui.drawing_widget.height() - 1

        # Calculate the center and the size of the rhombus
        x = w // 2
        y = h // 2
        s = min( x, y ) - App.MARGIN
        self.polygon.setPoints( [ App.MARGIN, y, w // 2, App.MARGIN, w - App.MARGIN, y, w // 2, h - App.MARGIN ] )

        # Update the drawing widget, which causes the system to call paint_event.
        self.gui.drawing_widget.update()

    def create_blank( self ):
        """Create's a blank widget."""
        # Clears the drawing
        self.polygon.clear()

        self.gui.append_radio.click()

        # Update the drawing widget, which causes the system to call paint_event.
        self.gui.drawing_widget.update()


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()
