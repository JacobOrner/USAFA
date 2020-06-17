__author__ = 'C18Jacob.Orner'

import easygui


def main():
    """Main program to demonstrate the import statements and string formatting."""
    elements = ['A1', 'A2', 'A3', 'B1', 'B2', 'B3', 'C1', 'C2', 'C3']
    scores = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    rank = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    total = [elements, scores, rank]
    high = 0
    position = 1
    i = 0
    count = 0

    for item in elements:
        scores[i] = easygui.integerbox("Enter the average score for {}".format(item), "Scores", "", 0, 100)
        i += 1

    for a in range(9):
        for b in range(9):
            if rank[b] == 0:
                if scores[b] >= high:
                    high = scores[b]
        for n in range(9):
            if scores[n] == high:
                rank[n] = position
                count += 1
        high = 0
        position += count
        count = 0




    print("Element | Score | Rank |")
    print("----------------------")
    for n in range(len(elements)):
        print("   {}\t|  {} \t|   {}\t|".format(elements[n], scores[n], rank[n]))


# The following two lines are always the last lines in a source file and they
# start the execution of the program; everything above was just definitions.
if __name__ == "__main__":
    main()

