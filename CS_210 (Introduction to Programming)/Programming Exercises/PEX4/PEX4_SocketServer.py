# CS 210 - Introduction to Programming - Fall 2014
#
# Author: Solution
#
# Section: T1A/T3A, Dr. Bower
#
# Documentation Statement: None.
#

import base64
import socket
import sys

class SocketServer( object ):
    """ This class creates a Server Socket ready to accept connections. """
    
    # NOTE: Most of the socket operations could potentially raise an IOError
    # or a ConnectionError. These are NOT caught in a try/except clause because
    # the only action to take would be to exit the program, which happens anyway.
    # Thus, an application using this class should do so with try/catch clauses
    # and attempt to gracefully handle any errors raised by the socket.


    def __init__( self, host="127.0.0.1", port=3742, verbose=False ):
        """ Create and bind a generic socket and start it listening for connections. """
        # Save the verbose setting for use in all methods.
        self.verbose = verbose

        self.ip = socket.gethostbyname( socket.gethostname() )
        # Create an INET, STREAMing socket.
        if self.verbose: print( "{}: Creating socket".format( type( self ).__name__ ), end=" ... ", flush=True )
        self.sock = socket.socket( socket.AF_INET, socket.SOCK_STREAM )
        if self.verbose: print( "socket created...", flush=True )

        # Bind the socket to a particular address and port.
        if self.verbose: print( "{}: Binding socket to {} on port {}".format( type( self ).__name__, host, port ), end=" ... ", flush=True )
        self.sock.bind( ( host, port ) )
        if self.verbose: print( "socket bound.", flush=True )

        # Start the socket listening; do not keep any pending connections waiting.
        self.sock.listen( 0 )
        if self.verbose: print( "{}: Socket listening ...".format( type( self ).__name__ ), flush=True )

    def accept_connection( self ):
        """ Blocking call to the listening socket that waits for a client to connect. """
        # Wait to accept a connection (this is a blocking call).
        if self.verbose: print( "{}: Waiting to accept a connection".format( type( self ).__name__ ), end=" ... ", flush=True )
        self.conn, self.addr = self.sock.accept()
        if self.verbose: print( "connected with {}:{}.".format( self.addr[ 0 ], self.addr[ 1 ] ), flush=True )

    def close_connection(self):
        """ Closes the connection socket. """
        if self.verbose: print( "{}: Closing connection".format( type( self ).__name__ ), end=" ... ", flush=True )
        self.conn.close()
        if self.verbose: print( "closed.", flush=True )

    def close(self):
        """ Closes the listening socket and releases the port. """
        if self.verbose: print( "{}: Closing socket".format( type( self ).__name__ ), end=" ... ", flush=True )
        self.sock.close()
        if self.verbose: print( "closed.", flush=True )

    def send_bytes( self, b ):
        """ Transmits a bytes object across the connection socket. """
        if self.verbose: print( "Sending{}".format( b ), end=" ... ", flush=True )
        self.conn.sendall( b )
        if self.verbose: print( "sent.", flush=True )

    def send_string( self, s ):
        """ Transmits a string object across the connection socket. """
        # Use the string encode() method with the default UTF-8 encoding
        # to create the bytes object to be sent across the socket.
        if self.verbose: print( "Sending {}".format( s ), end=" ... ", flush=True )
        self.send_bytes( str(s).encode() )
        if self.verbose: print( "sent.", flush=True )

    def recv_bytes( self, buffer_size=1024 ):
        """ Receives a bytes object from the connection socket. """
        if self.verbose: print( "{}: Receiving bytes".format( type( self ).__name__ ), end=" ... ", flush=True )
        b = self.conn.recv( buffer_size )
        if self.verbose: print( "received {}".format( b ), flush=True )
        return b

    def recv_string( self, buffer_size=1024 ):
        """ Receives a string object from the connection socket. """
        # Use the string encode() method with the default UTF-8 encoding
        # to create the bytes object to be sent across the socket.
        # if self.verbose: print( "{}: Receiving string".format( type( self ).__name__ ), end=" ... ", flush=True )
        if self.verbose: print( "{}: Receiving string".format( type( self ).__name__ ), end=" ... ", flush=True )
        s = self.recv_bytes( buffer_size ).decode()
        if self.verbose: print( "received {}".format( s ), flush=True )
        return s


def main():
    """ Main program to do a quick demo of the ServerSocket.
        The protocol for this demo is the server immediately sends
        a message when a client connects. Obviously, the client must
        receive a message immediately after connection or things break.
    """
    # The following line shows the IP address of the machine on which this code runs.
    # Use it to connect two machines rather than one machine through the locahost IP.
    print( "My IP address is", socket.gethostbyname( socket.gethostname() ), flush=True )

    # The message to be sent, as a bytes object, already encoded using base64.
    # message = b"SGVsbG8sIFdvcmxkISBZb3UgaGF2ZSByZWNpZXZlZCBhIG1lc3NhZ2Ugb3ZlciBhIHNvY2tldC4uLg=="

    # Create a SocketServer object using the default host and port values.
    server = SocketServer( verbose=True )

    # Accept a connection; this is a blocking call.
    server.accept_connection()

    # When the connection is made, immediately send the message.
    # server.send_bytes( base64.b64decode( message ) )

    # This simple demo only sends one message, so close down the connection and socket.
    # server.close_connection()
    # server.close()


######## Main program ########
if __name__ == "__main__":
    main()

    # Pause before closing the console window (remove this line if
    # your IDE automatically delays closing the console window).
    input( "Press enter to continue ..." )
