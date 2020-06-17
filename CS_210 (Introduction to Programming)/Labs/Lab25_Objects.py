"""CS 210, Introduction to Programming, Fall 2015, _YOUR_NAME_HERE_.

Instructor: Dr. Bower / Col Gibson / LtCol Harder / LtCol (Ret) Christman

Documentation: None required; cooperation on labs is highly encouraged!
=======================================================================
"""


def main():
    """Main program to test solutions for each exercise."""
    # Print the docstring at the top of the file so your instructor can see your name.
    print( __doc__ )

    # TODO 2b: In the space below, use the class as described in the lab document.
    with open( "./data/Kindle.txt") as output_file:
        data = output_file.read()
    data_lines = data.splitlines()
    data_parsed = []
    for x in data_lines:
        data_parsed.append(x.split("|"))
    books = []
    print(data_parsed)
    for book in data_parsed:
        a = Book(book[0],book[1],int(book[2]),int(book[3]))
        books.append(a)
    # for x in data_parsed:
    #     print(Book(x[0], x[1], x[2], x[3]))
        #  books.append(Book(x[0], x[1], x[2], x[3]))

    print(books, flush=True)

   # for x in data_lines:

    #    books.append()


# TODO 2a: In the space below this comment, write the class as described in the lab document.
class Book:
    def __init__(self, title="", author="", total_pages=100, current_page=10):
        """

        :param title:
        :param author:
        :param total_pages int:
        :param current_page int:
        """
        self.title = title
        self.author = author
        self.total_pages = total_pages
        self.current_page = current_page

    def __str__(self):
        percent_read = ""
        percent_left = ""
        for i in range(self.progress()):
            percent_read += "="
        for i in range(100-percent_read):
            percent_left += "-"
        return "{}, by {} /n {}{}".format(self.title, self.author, percent_read, percent_left)

    def progress(self):
        """
        :return: The progress percentage of the book
        :rtype: int
        """
        print(self.current_page)
        return int(self.current_page // self.total_pages)


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()
