//2D-Arrays
//Used to hold the 'tiles' of a map

//File IO
//Used to store/load data from an external file

//Player Data
int playerX=1, playerY=1; //X and Y position on grid
long coins; //number of coins collected

//Map Data
char [][] map = new char[10][10]; //2D Array, ten by ten

String mapStr = ""; //String to be used to build map

//Save stuff
boolean onSavePoint = false;

void setup()
{
  size(700,700);
  textSize(30);
  
  //Load the game state from file (if one exists)
  loadGame();
  
  //Builds map using the 2D array
  setupMap();
}

void draw()
{
  background(70);
  
  drawMap();
  
  drawPlayer();
  
  drawHUD();
}

//This adds characters to the string, forming a map we can put into the 2D array
void setupMap()
{
  mapStr += "##########";
  mapStr += "#       *#"; // * - save point
  mapStr += "#  $     #";
  mapStr += "#  ###   #"; // # - wall
  mapStr += "#$ #$#  $#";
  mapStr += "#$ # #   #"; // $ - coin
  mapStr += "#        #";
  mapStr += "#     $  #";
  mapStr += "#* $     #";
  mapStr += "##########";
  
  //Populates char array with the characters of mapStr
  for( int i = 0; i < map.length; i++ )
  {
    for( int j = 0; j < map[0].length; j++ )
    {
      map[j][i] = mapStr.charAt(j+i*10);
    }
  }
}

void drawMap()
{
  rectMode(CORNER);
  noStroke();
  
  //Draws colored squares to make the map
  for( int i = 0; i < map.length; i++ )
    for( int j = 0; j < map[0].length; j++)
    {
      if(map[j][i]=='#')
        fill(200);
      else if(map[j][i]==' ')
        fill(0,100,0);
      else if(map[j][i]=='$')
        fill(200,200,0);
      else if(map[j][i]=='*')
        fill(0,0,200);
      rect(j*70,i*70,70,70);
    }
}

void drawPlayer()
{
  fill(200,0,0);
  ellipse(playerX*70+35,playerY*70+35,70,70);
}

void drawHUD()
{
  fill(0);
  text("Coins: " + coins, 10,30);
  if( map[playerX][playerY]=='*' )
    text("TYPE (S) TO SAVE",width/2-50,30);
}

void attemptMove( char direction ) //Check if you can legally move there
{                                  //Collect coin if appropriate
  if     ( direction == 'l' && map[playerX-1][playerY] != '#' ) //Left
    playerX--;
  else if( direction == 'r' && map[playerX+1][playerY] != '#' ) //Right
    playerX++;
  else if( direction == 'u' && map[playerX][playerY-1] != '#' ) //Up
    playerY--;
  else if( direction == 'd' && map[playerX][playerY+1] != '#' ) //Down
    playerY++;
  else //Not a legal move
    return;
  
  if( map[playerX][playerY] == '$' ) //Collect coin
    coins++;
  
  if( map[playerX][playerY] == '*' ) //Stepped on save
    onSavePoint = true;
}

void keyPressed()
{
  //Checks which direction they tried to move and attempts to move there
  if( keyCode == LEFT )
    attemptMove('l');
  if( keyCode == RIGHT )
    attemptMove('r');
  if( keyCode == UP )
    attemptMove('u');
  if( keyCode == DOWN )
    attemptMove('d');
  
  //Saves the game if player is standing on a save point
  if( ( key == 's' || key == 'S' ) && map[playerX][playerY]=='*' )
    saveGame();
}

void saveGame()
{
  try
  {
    //Use a PrintWriter to send your information to a chosen file
    PrintWriter pw = createWriter( "save.txt" );
    pw.println( playerX );
    pw.println( playerY );
    pw.println( coins );
    
    pw.flush(); //Writes the remaining data to the file
    pw.close(); //Finishes the file
  }
  catch(Exception e)
  {
    println("SOMETHING WENT WRONG");
  }
}

void loadGame()
{
  
  try
  {
    //Use the loadStrings() method to pull the lines of your save file into a String array
    String [] data = loadStrings("save.txt"); // <- This will be the name of the save file
    playerX = Integer.parseInt(data[0]);
    playerY = Integer.parseInt(data[1]);      //  If a file already exists, it will overwrite
    coins = Integer.parseInt(data[2]);
  }
  catch(Exception e)
  {
    println("SOMETHING WENT WRONG");
    
    //Loads default data
    playerX = 1;
    playerY = 1;
    coins = 0;
  }
}
