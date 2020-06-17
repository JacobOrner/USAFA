"""CS 210, Introduction to Programming, Fall 2015, _YOUR_NAME_HERE_.

Instructor: Dr. Bower / Col Gibson / LtCol Harder / LtCol (Ret) Christman

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

import easygui


def main():
    """Main program to test solutions for each exercise."""
    # Print the docstring at the top of the file so your instructor can see your name.
    print( __doc__ )

    # Call each individual exercise; comment/un-comment these lines as you work.
    exercise0()
    exercise1()
    exercise2()
    exercise3()
    exercise4()


def exercise0():
    """Demonstrate various methods of reading the contents of a data file."""
    # In the folder containing this Python program is a data folder with the file Test.txt.
    filename = "./data/Test.txt"

    # Example 1: Read the entire contents of a file into a single string
    # with open( filename ) as data_file:
    #     data_string = data_file.read()
    # Un-indent after reading the file so the with construct will close the file.
    # print( "Example 1:", data_string, sep="\n" )

    # Example 2: Read the entire contents of a file into a list of strings, one per word.
    # with open( filename ) as data_file:
    #     data_words = data_file.read().split()
    # print( "Example 2:", data_words, sep="\n" )

    # Example 3: Read the entire contents of a file into a list of strings, one per line.
    # with open( filename ) as data_file:
    #     data_lines = data_file.read().splitlines()
    # print( "Example 3:", data_lines, sep="\n" )

    # Example 4: Uses file open dialog to select a txt file from the data folder.
    filename = easygui.fileopenbox( default="./data/*.txt" )
    with open( filename ) as data_file:
        data_string = data_file.read()

    # # The data_string can be split into words and lines _without_re-reading_ the file:
    data_words = data_string.split()
    data_lines = data_string.splitlines()
    print( "Example 4:", data_string, data_words, data_lines, sep="\n" )


def exercise1():
    """Reads an entire file into a string, then estimates the number of words per sentence."""
    # TODO 1b: Write code to use the count_char function as described in the lab document.
    filename = easygui.fileopenbox( default="./data/*.txt")
    with open( filename ) as data_file:
        data_string = data_file.read()
    sentences = count_char( ".", data_string ) + count_char( "!", data_string ) + count_char( "?", data_string )
    words = len( data_string.split() )
    easygui.msgbox( "{} / {} = {:.2f} words per sentence.".format(words, sentences, words / sentences), filename)


# TODO 1a: In the space below, write the count_char function as described in the lab document.
def count_char( character, full_string ):
    """Counts the number of certain characters in a given string

    :param character: The character being looked for in the string
    :param full_string: The full string to be searched.
    :return count: The number of times the character in question occurs in the full string
    :rtype: int
    """
    count = 0

    for c in full_string:
        if c == character:
            count += 1
    return count


def exercise2():
    """Reads a data file of Python keywords, then counts how many appear in a Python source file."""
    # TODO 2b: Write code to use the count_words function as described in the lab document.
    filename1 = "./data/Keywords.txt"
    with open( filename1 ) as data_file:
        data_string1 = data_file.read().split()
    filename2 = easygui.fileopenbox( default="./data/*.txt")
    with open( filename2 ) as data_file:
        data_string2 = data_file.read().split()

    count = count_words( data_string1, data_string2 )
    total = len( data_string2 )
    easygui.msgbox( "{} of {} words were Python keywords, {:.2f}%".format(count, total, count / total * 100))


# TODO 2a: In the space below, write the count_words function as described in the lab document.
def count_words( list1, list2):
    """Counts the number of times words from the first list are contained in the second list

    :param list[str] list1: The list containing the words to be searched for.
    :param list[str] list2: The list containng the words that will be searched.
    :return count: The number of times the words are listed
    :rtype: int
    """
    count = 0

    for c in list1:
        for d in list2:
            if c == d:
                count += 1
    return count


def exercise3():
    """Display file information until the user clicks Cancel."""
    # TODO 3b: Write code to use the file_info function as described in the lab document.
    filename = ""
    while filename != None:
        filename = easygui.fileopenbox( default="./data/*.txt" )
        easygui.msgbox(file_info(filename))


# TODO 3a: In the space below, write the file_info function as described in the lab document.
def file_info( filename ):
    """Takes in a file name and returns statistics about the file in question

    :param filename: The file to be examined
    :return: A string with information about the file
    :rtype: string
    """
    with open( filename ) as data_file:
        data_string = data_file.read()

    characters = len( data_string )
    words = len( data_string.split() )
    lines = len( data_string.splitlines() )
    return "Lines: {} Words: {} Characters: {}".format(lines, words, characters )


def exercise4():
    """Display files with line numbers until the user clicks Cancel."""
    # TODO 4b: Write code to use the print_file function as described in the lab document.
    filename = ""
    while filename is not None:
        filename = easygui.fileopenbox( default="./data/*.txt" )
        if filename is not None:
            print_file( filename )



# TODO 4a: In the space below, write the print_file function as described in the lab document.
def print_file( filename ):
    """Prints the file with the lines numbered on the console

    :param filename: The file to be printed
    """
    with open( filename ) as data_file:
        data_string = data_file.read()
    data_lines = data_string.splitlines()

    count = 1

    for c in data_lines:
        print("{}: {}".format(count, c))
        count += 1

# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()