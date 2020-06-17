"""CS 210, Introduction to Programming, Fall 2015, _YOUR_NAME_HERE_.

Instructor: Dr. Bower / Col Gibson / LtCol Harder / LtCol (Ret) Christman

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

# TODO: Modify this import statement as necessary for your own project structure.
from Labs.Lab34_AviaryGui import Ui_Aviary as Gui
from PyQt4 import QtCore, QtGui
import math
import random
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


class Bird( object ):
    """Class to represent a bird with (x,y) coordinates.

    This will serve as the parent class for more specific sub classes.
    """
    SIZE = 8

    def __init__( self, x=0, y=0 ):
        """Create a new Bird with the given x and y values.

        :param int x: The x-coordinate; default is zero.
        :param int y: The y-coordinate; default is zero.
        """
        # All Bird objects have x and y attributes for their current position in the aviary.
        self.x = x
        self.y = y

        # All bird classes should set their own colors, but defaults are provided here.
        self.fill_color = QtCore.Qt.white
        self.line_color = QtCore.Qt.black

    def __str__( self ):
        """Build and return a string representation of the object.

        :return: A string representation of this Bird in the format "(x,y)".
        :rtype: str
        """
        return "({},{})".format( self.x, self.y )

    def draw( self, painter ):
        """Draw this Bird object using the given QPainter.

        :param QtGui.QPainter painter: The QPainter object to do the drawing.
        :return: None
        """
        # All birds are drawn as filled ellipses.
        painter.setBrush( self.fill_color )
        painter.setPen( self.line_color )
        painter.drawEllipse( self.x - Bird.SIZE // 2, self.y - Bird.SIZE // 2, Bird.SIZE, Bird.SIZE )

    def move( self, w, h ):
        """Moves the bird.

        :param int w: The width of the aviary.
        :param int h: The height of the aviary.
        :return: None
        """
        raise AttributeError( "All birds must implement the move( self, w, h ) method." )


class Cardinal( Bird ):
    """Class to represent a Cardinal."""

    def __init__( self, x, y ):
        """Create a new Cardinal with the given x and y values.

        :param int x: The x-coordinate; default is zero.
        :param int y: The y-coordinate; default is zero.
        """
        # Pass the x and y values up to the super class constructor.
        super().__init__( x, y )

        # Cardinal are red with a white outline.
        self.fill_color = QtCore.Qt.red
        self.line_color = QtCore.Qt.white

        # An attribute to control the Cardinal's movement.
        self.dx = random.randint( 2, 5 )

    def move( self, w, h ):
        """A Cardinal flies straight across the aviary, left-to-right.

        When the Cardinal reaches the right edge of the aviary, it flies past
        for a bit and then returns to the aviary on the left edge, as if it
        had flown around the back side of the aviary and came back into view.

        :param int w: The width of the aviary.
        :param int h: The height of the aviary.
        :return: None
        """
        self.x += self.dx

        # Fly a little way past the right edge so it's off the screen for a bit.
        if self.x > w + Bird.SIZE * 8:
            # Reset a bit off the left edge so it reappears gradually.
            self.x = -Bird.SIZE
            self.y = random.choice([-1, 1]) * random.randint(Bird.SIZE, Bird.SIZE * 3) + self.y


class Hummingbird( Bird ):
    """Class to represent a Hummingbird."""

    def __init__( self, x, y ):
        """Create a new Hummingbird with the given x and y values.

        :param int x: The x-coordinate; default is zero.
        :param int y: The y-coordinate; default is zero.
        """
        # Pass the x and y values up to the super class constructor.
        super().__init__( x, y )

        # Vulture are black with a black outline.
        self.fill_color = QtCore.Qt.green
        self.line_color = QtCore.Qt.red

        # A few attributes to control the Vulture's movement.
        self.center_x = self.x
        self.center_y = self.y
        self.time = random.randint( 0, 360 )
        self.radius = random.randint( 10, 20 )

    def move( self, w, h ):
        """A Hummingbird flies in a circle centered around it's x,y coordinate.

        :param int w: The width of the aviary.
        :param int h: The height of the aviary.
        :return: None
        """
        # Increment the vulture's flight time so the calculations below will update.
        self.time += 1
        # The sin and cos functions produce a values between -1 and 1 that define the unit circle.
        # Multiplying this by self.radius results in a value between +/- self.radius.  Adding the
        # values of self.center_x and self.center_y centers the circular path at this point.
        self.x = math.sin( math.radians( self.time ) ) * self.radius + self.center_x
        self.y = math.cos( math.radians( self.time ) ) * self.radius + self.center_y

class Dodo( Bird ):
    """Class to represent a Dodo bird."""

    def __init__( self, x, y ):
        """Create a new Dodo with the given x and y values.

        :param int x: The x-coordinate; default is zero.
        :param int y: The y-coordinate; default is zero.
        """
        # Pass the x and y values up to the super class constructor.
        super().__init__( x, y )

        # Dodos are light gray with a dark gray outline.
        self.fill_color = QtCore.Qt.lightGray
        self.line_color = QtCore.Qt.darkGray

        # A few attributes to control the Dodo bird's movement.
        self.dx = random.randint( 1, 3 ) * random.choice( [ -1, 1 ] )
        self.dy = random.randint( 1, 3 ) * random.choice( [ -1, 1 ] )

    def move( self, w, h ):
        """A Dodo bird flies in straight lines and bounces off the walls of the aviary.

        :param int w: The width of the aviary.
        :param int h: The height of the aviary.
        :return: None
        """
        self.x += self.dx
        self.y += self.dy

        if self.x < 0 or self.x > w:
            self.dx *= -1

        if self.y < 0 or self.y > h:
            self.dy *= -1


class Vulture( Bird ):
    """Class to represent a Vulture."""

    def __init__( self, x, y ):
        """Create a new Vulture with the given x and y values.

        :param int x: The x-coordinate; default is zero.
        :param int y: The y-coordinate; default is zero.
        """
        # Pass the x and y values up to the super class constructor.
        super().__init__( x, y )

        # Vulture are black with a black outline.
        self.fill_color = QtCore.Qt.black
        self.line_color = QtCore.Qt.black

        # A few attributes to control the Vulture's movement.
        self.center_x = self.x
        self.center_y = self.y
        self.time = random.randint( 0, 360 )
        self.radius = random.randint( 64, 128 )

    def move( self, w, h ):
        """A Vulture flies in a circle centered around it's x,y coordinate.

        :param int w: The width of the aviary.
        :param int h: The height of the aviary.
        :return: None
        """
        # Increment the vulture's flight time so the calculations below will update.
        self.time += 1
        # The sin and cos functions produce a values between -1 and 1 that define the unit circle.
        # Multiplying this by self.radius results in a value between +/- self.radius.  Adding the
        # values of self.center_x and self.center_y centers the circular path at this point.
        self.x = math.sin( math.radians( self.time ) ) * self.radius + self.center_x
        self.y = math.cos( math.radians( self.time ) ) * self.radius + self.center_y


class Canary( Bird ):
    """Class to represent a Canary."""

    def __init__( self, x, y ):
        """Create a new Canary with the given x and y values.

        :param int x: The x-coordinate; default is zero.
        :param int y: The y-coordinate; default is zero.
        """
        # Pass the x and y values up to the super class constructor.
        super().__init__( x, y )

        # Canaries are yellow with a black outline.
        self.fill_color = QtCore.Qt.yellow
        self.line_color = QtCore.Qt.black

        # An attribute to control the Cardinal's movement.
        self.dx = random.randint( 2, 5 )

    def move( self, w, h ):
        """A Cardinal flies straight across the aviary, left-to-right.

        When the Cardinal reaches the right edge of the aviary, it flies past
        for a bit and then returns to the aviary on the left edge, as if it
        had flown around the back side of the aviary and came back into view.

        :param int w: The width of the aviary.
        :param int h: The height of the aviary.
        :return: None
        """
        self.x -= self.dx

        # Fly a little way past the right edge so it's off the screen for a bit.
        if self.x < -Bird.SIZE * 8:
            # Reset a bit off the left edge so it reappears gradually.
            self.x = Bird.SIZE + w
            self.y = random.randint( Bird.SIZE, h - Bird.SIZE )

class App( object ):
    """Application class to create and control the gui."""

    def __init__( self ):
        """Initialize the gui."""
        # Create the main window in which our gui will display.
        self.main_window = QtGui.QWidget()  # QMainWindow() for menu and status bar.

        # Create an instance of our gui and set it up in the main window.
        self.gui = Gui()  # Generic name "Gui" from "as Gui" clause of import statement.
        self.gui.setupUi( self.main_window )

        # Catch mouse press events to be able to click on the map.
        self.gui.drawing_widget.mousePressEvent = self.mouse_press
        # Catch the paint event so the spots can be drawn.
        self.gui.drawing_widget.paintEvent = self.paint_event

        # Create a list of birds to fly in the aviary. The starting size of the GUI is 640x480
        # which makes the drawing widget 620x460. I hate to use hard-coded literal values, but
        # there is no way to get the size from the drawing widget before the window shows.
        self.birds = []
        self.birds.append( Cardinal( random.randint( 20, 600 ), random.randint( 60, 400 ) ) )
        self.birds.append( Cardinal( random.randint( 20, 600 ), random.randint( 60, 400 ) ) )
        self.birds.append( Cardinal( random.randint( 20, 600 ), random.randint( 60, 400 ) ) )
        self.birds.append( Dodo( random.randint( 20, 600 ), random.randint( 60, 400 ) ) )
        self.birds.append( Dodo( random.randint( 20, 600 ), random.randint( 60, 400 ) ) )
        self.birds.append( Dodo( random.randint( 20, 600 ), random.randint( 60, 400 ) ) )
        self.birds.append( Vulture( random.randint( 20, 600 ), random.randint( 60, 400 ) ) )
        self.birds.append( Vulture( random.randint( 20, 600 ), random.randint( 60, 400 ) ) )
        self.birds.append( Vulture( random.randint( 20, 600 ), random.randint( 60, 400 ) ) )
        self.birds.append( Canary( random.randint( 20, 600 ), random.randint( 60, 400 ) ) )
        self.birds.append( Canary( random.randint( 20, 600 ), random.randint( 60, 400 ) ) )
        self.birds.append( Hummingbird( random.randint( 20, 600 ), random.randint( 60, 400 ) ) )
        self.birds.append( Hummingbird( random.randint( 20, 600 ), random.randint( 60, 400 ) ) )

        # Create a QTimer object to control the animation.
        self.timer = QtCore.QTimer()
        # Connect the move_birds method so it executes when the timer goes off.
        self.timer.timeout.connect( self.move_birds )
        # The timer goes off every 33 milliseconds; roughly a 30 frames-per-second animation.
        self.timer.start( 33 )

    def mouse_press( self, event ):
        """Called automatically when the user presses the mouse button on the drawing widget.

        :param PyQt.QtGui.QMouseEvent event: The event object from PyQt.
        :return: None
        """
        # If the timer is active, stop it; otherwise, start it.
        if self.timer.isActive():
            self.timer.stop()
        else:
            self.timer.start( 33 )  # Roughly a 30 frames-per-second animation.

    def paint_event( self, q_paint_event ):
        """Called automatically whenever the drawing widget needs to repaint.

        :param PyQt.QtGui.QPaintEvent q_paint_event: The event object from PyQt (not used).
        """
        # Get a QPainter object that can paint on the drawing widget.
        painter = QtGui.QPainter( self.gui.drawing_widget )

        for bird in self.birds:
            bird.draw( painter )

    def move_birds( self ):
        """Move all the birds, then update the drawing widget."""
        # Pass the current width and height of the drawing widget to each bird as it moves.
        w, h = self.gui.drawing_widget.width(), self.gui.drawing_widget.height()

        for bird in self.birds:
            bird.move( w, h )

        # Update the drawing widget, which causes the system to call paint_event.
        self.gui.drawing_widget.update()


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()
