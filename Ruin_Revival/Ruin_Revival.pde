//Xavier, Kanon, Casey
//zombie apocolyps game

import processing.sound.*;

Player p = new Player();
Zombies z;
Map m;
Barrier b;

PImage start, load, tree, water, grass, cobble;

boolean startGame, loadGame;

int mapxSize = 15;
int mapySize = 15;
int score;

int zomTimer = 0;


//sound stuff
//SoundFile backMusic;
boolean musicOn = false;

//map data
ArrayList<Barrier> barrier = new ArrayList<Barrier>();
char [][] map = new char[mapxSize][mapySize];
String mapStr = "";

void setup()
{
  
  fullScreen();
  
  //backMusic = new SoundFile(this, "music.mp3");
  
  rectMode(CENTER);
  imageMode(CENTER);

  start = loadImage("start_button.png");
  load = loadImage("load_button.png");
  tree = loadImage("tree1.png");
  water = loadImage("water1.png");
  grass = loadImage("grass3.png");
  cobble = loadImage("cobble.png");
  start.resize(450, 0);
  load.resize(450, 0);
  tree.resize(250, 0);
  water.resize(250, 0);
  grass.resize(250, 0);
  cobble.resize(250, 0);
  startGame = false;
  loadGame = false;
  
  p = new Player();
  z = new Zombies();
  m = new Map();
  
  setupMap();
  
}

void draw()
{
  background(0);
  
  //music
  if(musicOn == true)
  {
    //backMusic.play();
    musicOn = false;
  }
  
  drawButtons();
      
  if(startGame || loadGame)
  {
    background(0);
    noCursor();
    drawMap();
    p.drawPlayer();
    p.movePlayer();
    z.drawZombie();
<<<<<<< HEAD
    z.moveZombie();
    
    blockPathing( p );
=======
    if(zomTimer >= 22)
    {
      z.moveZombie();
      zomTimer = 0;
    }  
>>>>>>> f0f5e3e4d768eb17f9f13907b805c12b5fbf0387
  }
  
  zomTimer++;
}

void setupMap()
{
  mapStr += "###############"; //15x15 map
  mapStr += "#             #";
  mapStr += "#             #"; // * - cobble
  mapStr += "#    ***      #";
  mapStr += "#      ***    #"; // # - trees
  mapStr += "#        ***  #";
  mapStr += "#    $$   **  #"; // $ - water
  mapStr += "#   $$$$   ** #";
  mapStr += "#  $$$$$$  ** #"; // space - grass
  mapStr += "#   $$$$  **  #";
  mapStr += "#    $$   **  #";
  mapStr += "#        **   #";
  mapStr += "#  *******    #";
  mapStr += "#             #";
  mapStr += "###############";
  
  //Populates char array with the characters of mapStr
  for( int i = 0; i < map.length; i++ )
  {
    for( int j = 0; j < map[0].length; j++ )
    {
      map[j][i] = mapStr.charAt(j+i*15);
    }
  }
}

void drawMap()
{
  rectMode(CENTER);
  noStroke();
  //noFill();
  
  
  //Draws the terrain to make the map
  for( int i = 0; i < map.length; i++ )
    for( int j = 0; j < map[0].length; j++)
    {
      if(map[j][i]=='#')
        image(tree, m.mapXpos+j*275,m.mapYpos+i*275);
      else if(map[j][i]==' ')
        image(grass, m.mapXpos+j*250,m.mapYpos+i*250);
      else if(map[j][i]=='$')
        image(water, m.mapXpos+j*250,m.mapYpos+i*250);
      else if(map[j][i]=='*')
        image(cobble, m.mapXpos+j*250,m.mapYpos+i*250);
    }
}


void drawButtons()
{
 
  textSize(150);
  text("Ruin Revival", width/3.25, height/4);
  
  image(start, width/2, height/2);
  image(load, width/2, height/1.25);
  
}

void saveGame()
{
  try
  {
    //Use a PrintWriter to send your information to a chosen file
    PrintWriter pw = createWriter( "save.txt" );
    pw.println( p.xPos );
    pw.println( p.yPos );
    //pw.println( score );
    
    pw.flush(); //Writes the remaining data to the file
    pw.close(); //Finishes the file
  }
  catch(Exception e)
  {
    println("SOMETHING WENT WRONG SAVING");
  }
}

void loadGame()
{
  
  try
  {
    //Use the loadStrings() method to pull the lines of your save file into a String array
    String [] data = loadStrings("save.txt"); // <- This will be the name of the save file
    p.xPos = Float.parseFloat(data[0]);
    p.yPos = Float.parseFloat(data[1]);      //  If a file already exists, it will overwrite
    //score = Integer.parseInt(data[2]);
  }
  catch(Exception e)
  {
    println("SOMETHING WENT WRONG LOADING");
    
    //Loads default data
    p.xPos = width/2;
    p.yPos = height/2;
    score = 0;
  }
}

void mouseClicked()
{
  //start game
  if( mouseX >= width/2-225 && mouseX <= width/2+225 && mouseY >= height/2-(450/2) && mouseY <= height/2+(450/2) )
  {
    startGame = true;
    musicOn = true;
  }
  
  //load game
  if( mouseX >= width/2-225 && mouseX <= width/2+225 && mouseY >= height/1.25-(225/2) && mouseY <= height/1.25+(225/2) )
  {
    loadGame = true;
    loadGame();
    musicOn = true;
  }
}

void keyPressed()
{
  if(key == 'a' || key == 'A' || keyCode == LEFT)
    p.left = true;
  if(key == 'd' || key == 'D' || keyCode == RIGHT)
    p.right = true;
  if(key == 'w' || key == 'W' || keyCode == UP)
    p.up = true;
  if(key == 's' || key == 'S' || keyCode == DOWN)
    p.down = true;
    
  if(key == ' ')
    saveGame();
}

void keyReleased()
{
  if(key == 'a' || key == 'A' || keyCode ==LEFT)
    p.left = false;
  if(key == 'd' || key == 'D' || keyCode == RIGHT)
    p.right = false;
  if(key == 'w' || key == 'W'|| keyCode == UP)
    p.up = false;
  if(key == 's' || key == 'S' || keyCode == DOWN)
    p.down = false;
}
