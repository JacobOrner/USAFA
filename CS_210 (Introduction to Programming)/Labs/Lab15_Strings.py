"""CS 210, Introduction to Programming, Fall 2015, Jake Orner and Austin Gadient.

Instructor: Dr. Bower

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

import easygui
import os
import string

# Constant definition for use in the Pig Latin and Rovarspraket exercises.
VOWELS = "AEIOUaeiou"


def main():
    """Main program to test solutions for each exercise."""
    # Print the docstring at the top of the file so your instructor can see your name.
    print( __doc__ )

    # Call each individual exercise; comment/un-comment these lines as you work.
    #exercise0()
    #exercise1()
    #exercise2()
    # exercise3()
    #exercise4()
    exercise5()


def exercise0():
    """Demonstrate some basic string functionality."""
    #  0: Read, discuss, and understand the following code.

    # A string of well known text to do some testing with the string methods.
    core_values = "Integrity first,\nService before self,\nExcellence in all we do."
    easygui.msgbox( core_values, "Core Values - Original" )

    # Strings are immutable. What does this mean?
    easygui.msgbox( core_values.upper(), "CORE VALUES - upper()" )
    easygui.msgbox( core_values, "Core Values - Original has not changed!" )

    # Besides upper(), there are a lot more useful string methods:
    # https://docs.python.org/3/library/stdtypes.html#string-methods
    easygui.msgbox( core_values.lower(), "core values - lower()" )
    easygui.msgbox( core_values.title(), "Core Values - title()" )
    easygui.msgbox( core_values.replace( ",", "!" ).replace( ".", "!" ), "Core Values - replace()" )
    easygui.msgbox( core_values, "Core Values - Original still has not changed!" )

    # Strings can be sliced, and slices can be concatenated together.
    index = core_values.find( "\n" )  # Find the index of the first newline character.
    easygui.msgbox( core_values[ index + 1: ] + "\n" + core_values[ :index ], "Core Values - Sliced" )
    easygui.msgbox( core_values, "Core Values - Original STILL has not changed!" )

    # More useful stuff - counting and searching for things in a string.
    easygui.msgbox( "The letter 'i' occurs {} times in the test string:\n\n{}".format(
        core_values.count( 'i' ), core_values ), "Core Values - count()" )
    easygui.msgbox( "The word 'self' starts in position {} in the test string:\n\n{}".format(
        core_values.find( "self" ), core_values ), "Core Values - find()" )

    # The string module defines some useful constants:
    # https://docs.python.org/3/library/string.html#string-constants
    string_constants = "{}\n\n{}\n\n{}\n\n{}".format( string.ascii_uppercase, string.ascii_lowercase,
                                                      string.digits, string.punctuation )
    easygui.msgbox( string_constants, "String Constants" )

    # Another useful string constant is string.whitespace. What does this code do?
    result = ""                                   # Start with an empty string.
    for character in core_values:                 # Loop through each character of the test string.
        if character not in string.whitespace:    # If it is not a whitespace character,
            result += character                   # append it to the result.
    easygui.msgbox( result, "Core Values - Without Whitespace" )


def exercise1():
    """Uses the specified function as described in the lab document."""
    s = easygui.enterbox( "Enter a string (Cancel to quit):", "Three-Peat - Input", "This is a test." )
    while s is not None:
        easygui.msgbox( three_peat( s ), "Three-Peat - Result" )
        s = easygui.enterbox( "Enter a string (Cancel to quit):", "Three-Peat - Input" )


def three_peat( s ):
    """Repeats a string three times in lower case, title case, and upper case.

    :param s: The string to be repeated.
    :return: The three strings concatenated.
    :rtype: str
    """
    #  1: Remove the line below and complete the function as described in the lab document.
    return s.lower() + '\n' + s.title() + '\n' + s.upper()


def exercise2():
    """Uses the specified function as described in the lab document."""
    # Get the first file name before testing the loop condition.
    filename = easygui.fileopenbox( default="./data/*.txt", title="Character Frequency - File Open" )
    # A valid filename (i.e., user did not click Cancel) is longer than one character.
    while len( filename ) > 1:
        # Read the contents of the file as a string.
        with open( filename ) as data_file:
            data = data_file.read()
        # Show a message box with the base file name and letter frequency.
        char = "e"
        easygui.msgbox( "Frequency of the character '{}' in {}: {:.2%}.".format(
            char, os.path.basename( filename ), character_frequency( char, data ) ), "Character Frequency - Result" )
        # Get another file name before testing the loop condition.
        filename = easygui.fileopenbox( default="./data/*.txt", title="Character Frequency - File Open" )


def character_frequency( char, data ):
    """Calculates and returns the frequency of the given letter in the given data string.

    :param str char: The character to be counted.
    :param str data: The data in which to count the character.
    :return: The frequency of the character in the data, as a percentage.
    :rtype: float
    """
    result = ""
    # TODO 2: This is not accurate ... why? Can you fix it?
    for character in data:                 # Loop through each character of the test string.
        if character not in string.whitespace + string.punctuation + string.digits:
            result += character                   # append it to the result.
    return (result.count( char ) + result.count( char.upper())) / len( result )


def exercise3():
    """Uses the specified function as described in the lab document."""
    # TODO 3b: Write code to use the function as described in the lab document.
    word = easygui.enterbox("What word do you want in Pig Latin?")
    easygui.msgbox('{}'.format(pig_latin(word)))


#  3a: In the space below, write the function as described in the lab document.
def pig_latin( word ):
    """Changes a single english word to Pig Latin

    :param str word: The word to be changed
    :return: The word translated into pig latin
    :rtype: str
    """

    if word[0] not in VOWELS and word[1] in VOWELS:
        return word[1:] + '-' + word[0:1] + 'ay'
    elif word[0] not in VOWELS and word[1] not in VOWELS:
        return word[2:] + '-' + word[0:2] + 'ay'
    else:
        return word + '-' + 'yay'





def exercise4():
    """Uses the specified function as described in the lab document."""
    # TODO 4b: Write code to use the function as described in the lab document.
    s = ""
    while s is not None:
        s = easygui.enterbox("Enter a word to be translated to Rovarspraket")
        easygui.msgbox("Your translated word is {}".format(rovarspraket( s )))


# TODO 4a: In the space below, write the function as described in the lab document.
def rovarspraket( word ):
    """Translates an English word to Rovarsproket

    :param str word: English word to be translated
    :return: The Rovarsproket equivalent
    :rtype: str
    """
    result = ""
    for character in word:
        if character not in VOWELS:
            result += character + 'o' + character
        else:
            result += character
    return result

def exercise5():
    """Uses the specified function as described in the lab document."""
    plain = ''
    while plain is not None:
        plain = easygui.enterbox('Enter the plaintext')
        easygui.msgbox('{}'.format(rot13(plain)))


#  5a: In the space below, write the function as described in the lab document.
def rot13(plain):
    """ This function will take plaintext and return cyphertext using rot13
    :param str plain: The plaintext that is to be made into cyphertext
    :return: The cyphertext
    :rtype: str
    """
    regular = 'abcdefghijklmnopqrstuvwxyz'
    shift = 'nopqrstuvwxyzabcdefghijklm'
    result= ''
    for character in plain:
        for i in range(26):
            if character == regular[i]:
                result += shift[i]
    return result

# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()
