"""CS 210, Introduction to Programming, Fall 2015, Jake Orner.

Instructor: Dr. Bower

Documentation: None
=======================================================================
"""

from PEXes.PEX3.PEX3_StarGui import Ui_StarGui as Gui
from PyQt4 import QtCore, QtGui
import sys
import math


def main():
    """Launch a GUI created with Qt Designer."""
    # Create a QApplication to handle event processing.
    qt_app = QtGui.QApplication( sys.argv )

    # Create an instance of the app and show the main window.
    my_app = App()
    my_app.main_window.show()

    # Execute the QApplication, exiting when it returns (i.e., the window is closed).
    sys.exit( qt_app.exec_() )  # Note the underscore at the end of exec_().


class Star:
    """Star class for representing a star with (x,y) coordinates, color, Draper number, Harvard Revised number, and
    (if applicable) name"""

    def __init__( self, data ):
        """Create a new Star with given x, y, draper number, harvard number, and name.

        :param str data: The data for the star to be created
        """

        star_data = data.strip().split()
        self.x, self.y, self.z, = float(star_data[0]), float(star_data[1]), float(star_data[2])
        self.magnitude = float(star_data[3])
        self.brightness = 255 * 2.512 ** -self.magnitude * 10
        self.draper_number, self.harvard_number = int(star_data[4]), int(star_data[5])

        if len(star_data) > 6:
            self.name = " ".join( [ str( n ) for n in star_data[6:len(star_data)] ] )
        else:
            self.name = ""

    def __str__( self ):
        """Build a string representation of the object.

        :return: A representation of the Star in the format Star at (x,y); x y z c draper number harvard revised name
        :rtype: str
        """

        return "{} {} {} {:.2f} {} {} {}".format( self.x, self.y, self.z, self.magnitude, self.draper_number,
                                                  self.harvard_number, self.name )

    def draw( self, painter, scale):
        """Draw this Star object using the given QPainter.

        :param QtGui.QPainter painter: The QPainter object to do the drawing.
        :param int scale: The scale at which the stars are to be drawn on the gui
        :return: None
        """

        if self.brightness == -1:
            painter.setBrush( QtGui.QColor( 255, 0, 0 ) )
            painter.setPen( QtGui.QColor( 255, 0, 0 ) )
        else:
            if self.brightness > 255:
                self.brightness = 255
            elif self.brightness < 0:
                self.brightness = 0

            # The brush determines the fill color.
            painter.setBrush( QtGui.QColor( self.brightness, self.brightness, self.brightness ) )
            # The pen determines the outline color.
            painter.setPen( QtGui.QColor( self.brightness, self.brightness, self.brightness ) )

        # The parameters to drawEllipse are the (x,y) of the upper-left corner and width, height.
        painter.drawEllipse( (self.x + 1) * (scale // 2), (-self.y + 1) * (scale // 2), 1, 1 )


class Constellation:
    """Constellation class for representing a constellation class on the Gui."""

    def __init__( self, filename ):
        """Initialize the Constellation."""
        with open( filename ) as data_file:
            data_lines = data_file.read().replace("\n", ",")

        data_lines = data_lines.split( "," )
        self.names = []
        self.stars = []

        for name in data_lines:
            self.names.append( name )

    def __str__( self ):
        """Build a string representation of the Constellation."""
        return " ".join( [ str( star_name ) for star_name in self.names ] )

    def draw( self, painter, scale, stars ):
        """Draw this Constellation object using the given QPainter.

        :param QtGui.QPainter painter: The QPainter object to do the drawing.
        :param int scale: The scale at which the Constellation is to be drawn on the gui.
        :param list stars: A list of stars from which the constellation object is drawn.
        :return: None
        """

        # The brush determines the fill color.
        painter.setBrush( QtGui.QColor( 255, 0, 0 ) )
        # The pen determines the outline color.
        painter.setPen( QtGui.QColor( 255, 0, 0 ) )

        i = 0
        while i < len(stars) - 1:
            painter.drawLine( int((stars[i].x + 1) * (scale // 2)),
                              int((-stars[i].y + 1) * (scale // 2)),
                              int((stars[i + 1].x + 1) * (scale // 2)),
                              int((-stars[i + 1].y + 1) * (scale // 2)))
            i += 2


class App:
    """Application class to create and control the gui."""

    def __init__( self ):
        """Initialize the gui."""
        # Create the main window in which our gui will display.
        self.main_window = QtGui.QMainWindow()  # QMainWindow() for menu and status bar.

        # Create an instance of our gui and set it up in the main window.
        self.gui = Gui()  # Generic name "Gui" from "as Gui" clause of import statement.
        self.gui.setupUi( self.main_window )

        # Connect the menu buttons to methods.
        self.gui.action_open_file.triggered.connect( self.open_file )
        self.gui.action_exit.triggered.connect( self.main_window.close )
        self.gui.action_name.triggered.connect( self.find_by_name )
        self.gui.action_draper_number.triggered.connect( self.find_by_draper )
        self.gui.action_harvard_revised_number.triggered.connect( self.find_by_harvard )
        self.gui.action_about.triggered.connect( self.about )

        # Connect the color button group to know when any button in the group is clicked.
        self.gui.constellation_group.buttonClicked.connect( self.button_clicked )

        # Catch mouse press events to be able to click on the map.
        self.gui.drawing_widget.mousePressEvent = self.mouse_press

        # Catch the paint and resize event so the spots can be drawn or redrawn.
        self.gui.drawing_widget.paintEvent = self.paint_event
        self.gui.drawing_widget.resizeEvent = self.resize_event

        # All Star objects are kept in a list; named stars are kept in a separate list.
        self.stars = []
        self.named_stars = []
        # The current Star, if one has been clicked.
        self.current_star = None
        # The Constellation objects are kept in a dictionary.
        self.constellations = {}
        # The current constellation, it is set to None initially.
        self.current_constellation_stars = None
        self.current_constellation = None

        # The scale of the gui, set to the gui width on startup, as width and height are equal values
        self.scale = self.gui.drawing_widget.width()

        # Open the Stars_All data file when the program is initially opened
        with open( "./data/Stars_All.txt" ) as data_file:
            data_lines = data_file.read().splitlines()

        for line in data_lines:
            star = Star( line )
            self.stars.append( star )
            if Star( line ).name != "":
                self.named_stars.append( Star( line ))

        # Update the drawing widget, which causes the system to call paint_event.
            self.gui.drawing_widget.update()

    def open_file( self ):
        """Opens a file to be displayed in the Gui.
        :return: None
        """

        # Set the current star brightness to it's original levels (back to white rather than red if applicable)
        if self.current_star is not None:
            self.current_star.brightness = 255 * 2.512 ** (-self.current_star.magnitude) * 10

        # Set constellation lists to None to take it off the screen.
        self.current_constellation = None
        self.current_constellation_stars = None

        # The getOpenFileName works fine, but for reasons I cannot figure out, PyCharm shows warnings.
        filename = QtGui.QFileDialog.getOpenFileName( self.main_window, "Open File", "data/", "Text files (*.txt)")
        print( filename )
        # Check to see if the file being opened is a star file
        if filename == "":
            self.gui.statusbar.showMessage("Please choose a file of Stars.")
        elif filename[78] != "S":
            self.gui.statusbar.showMessage("Please choose a file of Stars.")
        else:
            # Reset the star list to delete the previously drawn stars
            self.stars = []
            with open( filename ) as data_file:
                data_lines = data_file.read().splitlines()
                for line in data_lines:
                    self.stars.append( Star(line) )

    def find_by_draper( self ):
        """Called when the user chooses to find a star by its Draper Number

        :return: None
        """
        # Set the current star brightness to it's original levels (back to white rather than red if applicable)
        if self.current_star is not None:
            self.current_star.brightness = 255 * 2.512 ** (-self.current_star.magnitude) * 10

        # Set constellation lists to None to take it off the screen.
        self.current_constellation = None
        self.current_constellation_stars = None

        # The QInputDialog works fine, but for reasons I cannot figure out, PyCharm shows warnings.
        draper_number, ok_button = QtGui.QInputDialog.getInt( self.main_window, "Input", "Enter Draper Number:", 0)
        if ok_button:
            for star in self.stars:
                if star.draper_number == draper_number:
                    self.current_star = star
                    self.current_star.brightness = -1
                    # Show a message in the status bar pertaining to the nearest star.
                    self.gui.statusbar.showMessage( "Star at ({},{}); {}"
                                                    .format( int((self.current_star.x + 1) * (self.scale // 2)),
                                                             int((-self.current_star.y + 1) * (self.scale // 2)),
                                                             self.current_star ) )
                    break
                else:
                    self.current_star = None

            # Update the drawing widget, which causes the system to call paint_event.
            self.gui.drawing_widget.update()

    def find_by_harvard( self ):
        """Called when the user chooses to find a star by its Harvard Revised Number

        :return: None
        """

        # Set the current star brightness to it's original levels (back to white rather than red if applicable)
        if self.current_star is not None:
            self.current_star.brightness = 255 * 2.512 ** (-self.current_star.magnitude) * 10

        # Set constellation lists to None to take it off the screen.
        self.current_constellation = None
        self.current_constellation_stars = None

        # The QInputDialog works fine, but for reasons I cannot figure out, PyCharm shows warnings.
        harvard_number, ok_button = QtGui.QInputDialog.getInt( self.main_window, "Input",
                                                               "Enter Harvard Revised Number:", 0)

        if ok_button:
            for star in self.stars:
                if star.harvard_number == harvard_number:
                    self.current_star = star
                    self.current_star.brightness = -1
                    # Show a message in the status bar pertaining to the nearest star.
                    # Show a message in the status bar pertaining to the nearest star.
                    self.gui.statusbar.showMessage( "Star at ({},{}); {}"
                                                    .format( int((self.current_star.x + 1) * (self.scale // 2)),
                                                             int((-self.current_star.y + 1) * (self.scale // 2)),
                                                             self.current_star ) )
                    break
                else:
                    self.current_star = None

            # Update the drawing widget, which causes the system to call paint_event.
            self.gui.drawing_widget.update()

    def find_by_name( self ):
        """Called when the user chooses to find a star by its name

        :return: None
        """
        # Set the current star brightness to it's original levels (back to white rather than red if applicable)
        if self.current_star is not None:
            self.current_star.brightness = 255 * 2.512 ** (-self.current_star.magnitude) * 10

        # Set constellation lists to None to take it off the screen.
        self.current_constellation = None
        self.current_constellation_stars = None

        # The QInputDialog works fine, but for reasons I cannot figure out, PyCharm shows warnings.
        input_name, ok_button = QtGui.QInputDialog.getText( self.main_window, "Input", "Enter Star Name:" )
        correct_star = None

        if ok_button:
            if input_name == "":
                self.current_star = None
            else:
                index = 0
                for star in self.stars:
                    names = star.name.split(";")
                    for star_names in names:
                        if star_names == input_name.upper():
                            self.current_star = star
                            self.current_star.brightness = -1
                            # Show a message in the status bar pertaining to the nearest star.
                            self.gui.statusbar.showMessage( "Star at {}".format( self.current_star.__str__() ) )
                            correct_star = self.stars[ index ]
                        else:
                            self.current_star = None
                    index += 1

            if correct_star is not None:
                self.current_star = correct_star
                # Show a message in the status bar pertaining to the nearest star.
                self.gui.statusbar.showMessage( "Star at ({},{}); {}"
                                                .format( int((self.current_star.x + 1) * (self.scale // 2)),
                                                         int((-self.current_star.y + 1) * (self.scale // 2)),
                                                         self.current_star ) )

            # Update the drawing widget, which causes the system to call paint_event.
            self.gui.drawing_widget.update()

    def mouse_press( self, event ):
        """Called automatically when the user presses the mouse button on the drawing widget.

        Sets the application's current star to the one clicked, or nearest on to the click.

        :param PyQt.QtGui.QMouseEvent event: The event object from PyQt.
        :return: None
        """

        # Set any colored star's brightness to their original levels (back to white rather than red if applicable)
        for star in self.stars:
            if star.brightness == -1:
                star.brightness = 255 * 2.512 ** (-star.magnitude) * 10

        # Set constellation lists to None to take it off the screen.
        self.current_constellation = None
        self.current_constellation_stars = None

        # Get the (x,y) coordinate of the click.
        x, y = event.x(), event.y()

        # Find the Star object at the click.
        index = 0
        closest_star_distance = 1000
        self.current_star = None
        while index < len( self.stars ):
            distance = math.hypot(x - (self.stars[index].x + 1) * ( self.scale // 2),
                                  y - (-self.stars[index].y + 1) * (self.scale // 2) )
            if distance < closest_star_distance:
                closest_star_distance = distance
                self.current_star = self.stars[ index ]
            index += 1

        # Sets the selected star's color to red.
        self.current_star.brightness = -1

        # Show a message in the status bar pertaining to the nearest star.
        self.gui.statusbar.showMessage("Star at ({},{}); {}".format(int((self.current_star.x + 1) * (self.scale // 2)),
                                                                    int((-self.current_star.y + 1) * (self.scale // 2)),
                                                                    self.current_star ) )

        # Update the drawing widget, which causes the system to call paint_event.
        self.gui.drawing_widget.update()

    def button_clicked( self, button ):
        """Called when a user clicks a radio button on the gui.

        :param QtGui.QRadioButton button: The button that was clicked.
        :return: None
        """

        # Set the current star brightness to it's original levels (back to white rather than red if applicable)
        if self.current_star is not None:
            self.current_star.brightness = 255 * 2.512 ** (-self.current_star.magnitude) * 10

        self.current_constellation, self.current_constellation_stars = [], []
        constellation_name = button.text().replace(" ", "")

        if len(self.constellations) > 0:
            for i in range(len(self.constellations)):
                if self.constellations.get( constellation_name ) is not None:
                    self.current_constellation = self.constellations[ constellation_name ]

        if constellation_name != "None" and self.current_constellation == []:
            filename = "C:/Users/C18Jacob.Orner/Documents/Schoolwork/USAFA_CS210_2015/PEXes/PEX3/data/Constellation_"\
                       + button.text().replace(" ", "") + ".txt"
            self.current_constellation = Constellation( filename )

        if constellation_name == "None":
            self.current_constellation = None
        else:
            for i in range(len(self.current_constellation.names)):
                for star in self.named_stars:
                    names = star.name.split(";")
                    for star_names in names:
                        if star_names == self.current_constellation.names[i].upper():
                            self.current_constellation_stars.append( star )

        self.constellations[ button.text().replace(" ", "") ] = self.current_constellation

        # Show a message in the status bar pertaining to the constellation if there is a constellation chosen.
        if self.current_constellation is not None:
            self.gui.statusbar.showMessage( "Constellation {}".format( button.text() ) )
        else:
            self.gui.statusbar.showMessage( "" )

        # Update the drawing widget, which causes the system to call paint_event.
        self.gui.drawing_widget.update()

    def resize_event( self, q_paint_event):
        """Called whenever the drawing widget is re-sized.

        :param PyQt.QtGui.QPaintEvent q_paint_event: The event object from PyQt (not used).
        """

        # Get a QPainter object that can paint on the drawing widget.
        painter = QtGui.QPainter( self.gui.drawing_widget )

        # Set the width and height variables for the gui
        w, h = self.gui.drawing_widget.width(), self.gui.drawing_widget.height()

        # If necessary, change the width or height variables to ensure the stars are drawn in a square layout
        if w < h:
            self.scale = w
        else:
            self.scale = h

    def paint_event( self, q_paint_event ):
        """Called automatically whenever the drawing widget needs to repaint.

        :param PyQt.QtGui.QPaintEvent q_paint_event: The event object from PyQt (not used).
        """

        # Get a QPainter object that can paint on the drawing widget.
        painter = QtGui.QPainter( self.gui.drawing_widget )

        # Draw the stars.
        for star in self.stars:
            star.draw( painter, self.scale )

        if self.current_constellation is not None:
            # Draw the current constellation
            self.current_constellation.draw( painter, self.scale, self.current_constellation_stars )

        if self.current_star is not None:
            # Draw the current star to ensure it is on top of any other stars.
            self.current_star.draw( painter, self.scale )

    def about( self ):
        """Shows the about dialog."""
        QtGui.QMessageBox.about( self.main_window, "About", "CS 210, Fall 2015, Star Map\n\nAuthor: Jake Orner" )


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()

