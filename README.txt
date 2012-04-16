** Originally produced as an assignment for Monash University **
** FIT3088 Computer Graphics, Semester 1, 2012 **
** Author: Michael Nguyen, contact@mikeyn.net **
---------------

How to play:

- The game can be played with a mouse and/or a keyboard. 
- Using the mouse, the user can click anywhere on a square to select it. 
- If the square has no unit occupying it, nothing will happen. 
- If the square has a unit, the square will be highlighted red. 
- This action can also be done with the keyboard by typing the cell co-ordinate based off the x-y axes notation. ie: pressing '4' then 'a' will select the 1st column in the 4th row (cell: 4a). Note that lower case and upper case is accepted, and invalid inputs are disregarded.
- With a unit selected, the player can move that unit to any cell on the entire chess grid by either clicking with a mouse or using the keyboard.
- The selected chess piece will move to that destination square and if the designated square has a piece on it, it will die.
- The player can control both black and white pieces.
- No rules of Chess are enforced.

======================
**Special key Presses:**
======================

------------------------
r/R: Read a file Input
------------------------
The program is able to read and play out a series of moves in a file "positions.txt" in the /data folder. The format of each step is important for it to properly work. The format is as follows:

1a>4b

Where '1a' is the first position, followed by a '>' symbol and then the next position. Any invalid positions are disregarded.

------------------------
m/M: Change display mode
------------------------
The game can switch between different representations of the pieces from a) all graphics b) all text and c) half text, half graphics split in between the middle of the chess vertically.

