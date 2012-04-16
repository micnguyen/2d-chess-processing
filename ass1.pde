/** FIT3088 Computer Graphics, Semester 1, 2012
 * Assignment 1 - 2D Representation of Chess Positions
 * Monash University, Australia
 * Michael Hieu Nguyen, 22042962, mhngu10@student.monash.edu
 * Last modified: 11/04/12
 *
 * Description: A very primitive 2D chess game that doesn't enforce
 * the rules of chess. Read the included README.pdf for further information.
 * 
 * Uses external images under a Creative Commons licence.
 * Source of image: http://openclipart.org/detail/11373/chess-set-by-akiross
 */

PFont CambriaFont;
boolean selected = false;
String keyPress = "";
String gridSelected = "";
ChessPiece selectedPiece;
boolean pieceSelected = false;
int indexOfPieceToDie;
int displayMode = 0;

ChessPiece[] chessPiecesAlive = new ChessPiece[32];

void setup()
{
  smooth(); // Setting anti-aliasing for smooth graphics

  size(1000, 1000); // 1000px * 1000px window
  CambriaFont = loadFont("Cambria-48.vlw"); // Importing font style
  textFont(CambriaFont, 32); // Setting font style and size
  setupChessPieces();

  drawAxes();
  drawGrid();
}

// Method used to setup all Chess pieces' details
// and add them to array of currently alive pieces
// Note: Knight is spelt as Night to different k(N)ight from (K)ing.
void setupChessPieces()
{
  ChessPiece black_rook1 = new ChessPiece("Rook", "1a", 0);
  ChessPiece black_knight1 = new ChessPiece("Night", "1b", 0);
  ChessPiece black_bishop1 = new ChessPiece("Bishop", "1c", 0);
  ChessPiece black_king = new ChessPiece("King", "1e", 0);
  ChessPiece black_queen = new ChessPiece("Queen", "1d", 0);
  ChessPiece black_bishop2 = new ChessPiece("Bishop", "1f", 0);
  ChessPiece black_knight2 = new ChessPiece("Night", "1g", 0);
  ChessPiece black_rook2 = new ChessPiece("Rook", "1h", 0);
  ChessPiece black_pawn1 = new ChessPiece("Pawn", "2a", 0);
  ChessPiece black_pawn2 = new ChessPiece("Pawn", "2b", 0);
  ChessPiece black_pawn3 = new ChessPiece("Pawn", "2c", 0);
  ChessPiece black_pawn4 = new ChessPiece("Pawn", "2d", 0);
  ChessPiece black_pawn5 = new ChessPiece("Pawn", "2e", 0);
  ChessPiece black_pawn6 = new ChessPiece("Pawn", "2f", 0);
  ChessPiece black_pawn7 = new ChessPiece("Pawn", "2g", 0);
  ChessPiece black_pawn8 = new ChessPiece("Pawn", "2h", 0);

  ChessPiece white_pawn1 = new ChessPiece("Pawn", "7a", 1);
  ChessPiece white_pawn2 = new ChessPiece("Pawn", "7b", 1);
  ChessPiece white_pawn3 = new ChessPiece("Pawn", "7c", 1);
  ChessPiece white_pawn4 = new ChessPiece("Pawn", "7d", 1);
  ChessPiece white_pawn5 = new ChessPiece("Pawn", "7e", 1);
  ChessPiece white_pawn6 = new ChessPiece("Pawn", "7f", 1);
  ChessPiece white_pawn7 = new ChessPiece("Pawn", "7g", 1);
  ChessPiece white_pawn8 = new ChessPiece("Pawn", "7h", 1);
  ChessPiece white_rook1 = new ChessPiece("Rook", "8a", 1);
  ChessPiece white_knight1 = new ChessPiece("Night", "8b", 1);
  ChessPiece white_bishop1 = new ChessPiece("Bishop", "8c", 1);
  ChessPiece white_king = new ChessPiece("King", "8e", 1);
  ChessPiece white_queen = new ChessPiece("Queen", "8d", 1);
  ChessPiece white_bishop2 = new ChessPiece("Bishop", "8f", 1);
  ChessPiece white_knight2 = new ChessPiece("Night", "8g", 1);
  ChessPiece white_rook2 = new ChessPiece("Rook", "8h", 1);

  chessPiecesAlive[0] = black_rook1;
  chessPiecesAlive[1] = black_knight1;
  chessPiecesAlive[2] = black_bishop1;
  chessPiecesAlive[3] = black_king;
  chessPiecesAlive[4] = black_queen;
  chessPiecesAlive[5] = black_bishop2;
  chessPiecesAlive[6] = black_knight2;
  chessPiecesAlive[7] = black_rook2;
  chessPiecesAlive[8] = black_pawn1;
  chessPiecesAlive[9] = black_pawn2;
  chessPiecesAlive[10] = black_pawn3;
  chessPiecesAlive[11] = black_pawn4;
  chessPiecesAlive[12] = black_pawn5;
  chessPiecesAlive[13] = black_pawn6;
  chessPiecesAlive[14] = black_pawn7;
  chessPiecesAlive[15] = black_pawn8;

  chessPiecesAlive[16] = white_pawn1;
  chessPiecesAlive[17] = white_pawn2;
  chessPiecesAlive[18] = white_pawn3;
  chessPiecesAlive[19] = white_pawn4;
  chessPiecesAlive[20] = white_pawn5;
  chessPiecesAlive[21] = white_pawn6;
  chessPiecesAlive[22] = white_pawn7;
  chessPiecesAlive[23] = white_pawn8;
  chessPiecesAlive[24] = white_rook1;
  chessPiecesAlive[25] = white_knight1;
  chessPiecesAlive[26] = white_bishop1;
  chessPiecesAlive[27] = white_king;
  chessPiecesAlive[28] = white_queen;
  chessPiecesAlive[29] = white_bishop2;
  chessPiecesAlive[30] = white_knight2;
  chessPiecesAlive[31] = white_rook2;
}

// Method to draw x and y axes
void drawAxes()
{
  textAlign(CENTER); // Align text to center
  int letter = 65; // Setting ASCII value of letter 'A'
  int number = 1; // Setting y axis numbering starting at 1

    for (int i = 150; i <= 850; i=i+100) // x axis label (top, letters)
  {
    text(char(letter++), i, 70);
  }

  for (int i = 165; i <= 865; i=i+100) // y axis label (left, numbers)
  {
    text(number++, 65, i);
  }
}

// Method to draw entire chess grid
void drawGrid()
{
  int colour = 1; // Setting an integer to represent black/white for use later.

  for (int i = 150; i < 950; i=i+100) // y axis loop (Rows)
  {
    for (int j = 150; j < 950; j=j+100) // x axis loop (Columns)
    {
      pushMatrix(); // Save the original matrix state onto stack
      translate(j, i); // Translate point of reference to next point for grid
      drawSquare(colour); // Call drawSquare method with corresponding colour
      popMatrix(); // Pop stored matrix (original matrix) to undo translation
      colour = colour * -1; // Invert the colour for the next square
    }
    colour = colour * -1; // Additional inverting of colour for next row
  }
}

// Constantly run method to refresh location of chess pieces on screen
void draw()
{  
  // Iterate through the every chess piece that is still alive
  for (int i = 0; i < 32; i++)
  {
    if (chessPiecesAlive[i].isAlive()) 
    {
      // If it's new x/y is the same as it's old x/y (for animation purposes), ie: it has completed its animation.
      if (chessPiecesAlive[i].xcor == chessPiecesAlive[i].newxcor && chessPiecesAlive[i].ycor == chessPiecesAlive[i].newycor) 
      {
        // A condition to prevent a bug that was preventing switching modes right from the start when a piece was not selected.
        if (!chessPiecesAlive[i].inDefaultPosition()&&pieceSelected==false)
        {
          drawGrid();
        }
        chessPiecesAlive[i].display(); // Display on screen only the ones that are alive
      }
      else // Animation refresh to prevent "shadows"
      {
        drawGrid();
        chessPiecesAlive[i].display();
      }

      // Iterate through every other piece that is not the one currently animating
      for (int j = 0;j<32; j++)
      {
        if (i!=j) // Don't redraw the one moving
        {
          if (chessPiecesAlive[j].isAlive()) 
          {
            chessPiecesAlive[j].display(); // Draw it again to refresh each piece in each frame of animation to clean up after shadows
          }
        }
      }
    }
  }
}


// Method to draw a square chess grid position
// Parameter - int: colour, integer to represent black or white
void drawSquare(int colour)
{
  if (colour==1) // If the passed parameter is 1, make the square white.
  {
    fill(255);
  }
  else // Else, if it is not 1 (likely to be -1), then fill it black.
  {
    fill(0);
  }

  rect(-50, -50, 100, 100); // Draw the rectangle.
}

// Method to see if the clicked mouse position is within the chess grid
boolean isInsideBoard(int mouseXcor, int mouseYcor)
{
  // 100 for mouseX/mouseY refers to the very top left corner of 1a
  // ie: the further legal clickable position
  if (mouseXcor < 100 || mouseYcor < 100 || (mouseXcor < 100 && mouseYcor < 100) || (mouseXcor > 900 && mouseYcor > 900) || (mouseXcor > 900 || mouseYcor > 900))
  {
    System.out.println("Invalid Position");
    return false;
  }
  else
  {
    return true;
  }
}

// Method that is called from mouseClicked() that looks at the position of a mouse click
// and converts that to a notated version of the grid set. If it has a unit on that position, 
// it then highlights the grid and saves the relevant piece/grid information for later use.
// Note: Remember, bulk of method does not activate if:
// a) a piece has already been selected. This is the "choose piece to do something" method.
// b) if the chosen grid has no unit on it.
void selectPieceOnGrid(String position)
{
  // If the selected grid position has a unit on it and you haven't already selected a piece
  if (!checkEmpty(position) && pieceSelected==false) 
  {
    selectSquare(position); // Colour the selected piece/grid red
    gridSelected = position; // Save the notated version of clicked position
    selectedPiece = getChessPieceAt(position); // Get the chess piece on that  --------------------------- Consider removing get chess piece at function
    System.out.println("Unit type: " + selectedPiece.getName()); // Print out what type it is
    pieceSelected = true; // Set boolean flag to say that a piece is selected
  }
}

// Method to move a selected piece
void moveSelectedPiece(String position)
{
  System.out.println(position);
  boolean castling = false;
  // If you have already selected a piece (ie: there is a red cell on the chess set)
  if (pieceSelected==true)
  {
    


    // Castling Conditions
    if (selectedPiece.getName() == "King" && selectedPiece.inDefaultPosition() && selectedPiece!=chessPiecesAlive[indexOfPieceToDie]) // Prevent castling by undoing selection of kind
    {
      // Each quadrant for castling
      if (checkEmpty(position) && position.equals("1c") && checkEmpty("1b") && checkEmpty("1d"))
      {
        chessPiecesAlive[0].updatePosition("1d");
      }
      if (checkEmpty(position) && position.equals("1g") && checkEmpty("1f"))
      {
        chessPiecesAlive[7].updatePosition("1f");
      }
      if (checkEmpty(position) && position.equals("8g") && checkEmpty("8f"))
      {
        chessPiecesAlive[31].updatePosition("8f");
      }
      if (checkEmpty(position) && position.equals("8c") && checkEmpty("8b") && checkEmpty("8d"))
      {
        chessPiecesAlive[24].updatePosition("8d");
      }
    }

    // Check if the destination is occupied
    if (!checkEmpty(position))
    {
      // If it is occupied, get the index array of chessPiecesAlive[] that corresponds to the chess piece
      // that is sitting on the chess grid that you want to move to.
      indexOfPieceToDie = getIndexOfChessPieceAt(position);

      // Check to see if that piece isn't itself and so it doesn't kill itself
      // ie: to allow a user to "unclick" a selected unit
      if (chessPiecesAlive[indexOfPieceToDie]!=selectedPiece)
      {

        System.out.println(chessPiecesAlive[indexOfPieceToDie].getName() + " has died. :(");
        chessPiecesAlive[indexOfPieceToDie].kill();
      }
      else
      {
        // Unselect the piece and decrement its move counter (revert back to what it was before the move)
        System.out.println("Unselected " + selectedPiece.getName());
        selectedPiece.undo();
      }
    }
  }

  // Move select unit to the destination
  selectedPiece.updatePosition(position);
  
  // Pawn/Queen Protion Criteria
  if (selectedPiece.getName() == "Pawn" && selectedPiece.getColour() == 0)
  {
    if (position.charAt(0) == '8')
    {
      selectedPiece.promote();
    }
  }
  if (selectedPiece.getName() == "Pawn" && selectedPiece.getColour() == 1)
  {
    if (position.charAt(0) == '1')
    {
      selectedPiece.promote();
    }
  }


  System.out.println(selectedPiece.getName() + " has moved to " + position);
  pieceSelected = false; // Unselect whatever chess piece has finished its move
  drawGrid(); //  Redraw the grid to refresh cell positions
}

// Default Method for detecting mouse clicks
String clickedCell;
void mouseClicked()
{

  if (!isInsideBoard(mouseX, mouseY)) // Method to check if the selected position is actually on the board
  {
    return; // If outside grid, don't do anything
  }

  clickedCell = convertToNotation(mouseX/100, mouseY/100);
  System.out.println("Cell position selected: " + clickedCell);

  if (!pieceSelected) // If the user hasn't selected a piece already
  {
    selectPieceOnGrid(clickedCell); // Run a method that finds the respective piece on that grid position
  }
  else // else, if a piece is selected, move it to the new clicked position
  {
    moveSelectedPiece(clickedCell);
  }
}

// Method that returns the respective chess piece sitting on an notated grid position.
ChessPiece getChessPieceAt(String position)
{
  int indexOfPiece = 0;
  for (int i = 0; i<chessPiecesAlive.length ; i++)
  {
    if (chessPiecesAlive[i].getPosition().equals(position))
    {
      indexOfPiece = i;
    }
  }
  return chessPiecesAlive[indexOfPiece];
}

// Method that returns an int array index from chessPiecesAlive[]
// that is sitting on a notated grid position.
int getIndexOfChessPieceAt(String position)
{
  int indexOfPiece = -1;
  for (int i = 0; i<chessPiecesAlive.length ; i++)
  {
    if (chessPiecesAlive[i].getPosition().equals(position))
    {
      indexOfPiece = i;
    }
  }
  return indexOfPiece;
}

// Method that converts an absolute xy co-ordinate to a notated grid position 
// using ASCII values
String convertToNotation(int x, int y)
{
  String notationPosition = "" + (char(y+48)) +(char(x+96));
  return notationPosition;
}

// Method to check if a notated grid position has a unit sitting on it.
boolean checkEmpty(String position)
{

  for (int i = 0; i<chessPiecesAlive.length ; i++)
  {
    if (chessPiecesAlive[i].getPosition().equals(position))
    {
      System.out.println("Cell is occupied!");
      return false;
    }
  }
  System.out.println("Cell is empty!");
  return true;
}

// Method to highlight a selected square
// where 1 < x||y < 8
void selectSquare(String position)
{
  fill(255, 0, 0);
  pushMatrix();
  translate( convertToX(position)+50, convertToY(position)+50 );
  rect(-50, -50, 100, 100);
  popMatrix();
}

// Extracts the x co-ordinate from a cell position
int convertToX(String position)
{
  int xcor = int(position.charAt(1)-96) * 100 ;
  return xcor;
}

// Extracts the y co-ordinate from a cell position
int convertToY(String position)
{
  int ycor = int(position.charAt(0)-48) * 100;
  return ycor;
}

// Methdo to read positions.txt
void readFile()
{
  String fileLine;
  String fileName = dataPath("positions.txt");
  boolean validLine = false;
  String[] splitInput = new String[2];
  int i = -1;
  int j = -1;
  try
  {
    System.out.println("Reading positions from file positions.txt");
    System.out.println("Disregarding invalid line format.");
    BufferedReader file = new BufferedReader(new FileReader(fileName));

    while ( (fileLine = file.readLine ())!=null) // Read each line, if it is not empty
    {
      System.out.println("Read line: " + fileLine);
      splitInput = splitTokens(fileLine, ">"); // Tokenise on > character, no serious error checking
      String first_entry = splitInput[0];
      String second_entry = splitInput[1];
      System.out.println(splitInput[0] + " " + splitInput[1]);

      if (!checkEmpty(first_entry)) // Checks to see if the first position has a unit on it and grabs the appropriate square/unit
      {
        selectSquare(first_entry);
        i = getIndexOfChessPieceAt(first_entry);
      }
      if (i!=-1) // Boolean to check if a proper piece has been chosen
      {
        if (!checkEmpty(second_entry)) // Kill the piece if it exists on the destination square before moving and redrawing grid.
        {
          j = getIndexOfChessPieceAt(second_entry);
          chessPiecesAlive[j].kill();
        }
        chessPiecesAlive[i].updatePosition(second_entry);
        drawGrid();
        System.out.println(chessPiecesAlive[i].getName());
      }

    }
  } 
  catch (IOException e)
  {  
    e.printStackTrace();
    fileLine = null;
  }
}

// Native methd to detect key presses
void keyPressed()
{

  keyPress = keyPress + key;
  if (keyPress.length() == 2) // Only take keyboard presses in sets of 2
  {
    System.out.println("Keyboard press: " + keyPress);
    if (validPosition(keyPress)) // If the position is a valid position on the board
    {

      if (!pieceSelected) // If the user hasn't selected a piece already
      {
        selectPieceOnGrid(keyPress); // Run a method that finds the respective piece on that grid position
      }
      else // else, if a piece is selected, move it to the new clicked position
      {
        moveSelectedPiece(keyPress);
      }
    }  
    else
    {
      System.out.println("You entered an invalid position");
    }
    keyPress = ""; // Reset the key input
  }

  // Read special key inputs for certain methods
  switch(key)
  {
  case 'r':
  case 'R':
    readFile();
    break;
  case 'm':
  case 'M':
  // Change display Mode
    boolean allDefaultPosition = true;
    for (int i =0; i<32; i++)
    {
      if (!chessPiecesAlive[i].inDefaultPosition())
      {
        allDefaultPosition = false;
      }
      if (allDefaultPosition && !pieceSelected) // needed to prevent odd bug not working at start
      {
        drawGrid();
      }
    }
    switchDisplay(); 
    break;
  }
}

// Returns true if the position is a valid position on the grid
boolean validPosition(String position)
{
  boolean validletter;
  boolean validnumber;
  validnumber = (int(position.charAt(0))-48 >= 1 && position.charAt(0)-48<=8);
  validletter = (int(position.charAt(1))-96 >= 1 && position.charAt(1)-96<=8);
  return (validnumber && validletter);
}

// Method to change display mode
void switchDisplay()
{
  drawGrid(); // Refresh the grid to be able to redraw all other chess pieces
  if (displayMode==0)
  {
    displayMode=1;
  }
  else
  {
    if (displayMode==1)
    {
      displayMode=2;
    }      
    else
    {
      displayMode=0;
    }
  }
  selectSquare(gridSelected); // Reselect the square/piece that was selected before the display change
}

// Class to Represent a ChessPiece
class ChessPiece
{
  String name;
  String position;
  int colour;
  int xcor;
  int ycor;
  int newxcor;
  int newycor;
  PImage chessImg;
  boolean isAlive = true;
  int moves = 0;

  // Default constructor
  public ChessPiece(String name, String position, int colour)
  {
    this.name = name;
    this.position = position;
    this.colour = colour;
    assignTypeImg(name);
    xcor = convertToX(position);
    ycor = convertToY(position);
  }

  // The first run method when creating the visual representation
  void setup()
  {
    size(100, 100);
    display();
  }

  // Method that displays pieces in their position on the screen
  void display()
  {
    assignPieceColour(this.colour);

    newxcor=convertToX(position);
    newycor=convertToY(position);

    pushMatrix();
    translate(xcor, ycor);
    // Display mode 0: Graphics
    if (displayMode==0)
    {
      image(chessImg, -50, -50);
    }

    // Display Mode 1: Text 
    if (displayMode==1)
    {
      if (colour==0)
      {
        fill(70);
      }
      else
      {
        fill(180);
      }
      text(name.charAt(0), 0, 0);
    }

    // Display Mode 2: Half text/half graphics
    if (displayMode==2)
    {
      if (xcor>450)
      {
        image(chessImg, -50, -50);
      }
      else
      {
        if (colour==0)
        {
          fill(70);
        }
        else
        {
          fill(180);
        }
        text(name.charAt(0), 0, 0);
      }
    }

    // For animation purposes: new x/y is the destination, x/y is the old destination. Change co-ordinates based off different.
    if (newxcor == xcor && newycor == ycor)
    {
    }
    else
    {
      if (xcor < newxcor)
      {
        xcor=xcor + 2;
      }
      if (xcor > newxcor)
      {
        xcor=xcor -2;
      }
      if (ycor < newycor)
      {
        ycor=ycor+2;
      }
      if (ycor > newycor)
      {
        ycor=ycor-2;
      }
    }
    popMatrix();
  }

  // Method to assign a graphic given the relevant chess type
  // Uses files inside /data
  // Image source at top of this file.
  void assignTypeImg(String name)
  {
    switch(name.charAt(0))
    {
    case 'P':
      chessImg = loadImage("pawn.png");
      break;
    case 'R':
      chessImg = loadImage("rook.png");
      break;
    case 'N':
      chessImg = loadImage("knight.png");
      break;
    case 'B':
      chessImg = loadImage("bishop.png");
      break;
    case 'Q':
      chessImg = loadImage("queen.png");
      break;
    case 'K':
      chessImg = loadImage("king.png");
      break;
    }
  }

  // Method to colour the graphic for the appropriate player
  void assignPieceColour(int colour)
  {
    if (colour == 0)
    {
      tint(100);
    }
    else
    {
      noTint();
    }
  }

  // Method to kill the chess piece
  void kill()
  {
    isAlive = false;
    position = "";
  }

  // Method to check if the chess piece is alive
  boolean isAlive()
  {
    return isAlive;
  }

  // Method to update position of a ches piece
  void updatePosition(String newPosition)
  {
    moves++;
    this.position = newPosition;
  }

  boolean inDefaultPosition()
  {
    return (moves==0);
  }

  // Method that converts a notated position into it's apropriate global XY co-ordinate
  // ie: 1a will give you 150, 150 - the absolute centre of the grid
  int convertToX(String position)
  {

    return ((int(position.charAt(1))-96) * 100) + 50;
  }

  int convertToY(String position)
  {
    return ((int(position.charAt(0))-48) * 100) + 50;
  }

  String getName()
  {
    return this.name;
  }
  String getPosition()
  {
    return position;
  }
  void undo()
  {
    moves--;
  }

  void promote()
  {
    name = "Queen";
    assignTypeImg(this.name);
  }

  int getColour()
  {
    return colour;
  }
}

