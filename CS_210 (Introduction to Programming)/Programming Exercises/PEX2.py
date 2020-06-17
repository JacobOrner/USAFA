"""CS 210, Introduction to Programming, Fall 2015, Jake Orner.

Instructor: Dr. Bower

Documentation: Found code detailing how to initialize the nested lists for part 3b on the website
http://stackoverflow.com/questions/6614891/turning-a-list-into-nested-lists-in-python.
"""

import easygui   # For easygui.fileopenbox.
import os        # For os.path.basename.

from PEX2_Puzzles import PUZZLE, PUZZLE_SOLVED, PUZZLE_INVALID, DATA, DATA_SOLVED


def main():
    """Main program to do Sudoku, so here's a Sudoku haiku:

    One through nine in place
    To open the matrix door
    Let logic guide you
    """
    # TODO 1b: Test the str_sudoku function with the given puzzles.
    # print( str_sudoku( PUZZLE ) )
    # print( str_sudoku( PUZZLE_SOLVED ) )

    # TODO 2b: Test the print_sudoku function with the given puzzles.
    # print_sudoku( PUZZLE )
    # print_sudoku( PUZZLE_SOLVED )

    # TODO 3b: Test the create_sudoku puzzle with the given data.
    # print_sudoku( create_sudoku( DATA ) )
    # print_sudoku( create_sudoku( DATA_SOLVED ) )

    # TODO 4b: Test the open_sudoku function with the given files.
    # print_sudoku( open_sudoku( "./data/Sudoku_Blank.txt" ) )
    # print_sudoku( open_sudoku( "./data/Sudoku00.txt" ) )
    # print_sudoku( open_sudoku( "./data/Sudoku01.txt" ) )
    # print_sudoku( open_sudoku( "./data/Sudoku02.txt" ) )

    # TODO 5b: Test the is_solved function with the given puzzles.
    # print( is_solved( PUZZLE ), is_solved( PUZZLE_SOLVED ) )

    # TODO 6b: Test the is_valid function with the given puzzles.
    # print( is_valid( PUZZLE ), is_valid( PUZZLE_SOLVED ), is_valid( PUZZLE_INVALID ) )

    # TODO 7: Implement the main program as described in the PEX document.
    filename = easygui.fileopenbox( default="./PEXes/data/*.txt", title="Sudoku - Puzzle Chooser" )
    # A valid filename (i.e., user did not click Cancel) is longer than one character.
    while len( filename ) > 1:
        # Read the contents of the file as a string.
        puzzle = open_sudoku( filename )
        print_sudoku( puzzle )

        if is_valid( puzzle ) and is_solved( puzzle ):
            easygui.msgbox( "The puzzle IS valid and IS solved" )
        elif is_valid( puzzle ) and not is_solved( puzzle ):
            easygui.msgbox( "The puzzle IS valid and is NOT solved" )
            if solve_sudoku( puzzle ) != puzzle:
                print_sudoku(puzzle)
        else:
            easygui.msgbox( "The puzzle is NOT valid and is NOT solved" )
        # Get another file name before testing the loop condition.
        filename = easygui.fileopenbox( default="./data/*.txt", title="Sudoku - Puzzle Chooser" )


# TODO 1a: Implement the str_sudoku function as described in the PEX document.
def str_sudoku( puzzle ):
    """Creates a string of puzzle values suitable for printing to a file.

    The string created by this function is formatted such that it could be
    passed to create_sudoku function and recreate the same puzzle.

    Note: This function DOES NOT modify the puzzle.

    :param list[list[int]] puzzle: The Sudoku puzzle as a 9x9 nested list of integers.
    :return: A string suitable for printing to a file or passing to create_sudoku.
    """
    data = ""
    for r in range(len(puzzle)):
        for c in range(len(puzzle[r])):
            data += ("{} ".format(puzzle[r][c]))  # Adds the next value to the string data
        data += "\n"  # Creates a new line after a full row has been added
    return data


# TODO 2a: Implement the print_sudoku function as described in the PEX document.
def print_sudoku( puzzle ):
    """Prints the nested list structure in pretty rows and columns.

    For example, PEX2_Puzzles.PUZZLE would print as follows:
    +===+===+===+===+===+===+===+===+===+
    # 1 | 8 |   # 6 |   | 9 #   | 5 | 7 #
    +---+---+---+---+---+---+---+---+---+
    # 5 |   |   #   |   |   #   |   | 3 #
    +---+---+---+---+---+---+---+---+---+
    #   |   | 2 #   | 8 |   # 4 |   |   #
    +===+===+===+===+===+===+===+===+===+
    # 7 |   |   # 8 | 4 | 5 #   |   | 1 #
    +---+---+---+---+---+---+---+---+---+
    #   |   | 3 # 2 |   | 1 # 9 |   |   #
    +---+---+---+---+---+---+---+---+---+
    # 2 |   |   # 9 | 6 | 3 #   |   | 5 #
    +===+===+===+===+===+===+===+===+===+
    #   |   | 1 #   | 5 |   # 8 |   |   #
    +---+---+---+---+---+---+---+---+---+
    # 8 |   |   #   |   |   #   |   | 4 #
    +---+---+---+---+---+---+---+---+---+
    # 9 | 4 |   # 3 |   | 8 #   | 7 | 2 #
    +===+===+===+===+===+===+===+===+===+

    Note: This function DOES NOT modify the puzzle.

    :param list[list[int]] puzzle: The Sudoku puzzle as a 9x9 nested list of integers.
    :return: None
    """
    count = 1
    row = 1
    print("+===+===+===+===+===+===+===+===+===+")  # Creates the top border
    for r in range(len(puzzle)):
        print("# ", end="")  # Prints the left border for the row
        for c in range(len(puzzle[r])):
            if puzzle[r][c] == 0:
                print(" ", end="")  # Prints a blank space if there is no value
            else:
                print(puzzle[r][c], end="")  # Prints the value if it is 1-9
            if count % 3 == 0:
                print(" # ", end="")  # Adds a '#' every three values
            else:
                print(" | ", end="")  # Adds a '|' between every value that does not require a '#'
            count += 1
        count = 1
        if row % 3 == 0:
            print("\n+===+===+===+===+===+===+===+===+===+")  # Prints this pattern every three rows
        else:
            print("\n+---+---+---+---+---+---+---+---+---+")
        row += 1


# TODO 3a: Implement the create_sudoku function as described in the PEX document.
def create_sudoku( data ):
    """Creates a 9x9 nested list of integers from a string with 81 separate values.

    :param str data: A string with 81 separate integer values, [0-9].
    :return: The Sudoku puzzle as a 9x9 nested list of integers.
    :rtype: list[list[int]]
    """
    puzzle_data = data.split()
    puzzle_full = []
    i = 0
    puzzle_int = [int(i) for i in puzzle_data]  # Creates an integer list of values from the string data

    while i < len(puzzle_data):
        puzzle_full.append(puzzle_int[i:i + 9])  # Appends 9 value lists to the list[list[int]] puzzle_full
        i += 9

    return puzzle_full


# TODO 4a: Implement the open_sudoku function as described in the PEX document.
def open_sudoku( filename ):
    """Opens the given file, parses the contents, and returns a Sudoku puzzle.

    This function prints to the console any comment lines in the file.

    :param str filename: The file name.
    :return: The Sudoku puzzle as a 9x9 nested list of integers.
    :rtype: list[list[int]]
    """
    with open( filename ) as data_file:  # Opens the data file
            data_string = data_file.read()

    data_lines = data_string.splitlines()
    print("The basename of the file is {}".format(os.path.basename( filename )))  # Prints the basename of the file
    comment_count = 0
    puzzle = ""

    for line in range(len(data_lines)):
        if data_lines[line][0] == "#":  # Checks for comment lines
            print(data_lines[line][2:])  # Prints the comment lines after the '#'
            comment_count += 1

    for x in range(comment_count):  # Pops the comment lines out of the data
        data_lines.pop(0)

    for x in range(len(data_lines)):
        for y in range(len(data_lines[0])):
            puzzle += "{} ".format(data_lines[x][y])  # Creates the puzzle with the remaining values (81 integers)

    return create_sudoku( puzzle )


# TODO 5a: Implement the is_solved function as described in the PEX document.
def is_solved( puzzle ):
    """Determines if a Sudoku puzzle is valid and complete.

    Note: This function DOES NOT modify the puzzle.

    :param list[list[int]] puzzle: The Sudoku puzzle as a 9x9 nested list of integers.
    :return: True if the puzzle is valid and complete; False otherwise.
    """
    # print_sudoku( puzzle )
    for r in range(9):
        sum_row = 0
        sum_col = 0
        for c in range(9):
            sum_row += puzzle[r][c]  # Adds the value of the box to the row total
            sum_col += puzzle[c][r]  # Adds the value of the box to the column total
            for x in range(9):
                if puzzle[r][c] == 0:  # Checks the value is not zero
                    return False
                if puzzle[r][c] == puzzle[r][x] and x != c:  # Checks the value is not a duplicate within the row
                    return False
                if puzzle[c][r] == puzzle[x][r] and x != c:  # Checks the value is not a duplicate within the column
                    return False
        if (sum_col != 45) or (sum_row != 45):  # Checks the sum of the row and column
            return False

    for x in range(3):  # Tracks the 3x3 rows of boxes in the puzzle
        for y in range(3):  # Tracks the 3x3 columns of boxes in the puzzle
            sum_box = 0
            for r in range(3):  # Tracks the individual boxes within each row in the 3x3 sets
                for c in range(3):  # Tracks the individual boxes within each column in the 3x3 sets
                    sum_box += puzzle[(y * 3) + r][(x * 3) + c]
                    for a in range(3):  # A counter to check the boxes against those within their row in the 3x3 set
                        for b in range(3):  # A counter to check the boxes against those within their columns in the 3x3
                            if c != a and r != b:  # Ensures the box is not checked against itself
                                if puzzle[(y * 3) + r][(x * 3) + c] == puzzle[(y * 3) + b][(x * 3) + a]:
                                    return False
            if sum_box != 45:  # Checks the values within each 3x3 set are equal to 45 - the sum of the numbers 1-9
                return False

    return True


# TODO 6a: Implement the is_valid function as described in the PEX document.
def is_valid( puzzle ):
    """Determines if a Sudoku puzzle is valid, but not necessarily complete.

    Note: This function DOES NOT modify the puzzle.

    :param list[list[int]] puzzle: The Sudoku puzzle as a 9x9 nested list of integers.
    :return: True if the puzzle is valid; False otherwise.
    """
    for r in range(9):
        for c in range(9):
            for x in range(9):
                if puzzle[r][c] == puzzle[r][x] and x != c and puzzle[r][x] != 0:  # Checks for a duplicate in the row
                    return False
                if puzzle[c][r] == puzzle[x][r] and x != c and puzzle[x][r] != 0:  # Checks for a duplicate in the column
                    return False

    for x in range(3):
        for y in range(3):
            for r in range(3):
                for c in range(3):
                    for z in range(3):
                        if c != z and puzzle[(y * 3) + r][(x * 3) + z] != 0:  # Checks there is a value in the box
                            # Checks for a duplicate within the 3x3 set
                            if puzzle[(y * 3) + r][(x * 3) + c] == puzzle[(y * 3) + r][(x * 3) + z]:
                                return False

    return True


# TODO 8: Implement the solve_sudoku function as discussed in class (lesson 20 and/or 21).
def solve_sudoku( puzzle, cell=0, value=1):
    """Recursive function to solve a Sudoku puzzle with brute force.

    Note: This function DOES modify the puzzle!!!

    :param list[list[int]] puzzle:  The 9x9 nested list of integers.
    :param int cell: The cell of the current value being solved [0-80].
    :param int value: The value to try in the current cell, [1-9].
    :return: None
    """
    r = cell // 9
    c = cell % 9
    # Checks the puzzle still is valid to be solved
    if not is_solved( puzzle ) and is_valid( puzzle ) and cell <= 80 and value <= 9:
        if puzzle[r][c] != 0:  # Moves to the next cell if the cell already contains a value
            solve_sudoku( puzzle, cell + 1, 1)
        else:
            puzzle[r][c] = value  # Assigns a value to the cell
            solve_sudoku( puzzle, cell + 1, 1 )  # Moves to the next cell

            if not is_solved( puzzle ):
                puzzle[r][c] = 0  # Resets the value to 0 if the puzzle is not solved
                solve_sudoku( puzzle, cell, value + 1 )  # Upticks the value if the value placed is not valid


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()
