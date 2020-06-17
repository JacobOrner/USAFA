"""CS 210, Introduction to Programming, Fall 2015, Jake Orner.

Instructor: Dr. Bower

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""

import easygui


def main():
    """Main program to test solutions for each exercise."""
    # Print the docstring at the top of the file so your instructor can see your name.
    print( __doc__ )

    # Call each individual exercise; comment/un-comment these lines as you work.
    exercise1()
    exercise2()
    exercise3()
    exercise4()
    exercise5()


def exercise1():
    """Interact with the user and test the exemplar function."""
    # Get a year from the user.
    year = easygui.integerbox( "Enter two-digit class year, 16-18:", "Input", "", 16, 18 )

    # Continue until the user clicks the Cancel button.
    while year is not None:
        # Show the exemplar for the given year.
        easygui.msgbox( "Class of 20{}'s exemplar is {}.".format( year, exemplar( year ) ), "Result" )

        # Get another year from the user.
        year = easygui.integerbox( "Enter two-digit class year, 16-18:", "Input", "", 16, 18 )


def exemplar( class_year ):
    """Determine the exemplar for the classes currently at USAFA.

    Since the class of '19 has not yet chosen their exemplar, the only valid
    input values for this function are 16, 17, and 18.

    :param int class_year: The class year, [16-18].
    :return: The exemplar for the given year.
    :rtype: str
    """
    if class_year == 16:
        return "Brodeur"
    elif class_year == 17:
        return "Day"
    elif class_year == 18:
        return "Zamperini"
    else:
        return "That number is not valid."


def exercise2():
    """Interact with the user and test the drink_size function."""
    # Get a number of ounces from the user.
    oz = easygui.integerbox( "Enter drink ounces:", "Input", "", 1, 144 )

    # Continue until the user clicks the Cancel button.
    while oz is not None:
        # Show the drink size for the given number of ounces.
        easygui.msgbox( "A {}oz drink is {}.".format( oz, drink_size( oz ) ), "Result" )

        # Get another drink size from the user.
        oz = easygui.integerbox( "Enter drink ounces:", "Input", "", 1, 144 )


def drink_size( ounces ):
    """Determine the descriptive size for a drink with the given number of ounces.

    A drink with 12 or fewer ounces is considered to be "Small".
    A drink with more than 12 but 20 or fewer ounces is considered to be "Medium".
    A drink with more than 20 but 32 or fewer ounces is considered to be "Large".
    A drink with more than 32 ounces is considered to be "Ridiculous".

    :param int ounces: The drink size, in ounces.
    :return: The description of the drink size, "Small", "Medium", "Large", or "Ridiculous".
    :rtype: str
    """
    if ounces <= 12:
        return "Small"
    elif ounces <= 20:
        return "Medium"
    elif ounces <= 32:
        return "Large"
    else:
        return "Ridiculous"


def exercise3():
    """Interact with the user and test the quadrant function."""
    # Get a coordinate from the user.
    x = easygui.integerbox( "Enter x coordinate:", "Input", "", -2 ** 31, 2 ** 31 )
    y = easygui.integerbox( "Enter y coordinate:", "Input", "", -2 ** 31, 2 ** 31 )

    # Continue until the user clicks the Cancel button.
    while x is not None and y is not None:
        # Show the quadrant for the given coordinate.
        easygui.msgbox( "({},{}) is in quadrant {}.".format( x, y, quadrant( x, y ) ), "Result" )

        # Get another coordinate from the user.
        x = easygui.integerbox( "Enter x coordinate:", "Input", "", -2 ** 31, 2 ** 31 )
        y = easygui.integerbox( "Enter y coordinate:", "Input", "", -2 ** 31, 2 ** 31 )


def quadrant( x, y ):
    """Determine the quadrant in which the coordinate (x,y) lies; zero if on an axis.

    :param int x: The x coordinate.
    :param int y: The y coordinate.
    :return: The quadrant that contains (x,y); zero if on an axis.
    :rtype: int
    """
    if x == 0 or y == 0:
        return 0
    elif x > 0:
        if y > 0:
            return 1
        else:
            return 4
    else:
        if y > 0:
            return 2
        else:
            return 3


def exercise4():
    """Interact with the user and test the days_in_month function."""
    # Get a month from the user.
    m = easygui.integerbox( "Enter month (1-12):", "Input", "", 1, 12 )

    # Continue until the user clicks the Cancel button.
    while m is not None:
        # Show the number of days in the given month.
        if m == 2:
            # Prompt the user for the year if the month is February.
            y = easygui.integerbox( "Enter year (1582-):", "Input", "", 1582, 2 ** 31 )
            easygui.msgbox( "{} of {} has {} days.".format( m, y, days_in_month( m, y ) ), "Result" )
        else:
            # Use the current year for any month besides February.
            easygui.msgbox( "{} has {} days.".format( m, days_in_month( m, 2015 ) ), "Result" )

        # Get another month from the user.
        m = easygui.integerbox( "Enter month (1-12):", "Input", "", 1, 12 )


def is_leap( year ):
    """Determines if the given year is a leap year.

    :param int year: The year to be tested for leap-ness.
    :return: True if the given year is a leap year; False otherwise.
    :rtype: bool
    """
    return year % 4 == 0 and ( year % 100 != 0 or year % 400 == 0)


def days_in_month( month, year ):
    """Determine the days in the given month during the given year.

    :param int month: The number of the month (1 = January, 2 = February, etc).
    :param int year: The year during which the month occurs.
    :return: The number of days in the given month, including leap years.
    :rtype: int
    """
    if month == 1:
        return 31
    elif month == 2:
        if is_leap( year ):
            return 29
        else:
            return 28
    elif month == 3:
        return 31
    elif month == 4:
        return 30
    elif month == 5:
        return 31
    elif month < 7:
        return 30
    elif month < 9:
        return 31
    elif month == 9:
        return 30
    elif month < 11:
        return 31
    elif month == 11:
        return 30
    else:
        return 31


def exercise5():
    """Interact with the user and test the passed_pft function for someone less than 30 years of age."""
    # Get a set of PFT results from the user.
    g = easygui.buttonbox( msg="Select gender:", title="Select", choices=[ "Female", "Male" ] )
    r = easygui.integerbox( "Enter run time (in seconds):", "Input", "", 300, 3000 )
    s = easygui.integerbox( "Enter situps completed:", "Input", "", 0, 180 )
    p = easygui.integerbox( "Enter pushups completed:", "Input", "", 0, 180 )

    # Continue until the user clicks the Cancel button.
    while g is not None and r is not None and s is not None and p is not None:
        # Show the Pass/Fail result of the PFT.
        if passed_pft( g, r, s, p ):
            easygui.msgbox( "Pass!", "Result" )
        else:
            easygui.msgbox( "Fail.", "Result" )

        # Get another set of PFT results from the user.
        g = easygui.buttonbox( msg="Select gender:", title="Select", choices=[ "Female", "Male" ] )
        r = easygui.integerbox( "Enter run time (in seconds):", "Input", "", 300, 3000 )
        s = easygui.integerbox( "Enter situps completed:", "Input", "", 0, 180 )
        p = easygui.integerbox( "Enter pushups completed:", "Input", "", 0, 180 )


def passed_pft( gender, run_time, situps, pushups ):
    """Determines if the specified parameters pass the PFT for someone less than 30 years of age.

    For minimum component requirements, see the following:
    http://www.afpc.af.mil/affitnessprogram/componentbaselinescores.asp

    :param str gender: The person's gender, "Male" or "Female".
    :param int run_time: The 1.5 mile run time, in seconds.
    :param int situps: The number of situps completed in one minute.
    :param int pushups: The number of pushups completed in one minute.
    :return: True if the scores pass; False otherwise.
    :rtype" bool
    """
    if gender == "Male":
        if run_time <= 819:
            if situps >= 42:
                if pushups >= 33:
                    return True
        else:
            return False
    else:
        if run_time <= 982:
            if situps >= 38:
                if pushups >= 18:
                    return True
        else:
            return False

# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()
