## Prelab

### Data types

| Size | Signed/Unsigned | Type | Min value | Max value |
| :---: | :---: | :---: | :---: | :---: |
| 8-bit | unsigned | char | 0| 255 |
| 8-bit | signed | signed char | -128 | 127 |
| 16-bit | unsigned | unsigned short | 0| 65 535 |
| 16-bit | signed | int | -32 768 | 32 767 |
| 32-bit | unsigned | unsigned long | 0 | 4 294 967 295 |
| 32-bit | signed | long | -2 147 483 648 | 2 147 483 647 |
| 64-bit | unsigned | unsigned long long | 0 | 18 446 744 073 709 551 615 |
| 64-bit | signed | long long | 9 223 372 036 854 775 808 | 9 223 372 036 854 775 807 |


| Type | Meaning | C typedef declaration |
| :---: | :---: | :---: |
| int8 | unsigned 8-bit value | typedef char int8; |
| sint8 | signed 8-bit value | typedef signed char sint8; |
| int16 | unsigned 16-bit value | typedef unsigned short int16;|
| sint16 | signed 16-bit value | typedef int sint16; |
| int32 | unsigned 32-bit value | typedef unsigned long int32; |
| sint32 | signed 32-bit value | typedef long sint32; |
| int64 | unsigned 64-bit value | typedef unsigned long long int64; |
| sint64 | signed 64-bit value | typedef long long sint64; |

### Calling/Return Convention

| Iteration | a | b | c | d | e |
| :---: | :---: | :---: | :---: | :---:| :---: |
| 1st | 1 | 2 | 3 | 4 | 1 | 
| 2nd | 10 | 9 | 8 | 7 | 10 | 
| 3rd | 16 | 15 | 14 | 13 | 16 | 
| 4th | 22 | 21 | 20 | 19 | 22 | 
| 5th | 28 | 27 | 26 | 25 | 28 |

| Parameter | Value Sought |
| :---: | :---: |
| Starting address of `func` | 0xC044 |
| Ending address of `func` | 0xC050 |
| Register holding w | r12 |
| Register holding x | r13 |
| Register holding y | r14 |
| Register holding z | r15|
| Register holding return value | r12 |

### Cross language build constructs

What is the role of the `extern` directive in a .c file?  Hint: check out the [external variable](http://en.wikipedia.org/wiki/External_variable) Wikipedia page.

`extern` means "declare without defining" and that the variable is declared without assigning any memory for it

What is the role of the `.global` directive in an .asm file (used in lines 60-64)?  Hint: reference section 2.6.2 in the MSP 430 Assembly Language Tools v4.3 User's Guide.

can act as either `.def` to define the symbol in the current file to be used in another or as `.ref` to reference the symbol that is defined in another file

##Preliminary Design
In order to implement the required functionality, the drawBox subroutine from the previous lab had to be adapted to be able to draw a box of a specified color and move the box around depending on the button inputs.  In order to adapt drawBox to the C program, drawBox and drawPixel subroutines were copied from Lab 3. The upper limits from the drawBox function were replaced with predefined constants for the length and width of the box.  A while loop was then added to which tested if the directional buttons were pressed and if the box's x and y values were within the LCD screen's limits.  If so, the x or y value was incremented and the box was drawn.  In order to switch which color was to be drawn, the color variable is checked when the auxiliary button is pressed and if the color is red, set to black or vice versa.  after checking each button, a 160ms delay is added to allow the buttons to clear for the next pass.

When implementing B functionality, the box was given an x and y velocity that will be added to the box's position to move it every loop.  To move the box, the original box location is cleared, the box position is updated using the velocity and the new box is drawn using the updated coordinates. When checking for boundary detection, during each moveBall function call, the x and y position are compared to the screen's boundaries.  If the ball's position is outside the boundary values, the ball will jump back to the side of the screen and the corresponding x or y velocity is inverted.

##Testing and Debugging Methodology
Before being able to start the programming of the required functionality, a dry run of the given code was attempted that would initialize the MSP430 as well as the LCD screen, clear the LCD screen and then enter an infinite while loop.  However, due to not including a delay between the MSP initialization and the LCD initialization, the screen was never properly initialized and none of the data communication subroutines would function preventing the screen from never clearing.  By putting a short 40ms delay between the two initialization subroutines, the program was able to run as expected allowing coding of the required functionality to begin.

When programming both initial and B functionality, the issue would arise that the drawing would jump back to the top of the screen before reaching the lowest boundary.  It was discovered that in the given drawPixel subroutine from Lab3_given.asm, the two move instructions crucial to establishing the x and y position of the pixel was written only as a byte operation and not a word operation.  This resulted in the values overflowing upon reaching 255 and being unable to reach the desired screen max of 320.  Once the move instruction was set to word operation, the subroutines functioned as expected allowed to draw all the way to the bottom of the screen.  

#### A Functionality

The requirement for A Functionality was to create Pong on the display by creating a single paddle that moves up and down on one side of the display, controlled by the up and down buttons. The block will bounce off the paddle like it bounces off the wall. When the block misses hitting the paddle, the game will end. In order to do this, I planned to create another struct in the program which defined the paddle. I did so by creating a struct with x and y position variables. Next, I created two functions. The first took in two integers as parameters and used these to create the paddle on the screen. The second allowed the user to use the buttons on the LCD Boosterpack to move the paddle on the screen. Once the paddle was created on the board, the next step was to create more functions to detect the ball hitting the paddle. In order to do this, I created a paddle contact function which checked if the ball hit the paddle after each movement of the ball. When this occurred, the ball's x velocity variable was inverted. Finally, I modified the right wall contact function so that when the ball struck the right side of the board, the game was reset.

In the creation of this functionality, I ran into problems when trying to detect if the ball hit the paddle. Initially, I only detected when the entire ball was within the top and bottom coordinates of the paddle. However, if the ball only partially hit the paddle, the contact would not be detected. In order to fix this issue, I had to change the variable checks for the upper part of the paddle to account for the radius of the ball. After doing so, the problem was fixed and the program worked to the required specifications in the lab.


#### Bonus Functionality

In working on the lab we implemented several bonus functionalities. The first was changing the square into a circle. In order to do this, and algorithm had to be implemented which took the radius of the ball, and calculated the necessary number of pixels on each level of the ball to be drawn. By doing so, the ball was implemented for bonus functionality.

Another bonus functionality that we implemented was the background image. In order to do this, a function was created that drew the image on the screen prior to the game beginning. However, we ran into problems as whenever the ball crossed over the image, the image was covered in black. In order to solve this problem, the draw picture function was called after each movement of the ball when it was in the area of the background image.


##Observations and Conclusion
The objective of this lab was to create both and etch-a-sketch and pong program on the LCD boosterpack using what's been learned in class. Also, bonus functionalities were able to be implemented including changing the square on the screen into a circle as well as creating a background image on the screen. I believe these objectives were met as the program successfully ran both the Etch-A-Sketch game as well as the Pong game and met all the requirements for each. Throughout the lab several obstacles were met in programming the games, however, through trial and error we were able to get the program to run according to specifications. This lab will help us in the future to create multi-language programs on the MSP430 board and LCD Boosterpack. 

**Documentation: None** 

