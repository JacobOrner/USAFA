"""CS 210, Introduction to Programming, Fall 2015, Dr. Bower.

This module demonstrates a few Python libraries.

There are many Python libraries available from the Python
Standard Library (https://docs.python.org/3/library/), the
Python Package Index (https://pypi.python.org/pypi), and
numerous other sources:
    http://pythontips.com/2013/07/30/20-python-libraries-you-cant-live-without/
    https://wiki.python.org/moin/UsefulModules
    http://docs.python-guide.org/en/latest/
    https://www.quora.com/What-are-the-most-interesting-modules-for-Python
    http://blog.yhathq.com/posts/11-python-libraries-you-might-not-know.html
    https://pymotw.com/

Documentation: Various; see comments in each demo.
"""


def main():
    """Main program to run each demo."""
    # Call each individual demo; comment/un-comment these lines as you work.
    # demo0()
    # demo1()
    # demo2()
    # demo3()
    # demo4()
    demo5()
    # demo6()


import itertools  # https://docs.python.org/3/library/itertools.html


def demo0():
    """Demonstrate itertools from the Standard Python Library."""
    print( "itertools.product", end=":      " )
    for a, b in itertools.product( [ 1, 2, 3, 4 ], repeat=2 ):
        print( a, b, end=", " )
    print()

    print( "itertools.permutations", end=": " )
    for a, b in itertools.permutations( [ 1, 2, 3, 4 ], r=2 ):
        print( a, b, end=", " )
    print()

    print( "itertools.combinations", end=": " )
    for a, b in itertools.combinations( [ 1, 2, 3, 4 ], r=2 ):
        print( a, b, end=", " )
    print()


# https://docs.python.org/3/library/textwrap.html
import textwrap


def demo1():
    """Demonstrate textwrap from the Standard Python Library."""
    with open( "./data/Address.txt" ) as data_file:
        address = data_file.read().splitlines()

    # Print each line as originally read from the data file.
    for line in address:
        print( line )
    print()

    # Print each line formatted in an 80-character column.
    for line in address:
        # The spaces preceding the line indent each paragraph.
        print( textwrap.fill( "    " + line, 80 ) )


# https://docs.python.org/3/library/pickle.html
import pickle


def demo2():
    """Demonstrate pickle from the Standard Python Library."""
    # Create a dictionary to be pickled (most any object can be pickled).
    house_d = { "bathroom": "yellow", "bedroom": "cyan", "kitchen": "blue", "yard": "green" }
    print( "Pre-pickle: ", house_d )

    # Use the pickle module to write the dictionary to a file (in a binary file format).
    with open( "./data/house.pickle", "wb" ) as pickle_file:
        pickle.dump( house_d, pickle_file )

    # Re-create the dictionary from the pickled file (which is a binary file format).
    with open( "./data/house.pickle", "rb" ) as pickle_file:
        house_p = pickle.load( pickle_file )

    # Should match the earlier, pre-pickled dictionary.
    print( "Post-pickle:", house_p )


# https://docs.python.org/3/library/urllib.html
import urllib.request


def demo3():
    """Demonstrate urllib from the Standard Python Library."""
    # Use urllib.request to open a url, then read the page and decode to a string.
    html_str = urllib.request.urlopen( "http://dfcs/cs210/index.html" ).read().decode()
    print( html_str )

    # Do some basic string parsing to extract all URLs referenced in the page.
    index = html_str.find( "<a " )
    while index > 0:
        # What if "href=" isn't the first attribute after the "<a" tag?
        print( html_str[ index + 9 : html_str.find( ">", index + 2 ) - 1 ] )
        index = html_str.find( "<a ", index + 2 )


# https://docs.python.org/3/library/html.parser.html
from html.parser import HTMLParser


def demo4():
    """Demonstrate html.parser from the Standard Python Library."""
    # Use urllib.request to open a url, then read the page and decode to a string.
    html_str = urllib.request.urlopen( "http://www.imgur.com/hot/time" ).read().decode()

    # Create a new parser object and feed it the html string.
    parser = HrefParser()
    parser.feed( html_str )


class HrefParser( HTMLParser ):
    """Extend the HTMLParser class to extract all href attributes."""

    def handle_starttag( self, tag, attributes ):
        """Called for each start tag in the html.

        :param str tag: The html tag.
        :param list[(str,str)] attributes: The attributes with the html tag as a list of (str,str) tuples.
        :return: None
        """
        # This is called once for every tag in the html.
        # print( tag, attrs )

        # The tag is an anchor, so print the href attribute.
        if tag == "div":
            for attribute in attributes:
                if attribute[ 0 ] == "hover":
                    print(  )
        if tag == "img":
            for attribute in attributes:
                if attribute[ 0 ] == "src":
                    print( attribute[ 1 ] )


# http://www.crummy.com/software/BeautifulSoup/
from bs4 import BeautifulSoup


def demo5():
    """Demonstrate the Beautiful Soup library (must be installed separately)."""
    # Use urllib.request to open a url, then read the page and decode to a string.
    html_str = urllib.request.urlopen( "http://www.imgur.com/hot/time" ).read().decode()

    # Create a BeautifulSoup object from the html string.
    soup = BeautifulSoup( html_str )

    # Beautiful Soup provides a very Pythonic way to access all href attributes.
    for a in soup.find_all('a'):
        print( a.get( "href" ) )

    # It is also quite simple to access other important parts of the html.
    print( soup.title.string )
    print( soup.h1.string )


# https://docs.python.org/3/library/socket.html
import socket


def demo6():
    """Demonstrate socket from the Standard Python Library."""

    # The following line shows the IP address of the machine on which this code runs.
    # Use it to connect two machines rather than one machine through the localhost IP.
    # print( "My IP address is", socket.gethostbyname( socket.gethostname() ), flush=True )

    role = input( "Server or Client? " )

    if role.lower().strip()[ 0 ] == 's':
        # Use the default localhost IP address.
        server = SocketServer()

        # Accept a connection; this is a blocking call.
        print( "Server started; waiting for client to connect..." )
        server.accept_connection()

        # When the connection is made, the server waits for messages.
        print( "Client connected; waiting for messages..." )
        message_received = server.recv_string()
        while message_received.lower().strip() != "bye":
            print( "Client says:", message_received )
            message_received = server.recv_string()

        # The client said "bye", so close things down.
        server.close_connection()
        server.close()

    else:
        # Use the default localhost IP address.
        client = SocketClient()
        # Connect to the server, which must already be running.
        client.connect()

        # When the connection is made, ask the user for messages and send them.
        message_to_send = input( "Connected to server; enter message: " )
        client.send_string( message_to_send )

        while message_to_send.lower().strip() != "bye":
            message_to_send = input( "Enter message: " )
            client.send_string( message_to_send )

        # Said "bye", so close things down.
        client.close()


class SocketServer( object ):
    """This class creates a Server Socket ready to accept connections."""

    # NOTE: Most of the socket operations could potentially raise an Error.
    # These are NOT caught in a try/except clause within this class because
    # the only action would be to exit the program, which happens anyway.
    # Thus, an application using this class should do so with try/except
    # and attempt to gracefully handle any errors raised by the socket.

    def __init__( self, host="127.0.0.1", port=3742, verbose=False ):
        """Create and bind a generic socket and start it listening for connections."""
        # Save the verbose setting for use in all methods.
        self.verbose = verbose

        # Create an INET, STREAMing socket.
        if self.verbose:
            print( "{}: Creating socket".format( type( self ).__name__ ), end=" ... ", flush=True )
        self.sock = socket.socket( socket.AF_INET, socket.SOCK_STREAM )
        if self.verbose:
            print( "socket created...", flush=True )

        # Bind the socket to a particular address and port.
        if self.verbose:
            print( "{}: Binding socket to {} on port {}".format( type( self ).__name__, host, port ), end=" ... ", flush=True )
        self.sock.bind( ( host, port ) )
        if self.verbose:
            print( "socket bound.", flush=True )

        # Start the socket listening; do not keep any pending connections waiting.
        self.sock.listen( 0 )
        if self.verbose:
            print( "{}: Socket listening ...".format( type( self ).__name__ ), flush=True )

        # These will be set in accept_connection.
        self.conn, self.addr = None, None

    def accept_connection( self ):
        """Blocking call to the listening socket that waits for a client to connect."""
        # Wait to accept a connection (this is a blocking call).
        if self.verbose:
            print( "{}: Waiting to accept a connection".format( type( self ).__name__ ), end=" ... ", flush=True )
        self.conn, self.addr = self.sock.accept()
        if self.verbose:
            print( "connected with {}:{}.".format( self.addr[ 0 ], self.addr[ 1 ] ), flush=True )

    def close_connection(self):
        """Closes the connection socket."""
        if self.verbose:
            print( "{}: Closing connection".format( type( self ).__name__ ), end=" ... ", flush=True )
        self.conn.close()
        if self.verbose:
            print( "closed.", flush=True )

    def close(self):
        """Closes the listening socket and releases the port."""
        if self.verbose:
            print( "{}: Closing socket".format( type( self ).__name__ ), end=" ... ", flush=True )
        self.sock.close()
        if self.verbose:
            print( "closed.", flush=True )

    def send_bytes( self, b ):
        """Transmits a bytes object across the connection socket."""
        if self.verbose:
            print( "{}: Sending bytes {}".format( type( self ).__name__, b ), end=" ... ", flush=True )
        self.conn.sendall( b )
        if self.verbose:
            print( "sent.", flush=True )

    def send_string( self, s ):
        """Transmits a string object across the connection socket."""
        # Use the string encode() method with the default UTF-8 encoding
        # to create the bytes object to be sent across the socket.
        if self.verbose:
            print( "{}: Sending string {}".format( type( self ).__name__, s ), end=" ... ", flush=True )
        self.send_bytes( s.encode() )
        if self.verbose:
            print( "sent.", flush=True )

    def recv_bytes( self, buffer_size=1024 ):
        """Receives a bytes object from the connection socket."""
        if self.verbose:
            print( "{}: Receiving bytes".format( type( self ).__name__ ), end=" ... ", flush=True )
        b = self.conn.recv( buffer_size )
        if self.verbose:
            print( "received {}".format( b ), flush=True )
        return b

    def recv_string( self, buffer_size=1024 ):
        """Receives a string object from the connection socket."""
        # Use the string encode() method with the default UTF-8 encoding
        # to create the bytes object to be sent across the socket.
        if self.verbose:
            print( "{}: Receiving string".format( type( self ).__name__ ), end=" ... ", flush=True )
        s = self.recv_bytes( buffer_size ).decode()
        if self.verbose:
            print( "received {}".format( s ), flush=True )
        return s


class SocketClient( object ):
    """This class creates a Client Socket ready to make connections."""

    # NOTE: Most of the socket operations could potentially raise an Error.
    # These are NOT caught in a try/except clause within this class because
    # the only action would be to exit the program, which happens anyway.
    # Thus, an application using this class should do so with try/except
    # and attempt to gracefully handle any errors raised by the socket.

    def __init__( self, host="127.0.0.1", port=3742, verbose=False ):
        """Create a generic socket ready to be connected to a server."""
        # Save the verbose setting for use in all methods.
        self.verbose = verbose

        # Create an INET, STREAMing socket.
        if self.verbose:
            print( "{}: Creating socket".format( type( self ).__name__ ), end=" ... ", flush=True )
        self.sock = socket.socket( socket.AF_INET, socket.SOCK_STREAM )
        if self.verbose:
            print( "socket created...", flush=True )

        # Save the host and port for use in connect().
        self.host = host
        self.port = port

    def connect( self ):
        """Connect the socket to a server."""
        if self.verbose:
            print( "{}: Connecting to {}:{}".format( type( self ).__name__, self.host, self.port ), end=" ... ", flush=True )
        self.sock.connect( ( self.host, self.port ) )
        if self.verbose:
            print( "connected.", flush=True )

    def close( self ):
        """Closes the socket and releases the port."""
        self.sock.close()

    def send_bytes( self, b ):
        """Transmits a bytes object across the socket."""
        if self.verbose:
            print( "{}: Sending bytes {}".format( type( self ).__name__, b ), end=" ... ", flush=True )
        self.sock.sendall( b )
        if self.verbose:
            print( "sent.", flush=True )

    def send_string( self, s ):
        """Transmits a string object across the socket."""
        # Use the string encode() method with the default UTF-8 encoding
        # to create the bytes object to be sent across the socket.
        if self.verbose:
            print( "{}: Sending string {}".format( type( self ).__name__, s ), end=" ... ", flush=True )
        self.send_bytes( s.encode() )
        if self.verbose:
            print( "sent.", flush=True )

    def recv_bytes( self, buffer_size=1024 ):
        """Receives a bytes object from the socket."""
        if self.verbose:
            print( "{}: Receiving bytes".format( type( self ).__name__ ), end=" ... ", flush=True )
        b = self.sock.recv( buffer_size )
        if self.verbose:
            print( "received {}".format( b ), flush=True )
        return b

    def recv_string( self, buffer_size=1024 ):
        """Receives a string object from the socket."""
        # Use the string encode() method with the default UTF-8 encoding
        # to create the bytes object to be sent across the socket.
        if self.verbose:
            print( "{}: Receiving string".format( type( self ).__name__ ), end=" ... ", flush=True )
        s = self.recv_bytes( buffer_size ).decode()
        if self.verbose:
            print( "received {}".format( s ), flush=True )
        return s


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()
