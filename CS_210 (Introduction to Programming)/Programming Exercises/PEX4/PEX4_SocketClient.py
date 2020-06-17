# CS 210 - Introduction to Programming - Fall 2014
#
# Author: Solution
#
# Section: T1A/T3A, Dr. Bower
#
# Documentation Statement: None.
#

import socket
import sys

class SocketClient( object ):
    """ This class creates a Client Socket ready to make connections. """
    
    # NOTE: Most of the socket operations could potentially raise an IOError
    # or a ConnectionError. These are NOT caught in a try/except clause because
    # the only action to take would be to exit the program, which happens anyway.
    # Thus, an application using this class should do so with try/catch clauses
    # and attempt to gracefully handle any errors raised by the socket.


    def __init__( self, host="127.0.0.1", port=3742, verbose=False ):
        """ Create a generic socket ready to be connected to a server. """
        # Save the verbose setting for use in all methods.
        self.verbose = verbose

        # Create an INET, STREAMing socket.
        if self.verbose: print( "{}: Creating socket".format( type( self ).__name__ ), end=" ... ", flush=True )
        self.sock = socket.socket( socket.AF_INET, socket.SOCK_STREAM )
        if self.verbose: print( "socket created...", flush=True )

        # Save the host and port for use in connect();
        self.host = host
        self.port = port

    def connect( self ):
        """ Connect the socket to a server. """
        if self.verbose: print( "{}: Connecting to {}:{}".format( type( self ).__name__, self.host, self.port ), end=" ... ", flush=True )
        self.sock.connect( ( self.host, self.port ) )
        if self.verbose: print( "connected.", flush=True )

    def close( self ):
        """ Closes the socket and releases the port. """
        self.sock.close()

    def send_bytes( self, b ):
        """ Transmits a bytes object across the socket. """
        if self.verbose: print( "Sending {}".format( b ), end=" ... ", flush=True )
        self.sock.sendall( b )
        if self.verbose: print( "sent.", flush=True )

    def send_string( self, s ):
        """ Transmits a string object across the socket. """
        # Use the string encode() method with the default UTF-8 encoding
        # to create the bytes object to be sent across the socket.
        if self.verbose: print( "Sending {}".format( s ), end=" ... ", flush=True )
        self.send_bytes( str(s).encode() )
        if self.verbose: print( "sent.", flush=True )

    def recv_bytes( self, buffer_size=1024 ):
        """ Receives a bytes object from the socket. """
        if self.verbose: print( "{}: Receiving bytes".format( type( self ).__name__ ), end=" ... ", flush=True )
        b = self.sock.recv( buffer_size )
        if self.verbose: print( "received {}".format( b ), flush=True )
        return b

    def recv_string( self, buffer_size=1024 ):
        """ Receives a string object from the socket. """
        # Use the string encode() method with the default UTF-8 encoding
        # to create the bytes object to be sent across the socket.
        if self.verbose: print( "{}: Receiving string".format( type( self ).__name__ ), end=" ... ", flush=True )
        s = self.recv_bytes( buffer_size ).decode()
        if self.verbose: print( "received {}".format( s ), flush=True )
        return s

def main():
    """ Main program to do a quick demo of the ClientSocket.
        The protocol for this demo is the client immediately receives
        a message after connecting. Obviously, the server must send a
        message immediately after accepting a connection or things break.
    """
    # The following line shows the IP address of the machine on which this code runs.
    # Use it to connect two machines rather than one machine through the locahost IP.
    # print( "My IP address is", socket.gethostbyname( socket.gethostname() ), flush=True )

    # Create a ClientSocket object using the default host and port values.
    client = SocketClient( verbose=True )

    # Connect to the server.
    client.connect()

    # Receive and print the message from the server.
    print( client.recv_string(), flush=True )

    # This simple demo only receives one message, so close the socket.
    # client.close()


######## Main program ########
if __name__ == "__main__":
    main()

    # Pause before closing the console window (remove this line if
    # your IDE automatically delays closing the console window).
    input( "Press enter to continue ..." )
