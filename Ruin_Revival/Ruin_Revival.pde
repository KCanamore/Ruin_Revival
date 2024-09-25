//Xavier, Kanon, Casey
//zombie apocolyps game

import processing.sound.*;

Player p = new Player();
Zombies z;
Map m;
Barrier B;

PImage title, start, load, tree1, tree2, tree3, tree4, water, grass, cobble, cabin;

boolean startGame, loadGame;
boolean isCabin = false;

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

  title = loadImage("title.png");
  start = loadImage("start_button.png");
  load = loadImage("load_button.png");
  tree1 = loadImage("tree1.png");
  tree2 = loadImage("tree2.png");
  tree3 = loadImage("tree3.png");
  tree4 = loadImage("tree4.png");
  water = loadImage("water1.png");
  grass = loadImage("grass4.png");
  cobble = loadImage("cobble.png");
  cabin = loadImage("cabin.png");
  title.resize(1100, 0);
  start.resize(450, 0);
  load.resize(450, 0);
  tree1.resize(250, 0);
  tree2.resize(250, 0);
  tree3.resize(250, 0);
  tree4.resize(250, 0);
  water.resize(250, 0);
  grass.resize(250, 0);
  cobble.resize(250, 0);
  cabin.resize(250, 0);
  startGame = false;
  loadGame = false;
  
  p = new Player();
  //for(int i = 0; i < z.zomCount ;i++)
    z = new Zombies(random(width), random(height));
  m = new Map();
  
  m.setupMap();
  
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
    m.drawMap();
    p.drawPlayer();
    p.movePlayer();
    z.drawZombie();
    
    blockPathing( p );

    //if(zomTimer >= 22)
    //{
      z.moveZombie();
    //  zomTimer = 0;
    //}
  }
  
  zomTimer++;
  
  println("barrier: "+barrier.size());
}

void blockPathing( Player o )
{
  //look at all blocks
  for( Barrier b: barrier )
  {
    //if object player block
    if( o.xPos+o.size/2 > b.barrierXpos-b.barrierXsize/2
     && o.xPos-o.size/2 < b.barrierXpos+b.barrierXsize/2
     && o.yPos+o.size/2 > b.barrierYpos-b.barrierYsize/2
     && o.yPos-o.size/2 < b.barrierYpos+b.barrierYsize/2 )
    {
      //find nearest side (default to left)
      int side  = 0; //0-left, 1-top, 2-right, 3-bottom
      float dist = dist(o.xPos, o.yPos, b.barrierXpos-b.barrierXsize/2, b.barrierYpos); //distance from last check
      //check top
      if( dist( o.xPos, o.yPos, b.barrierXpos, b.barrierYpos-b.barrierYsize/2 ) < dist )
      {
        dist = dist( o.xPos, o.yPos, b.barrierXpos, b.barrierYpos-b.barrierYsize/2 );
        side = 1;
      }
      //check right
      if( dist( o.xPos, o.yPos, b.barrierXpos+b.barrierXsize/2, b.barrierYpos ) < dist )
      {
        dist = dist( o.xPos, o.yPos, b.barrierXpos+b.barrierXsize/2, b.barrierYpos );
        side = 2;
      }
      //check bottom
      if( dist( o.xPos, o.yPos, b.barrierXpos, b.barrierYpos+b.barrierYsize/2 ) < dist )
      {
        dist = dist( o.xPos, o.yPos, b.barrierXpos, b.barrierYpos+b.barrierYsize/2 );
        side = 3;
      }
      //Set object to that side of block
      if( side == 0 ) o.xPos = b.barrierXpos-b.barrierXsize/2-o.size/2;
      if( side == 1 ) o.yPos = b.barrierYpos-b.barrierYsize/2-o.size/2;
      if( side == 2 ) o.xPos = b.barrierXpos+b.barrierXsize/2+o.size/2;
      if( side == 3 ) o.yPos = b.barrierYpos+b.barrierYsize/2+o.size/2;
      //Only one block activates per call
      //return;
    }
  }
}

void drawButtons()
{  
  image(title, width/2, height/5);
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
