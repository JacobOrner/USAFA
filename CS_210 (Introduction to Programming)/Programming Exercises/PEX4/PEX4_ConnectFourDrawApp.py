"""CS 210, Introduction to Programming, Fall 2015, Dr. Bower, Jake Orner.

This version of Connect Four is played in a GUI with a drawing widget. As discussed with Dr. Bower, the core
functionality of my program will include a model of the game board using object-oriented programming techniques,
a Gui to display the current state of the game board, and a capability for two people to play the game. The advanced
features will include a networking system to allow a two-player game from remote computers.

Documentation: None.
"""

# Import the Connect Four Model.
from PEX4_ConnectFourModelNestedLists import ConnectFourModel

# Import GUI and remaining module.
from PEX4_ConnectFourDrawGui import Ui_ConnectFour as Gui
from PyQt4 import QtCore, QtGui
import sys, time
import PEX4_SocketServer, PEX4_SocketClient


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

    This version implements the Connect Four game using a drawing widget.
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

        # Create a new instance of the Connect Four model.
        self.cf = ConnectFourModel()

        # Prompts the user to choose a local or networked game
        self.game_type = QtGui.QMessageBox.question( self.main_window, "Game Type", "Choose your type of game", "Local Game", "Networked Game")

        if self.game_type == 1:
            self.game_setup = QtGui.QMessageBox.question( self.main_window, "Game Type", "Would you like to start a new game?", "Yes", "No")

            if self.game_setup == 0:
                # Creates the Socket Server if the new game is chosen
                self.socket = PEX4_SocketServer.SocketServer( verbose=True )
                # Shows the user their own IP address
                QtGui.QMessageBox.about( self.main_window, "IP Address", "Your IP Address is: {}".format(self.socket.ip ) )
                self.turn = True
                # Accepts the connection from the client
                self.socket.accept_connection()
                self.gui.status_label.setText("You are Red")
                print("I am the server")
            else:
                self.turn = False
                # Prompts the user to enter the other user's IP address
                host_ip, ok_button = QtGui.QInputDialog.getText( self.main_window, "Enter Host IP", "What is the host IP address?" )
                self.socket = PEX4_SocketClient.SocketClient( "127.0.0.1", 3742 )
                # Connects the client to the host
                self.socket.connect()
                # Calls the receive method to wait for the Server to make a move first
                self.receive()
                self.gui.status_label.setText("You are Blue")

    def mouse_press( self, event ):
        """Called automatically whenever the drawing widget is clicked.

        :param PyQt.QtGui.QMouseEvent event: The event object from PyQt.
        :return: None
        """
        # Determine which square was clicked.
        w = self.gui.drawing_widget.width() // 7
        h = self.gui.drawing_widget.height() // 6
        self.square = event.y() // h * 7 + event.x() // w + 1
        # If the local game type is chosen, game_type is 0.
        if self.game_type == 0:
            # Use a try/except in case the user clicks on an already occupied square.
            try:
                self.cf.make_move( self.square )

                # If the move was successful, update the status label.
                if self.cf.winner() in "RedBlue":
                    self.gui.status_label.setText( "{} wins!".format( self.cf.winner() ) )
                elif self.cf.is_full():
                    self.gui.status_label.setText( "Tie game." )
                    QtGui.QMessageBox.about( self.main_window, "TIE!", "Tie Game!!!" )
                else:
                    self.gui.status_label.setText( "{}'s turn...".format( self.cf.current_player ) )

            except ( ValueError, RuntimeError ) as e:
                # The error is ignored and it will remain the same player's turn.
                pass

            self.gui.drawing_widget.update()
        # If the networked game type is chosen, game_type is 1.
        else:
            if self.turn is True:
                try:
                    self.cf.make_move( self.square )
                    # If the move was successful, update the status label.
                    if self.cf.winner() in "RedBlue":
                        self.gui.status_label.setText( "You win!" )
                        self.socket.send_string( self.square )
                        # Give the user a pop-up box showing they won.
                        QtGui.QMessageBox.about( self.main_window, "Winner", "You Win!!!" )
                        exit()
                    elif self.cf.is_full():
                        self.gui.status_label.setText( "Tie game." )
                        self.socket.send_string( self.square )
                        # Give the user a pop-up box showing a tie game.
                        QtGui.QMessageBox.about( self.main_window, "TIE!", "Tie Game!!!" )
                        exit()
                    else:
                        self.gui.status_label.setText( "Their turn...")
                        # Give a message telling the user their move is being sent.
                        QtGui.QMessageBox.about( self.main_window, "Sending", "Sending move..." )

                    # Update the drawing board after a move is made
                    self.gui.drawing_widget.update()

                    # Send the move to the other player
                    self.socket.send_string( self.square )
                    self.turn = False

                    # Wait for information about the other player's move to arrive
                    self.receive()

                    # Update the drawing board
                    self.gui.drawing_widget.update()
                except ( ValueError, RuntimeError ) as e:
                    # The error is ignored and it will remain the same player's turn.
                    pass
            else:
                QtGui.QMessageBox.about( self.main_window, "", "It's not your turn... Are you trying to cheat??" )

    def receive( self ):
        """Receives the square clicked by the other player and makes a move on the board.

        :return: None
        """
        b = None
        # Call the receive method of the socket until the other player makes a move
        while b is None or b == b'':
            b = self.socket.recv_string()

        # Use a try/except in case the other user clicks on an already occupied square.
        try:
            self.cf.make_move( int( b ) )

            if self.cf.winner() in "RedBlue":
                self.gui.status_label.setText( "You Lose :(" )
                QtGui.QMessageBox.about( self.main_window, "You Lose!", "You Lose!!!" )
                exit()
            elif self.cf.is_full():
                self.gui.status_label.setText( "Tie Game..." )
                QtGui.QMessageBox.about( self.main_window, "TIE", "Tie Game!!!" )
                exit()
            else:
                print("Move should have been recorded")
                self.gui.status_label.setText( "Your turn...")

        except ( ValueError, RuntimeError ) as e:
                    # The error is ignored and it will remain the same player's turn.
                    pass

        self.turn = True

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
        painter.drawLine( 0, 0, 0, h)
        painter.drawLine( w // 7, 0, w // 7, h )
        painter.drawLine( w * 2 // 7, 0, w * 2 // 7, h )
        painter.drawLine( w * 3 // 7, 0, w * 3 // 7, h )
        painter.drawLine( w * 4 // 7, 0, w * 4 // 7, h )
        painter.drawLine( w * 5 // 7, 0, w * 5 // 7, h )
        painter.drawLine( w * 6 // 7, 0, w * 6 // 7, h )
        painter.drawLine( w - 1, 0, w - 1, h)
        painter.drawLine( w, 0, 0, 0)
        painter.drawLine( 0, h // 6, w, h // 6 )
        painter.drawLine( 0, h * 2 // 6, w, h * 2 // 6 )
        painter.drawLine( 0, h * 3 // 6, w, h * 3 // 6 )
        painter.drawLine( 0, h * 4 // 6, w, h * 4 // 6 )
        painter.drawLine( 0, h * 5 // 6, w, h * 5 // 6 )
        painter.drawLine( 0, h - 1, w, h - 1)

        # Determine the necessary offset.
        dx = (w // 7) // 2
        dy = (h // 6) // 2

        # Draw the contents of the board.
        for square in range( 1, 43 ):
            # Only draw Red and Blue circles (i.e., don't draw the digits).
            if self.cf.player_at( square ) in "RedBlue":
                x = ( square - 1 ) % 7 * w // 7 + w // 14
                y = ( square - 1 ) // 7 * h // 6 + h // 12

                player_color = self.cf.player_at(square).lower()
                colors = {"red": QtCore.Qt.red, "blue": QtCore.Qt.blue}
                painter.setPen( colors.get( player_color ) )
                painter.setBrush( colors.get( player_color ) )
                painter.drawEllipse( x - dx, y - dy, w // 7, h // 6)


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()
