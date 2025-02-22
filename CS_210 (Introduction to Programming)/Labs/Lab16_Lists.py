"""CS 210, Introduction to Programming, Fall 2015, Jake Ornr.

Instructor: Dr. Bower

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

import easygui
import random
import string
from collections import Counter

def main():
    """Main program to test solutions for each exercise."""
    # Print the docstring at the top of the file so your instructor can see your name.
    print( __doc__ )

    # Call each individual exercise; comment/un-comment these lines as you work.
    # exercise0()
    # exercise1()
    # exercise2()
    # exercise3()
    #exercise4()
    # exercise5()
    # exercise6()
    exercise7()


def exercise0():
    """Demonstrate some basic list functionality."""
    # TODO 0: Read, discuss, and understand the following code.

    # Create a list of nine arbitrary values.
    a_list = [ 37, 86, 42, 51, 99, 13, 67, 75, 29 ]
    easygui.msgbox( "Original list:\n\na_list = {}".format( a_list ), "List - Original" )

    # The len() function works the same with lists as it does with strings.
    easygui.msgbox( "There are {} items in a_list.\n\na_list = {}".format( len( a_list ), a_list ), "List - Length" )

    # The index() function is similar to find() in a string, but the item must exist or there is an error.
    easygui.msgbox( "{} is at index {}\n{} is at index {}\n{} is at index {}\n\na_list = {}".format(
        37, a_list.index( 37 ), 99, a_list.index( 99 ), 29, a_list.index( 29 ), a_list ), "List - Index" )

    # The "in" membership operator works the same with lists as it does with strings.
    easygui.msgbox( "'{} in a_list' is {}.\n'{} in a_list' is {}.\n\na_list = {}".format(
        42, 42 in a_list, 64, 64 in a_list, a_list ), "List - Membership" )

    # The count() function works the same with lists as it does with strings.
    easygui.msgbox( "a_list.count( {} ) = {}\na_list.count( {} ) = {}\n\na_list = {}".format(
        42, a_list.count( 42 ), 64, a_list.count( 64 ), a_list ), "List - Count" )

    # Python has several built-in functions that work with lists as parameters.
    easygui.msgbox( "min( a_list ) = {}\nmax( a_list ) = {}\nsum( a_list ) = {}\n\na_list = {}".format(
        min( a_list ), max( a_list ), sum( a_list ), a_list ), "List - Min, Max, Sum" )

    # Create two identical lists to demonstrate various operations that modify the list.
    a_list = [ 37, 86, 42, 51, 99, 13, 67, 75, 29 ]
    b_list = [ 37, 86, 42, 51, 99, 13, 67, 75, 29 ]
    easygui.msgbox( "Original lists:\n\na_list = {}\n\nb_list = {}".format(
        a_list, b_list ), "Lists - Original" )

    # Lists are mutable! (Recall this did not work with strings.)
    b_list[ 4 ] = 11  # Replace the 99 with 11; note index 4 is the fifth item in the list.
    easygui.msgbox( "Modified b_list; replaced 99 with 11:\n\na_list = {}\n\nb_list = {}".format(
        a_list, b_list ), "Lists - Modify" )

    # Lists can be sliced and concatenated with the same notation that slices strings.
    # Note the 99 being put back in the middle must be enclosed in [ and ] to make it a list!
    b_list = b_list[ :4 ] + [ 99 ] + b_list[ 5: ]  # Slice first and last four items, put 99 in the middle.
    easygui.msgbox( "Sliced b_list and put 99 back in the middle:\n\na_list = {}\n\nb_list = {}".format(
        a_list, b_list ), "Lists - Slice and Concatenate" )

    # Items can be removed from a list using pop.
    item = b_list.pop()  # By default this pops the last item in the list.
    easygui.msgbox( "Popped {} from the end of b_list.\n\na_list = {}\n\nb_list = {}".format(
        item, a_list, b_list ), "Lists - Pop End" )
    item = b_list.pop( 0 )  # The parameter can specify an index to pop; in this case the first item.
    easygui.msgbox( "Popped {} from the front of b_list.\n\na_list = {}\n\nb_list = {}".format(
        item, a_list, b_list ), "Lists - Pop Front" )

    # Items can be inserted at a specific index and appended to the end of a list.
    b_list.insert( 0, 37 )  # Inserts the 37 in the front of the list.
    b_list.append( 29 )     # Appends the 29 onto the end of the list.
    easygui.msgbox( "Inserted 37 in front, appended 29 to end of b_list:\n\na_list = {}\n\nb_list = {}".format(
        a_list, b_list ), "Lists - Insert/Append" )

    # Items with a specific value can be removed from a list.
    b_list.remove( 99 )
    easygui.msgbox( "Removed 99 from b_list:\n\na_list = {}\n\nb_list = {}".format(
        a_list, b_list ), "Lists - Remove" )

    # Items in a specific location can be deleted from a list.
    del b_list[ 2 ]  # Removes the item in location 2 (third item in list); yes, this notation is unusual.
    easygui.msgbox( "Deleted item in location 2 from b_list:\n\na_list = {}\n\nb_list = {}".format(
        a_list, b_list ), "Lists - Del" )

    # Put the removed/deleted values back into b_list before demonstrating sort.
    b_list.insert( 2, 42 )  # Inserts 42 in location 2 in the list.
    b_list.insert( 4, 99 )  # Inserts 99 in location 4 in the list.
    easygui.msgbox( "Put 42 and 99 back into b_list:\n\na_list = {}\n\nb_list = {}".format(
        a_list, b_list ), "Lists - Original" )

    # Lists can be sorted, which changes the list (remember, lists are mutable).
    b_list.sort()
    easygui.msgbox( "Sorted b_list:\n\na_list = {}\n\nb_list = {}".format(
        a_list, b_list ), "Lists - Sort" )

    # Lists can also be reversed, which also changes the list.
    b_list.reverse()
    easygui.msgbox( "Reversed b_list:\n\na_list = {}\n\nb_list = {}".format(
        a_list, b_list ), "Lists - Reverse" )

    # Sorted and reversed versions of a list can be created without modifying the original list.
    c_list = sorted( a_list )
    d_list = sorted( a_list, reverse=True )
    easygui.msgbox( "Notice a_list remains unchanged!\n\na_list = {}\n\nc_list = {}\n\nd_list = {}".format(
        a_list, c_list, d_list ), "Lists - Sorted and Reversed" )

    # Finally, demonstrate the String To Integer List Translator function.
    s = "37 86 42 51 99 13 67 75 29"
    easygui.msgbox( "Converting a string to a list of integers:\n\ns = {}\n\nstilt( s ) = {}".format(
        s, stilt( s ) ), "S.T.I.L.T." )


def stilt( s ):
    """String To Integer List Translator; converts a list of whitespace delimited digits to a list of integers.

    This function is convenient for creating a list of values from a string of user input.
    More importantly, it demonstrates the accumulator pattern with lists.

    Note: The expected input is a string such as "37 86 42 51 99 13 67 75 29", but the function
    also strips punctuation so this would also work, "[37, 86, 42, 51, 99, 13, 67, 75, 29]".

    :param str s: A string of integer values separated by spaces.
    :return: A list of integer values.
    :rtype: list[int]
    """
    # Start with an empty list and use the accumulator pattern.
    result = []
    # Split the input string and loop through each individual string value.
    for str_value in s.split():
        # Strip punctuation from the ends of the string value, convert
        # it to an integer value, and append it to the result list.
        result.append( int( str_value.strip( string.punctuation ) ) )
    return result


def exercise1():
    """Uses the specified function as described in the lab document."""
    s = easygui.enterbox( "Enter a list (Cancel to quit):", "Input", "37 86 42 51 99 13 67 75 29" )
    while s is not None and len( s ) > 0:
        int_list = stilt( s )
        easygui.msgbox( "The mean of {} is {:.2f}.".format( int_list, mean( int_list ) ), "Result" )
        s = easygui.enterbox( "Enter a list (Cancel to quit):", "Input" )


def mean( data ):
    """Calculates and returns the mean of a list of values.

    Note: This function DOES NOT modify the list passed as a parameter.

    :param list data: The list of values for which the mean is to be calculated.
    :return: The mean of the values.
    :rtype: float
    """
    # TODO 1: Remove the line below and complete the function as described in the lab document.
    sum = 0
    for item in data:
        sum += item
    return sum/len( data )


def exercise2():
    """Uses the specified function as described in the lab document."""
    s = easygui.enterbox( "Enter a list (Cancel to quit):", "Input", "37 86 42 51 99 13 67 75 29" )
    while s is not None and len( s ) > 0:
        int_list = stilt( s )
        easygui.msgbox( "The median of {} is {:.2f}.".format( int_list, median( int_list ) ), "Result" )
        s = easygui.enterbox( "Enter a list (Cancel to quit):", "Input" )


def median( data ):
    """Calculates and returns the median of a list of values.

    Note: This function DOES NOT modify the list passed as a parameter.

    :param list data: The list of values for which the median is to be calculated.
    :return: The median of the values.
    :rtype: float
    """
    # TODO 2: Remove the line below and complete the function as described in the lab document.
    data.sort()
    if len( data ) % 2 == 1:
        return data[(len( data ) - 1) // 2]
    else:
        return (data[len(data) // 2] + data[len(data) // 2 - 1]) / 2



def exercise3():
    """Uses the specified function as described in the lab document."""
    s = easygui.enterbox( "Enter a list (Cancel to quit):", "Input", "1 2 3 2 3 4 5 4 3 2 3 4 3 2 1 2 3 2 1" )
    while s is not None and len( s ) > 0:
        int_list = stilt( s )
        easygui.msgbox( "The mode of {} is {}.".format( int_list, mode( int_list ) ), "Result" )
        s = easygui.enterbox( "Enter a list (Cancel to quit):", "Input" )


def mode( data ):
    """Calculates and returns the mode of a list of values.

    Note: This function DOES NOT modify the list passed as a parameter.

    :param list data: The list of values for which the mode is to be calculated.
    :return: The mode of the values.
    """
    # TODO 3: Remove the line below and complete the function as described in the lab document.
    count = 0
    max = 0
    data.sort()
    for item in data:
        count = data.count(item)
        if count > max:
            max = count
            mode = item

    return mode

def exercise4():
    """Uses the specified function as described in the lab document."""
    s = easygui.enterbox( "Enter a list (Cancel to quit):", "Input", "0 1 37 86 42 51 99 13 67 75 29 1000" )
    while s is not None and len( s ) > 0:
        int_list = stilt( s )
        easygui.msgbox( "The iqm of {} is {:.2f}.".format( int_list, iqm( int_list ) ), "Result" )
        s = easygui.enterbox( "Enter a list (Cancel to quit):", "Input" )


def iqm( data ):
    """Calculates and returns the median of a list of values.

    Note: This function DOES NOT modify the list passed as a parameter.

    :param list data: The list of values for which the median is to be calculated.
    :return: The median of the values.
    :rtype: float
    """
    # TODO 4: Remove the line below and complete the function as described in the lab document.
    data.sort()
    for value in range(len( data ) // 4):
        data.pop(0)
        data.pop(-1)

    return mean(data)


def exercise5():
    """Uses the specified function as described in the lab document."""
    # TODO 5b: Write code to use the function as described in the lab document.
    a = rand_list(5, 7, 2)
    b = rand_list(2, 100, 10)
    mean_a = mean(a)
    median_a = median(a)
    mode_a = mode(a)
    iqm_a = iqm(a)
    mean_b = mean(b)
    median_b = median(b)
    mode_b = mode(b)
    iqm_b = iqm(b)
    easygui.msgbox('For list a, {}, the mean is {} the median is {} the mode is'
                   ' {} and the iqm is {}'.format(a,mean_a,median_a,mode_a,iqm_a) )
    easygui.msgbox('For list b, {}, the mean is {} the median is {} the mode is'
                   ' {} and the iqm is {}'.format(b,mean_b,median_b,mode_b,iqm_b) )


#  5a: In the space below, write the function as described in the lab document.
def rand_list(numbers, max ,min):
    """This function will return a list of random numbers from min to max with numbers amount of values
    :param int numbers:The amount of data values to be generated
    :param int max:The max data value
    :param int min: The min data value
    :return: list
    """
    data = []
    for number in range(0, numbers + 1):
        data.append(random.randint(min,max))
    return data


def exercise6():
    """Uses the specified function as described in the lab document."""
    #  6b: Write code to use the function as described in the lab document.
    a = rand_list(5, 100, 10)
    b = rand_list(5, 200, 20)
    c = rand_list(10, 500, 0)
    if has_duplicates(a):
        easygui.msgbox('List a, {} has duplicates'.format(a))
    elif has_duplicates(b):
        easygui.msgbox('List a, {} has duplicates'.format(b))
    elif has_duplicates(c):
        easygui.msgbox('List a, {} has duplicates'.format(c))


#  6a: In the space below, write the function as described in the lab document.
def has_duplicates(data):
    """This will tell if a list has duplicates

    :param list data: A list of data
    :return: A boolean variable that is True if the list has duplicates
    """
    for item in data:
        count = data.count(item)
    if count > 1:
        return True
    else:
        return False

def exercise7():
    """Uses the specified function as described in the lab document."""
    # TODO 7b: Write code to use the function as described in the lab document.
    a = rand_list(10, 10, 1)
    b = rand_list(20, 10, 1)
    print("a:",a)
    print("b:",b)
    remove_duplicates(a)
    remove_duplicates(b)
    print("a:", a)
    print("b:", b)


# TODO 7a: In the space below, write the function as described in the lab document.
def remove_duplicates(data):
    """Removes duplicates from a list

    :param data: The list to be inspected
    :return data: The list without duplicates
    :rtype: list
    """

    if has_duplicates(data):
        for item in data:
            count = data.count(item)
            if count > 1:
                data.remove(item)
                count = 1

    return data
# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()