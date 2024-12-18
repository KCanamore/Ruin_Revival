//Xavier, Kanon, Casey
//zombie apocalypse game

//kelp shake as heals
//diet dr kelp as heart
//kelp soda play diet dr kelp sound

import processing.sound.*;

Player p = new Player();
ArrayList<Zombies> z = new ArrayList<Zombies>();
Map m;
Cabin c;
Barrier B;
Weapon w;
PickUp pUp [] = new PickUp [3];
HUD HUD;
Boss b;

PImage title, start, load, tree1, tree2, tree3, tree4, water, grass, cobble, cabin, crossHair, unHot, hot, kelpJ, kelpS, settings, resume, save, exit, burbur, player, sign, w_katana, hulaBurger;

boolean startGame, loadGame;

int mapxSize = 15;
int mapySize = 15;
int score;
int mapScale = 1;
int dangerSize = 90;
int spawnTimer;
int zombieCount = 10;
int level;

boolean inCabin = false;
boolean outOfCabin = false;
boolean pause = false;
boolean kelpShakeUsed = false;

int zomTimer = 0;

//sound stuff
//SoundFile backMusic;
boolean musicOn = false;

//map data
ArrayList<Barrier> barrier = new ArrayList<Barrier>();
ArrayList<Barrier> cabinBarrier = new ArrayList<Barrier>();
char [][] map = new char[mapxSize][mapySize];
String mapStr = "";
String miniMapStr = "";


void setup()
{

  w = new Weapon("katana", ".png");

  fullScreen();
  noSmooth();

  //backMusic = new SoundFile(this, "music.mp3");

  rectMode(CENTER);
  imageMode(CENTER);

  player = loadImage("player.png");
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
  sign = loadImage("sign.png");
  crossHair = loadImage("cross-hair.png");
  unHot = loadImage("hotbar-panel.png");
  hot = loadImage("hotbar-panel-selected.png");
  kelpJ = loadImage("Kelp_Juice.png");
  kelpS = loadImage("Kelp_Shake.png");
  burbur = loadImage("burbur.png");
  settings = loadImage("gear.png");
  resume = loadImage("resume_button.png");
  save = loadImage("save_button.png");
  exit = loadImage("exit_button.png");
  w_katana = loadImage("waifu_katana.png");
  hulaBurger = loadImage("waifu_katana.png");
  player.resize(50, 0);
  title.resize(1100, 0);
  start.resize(450, 0);
  load.resize(450, 0);
  tree1.resize((250/mapScale), 0);
  tree2.resize((250/mapScale), 0);
  tree3.resize((250/mapScale), 0);
  tree4.resize((250/mapScale), 0);
  water.resize((250/mapScale), 0);
  grass.resize((250/mapScale), 0);
  cobble.resize((250/mapScale), 0);
  cabin.resize((250/mapScale), 0);
  sign.resize(60, 0);
  crossHair.resize(50, 0);
  unHot.resize(100, 0);
  hot.resize(100, 0);
  kelpJ.resize(90, 0);
  kelpS.resize(90, 0);
  burbur.resize(90, 0);
  settings.resize(100, 0);
  resume.resize(350, 0);
  save.resize(350, 0);
  exit.resize(350, 0);
  w_katana.resize(80, 0);
  hulaBurger.resize(90, 0);
  startGame = false;
  loadGame = false;
  
  p = new Player();
  m = new Map();
  c = new Cabin();
  HUD = new HUD();
  b = new Boss(random(width), random(height));

  m.setupMap();
}

void draw()
{
  //music
  //if (musicOn == true)
  //{
  //  backMusic.play();
  //  musicOn = false;
  //}

  background(0);
  drawButtons();

  if (startGame || loadGame)
  {
    background(0);
    w.findDangerZone(50);
    noCursor();

    if (inCabin)
      c.drawCabinInside();
    else
      m.drawMap();

    if (!pause)
      p.movePlayer();

    w.drawWeapon(p.xPos, p.yPos);
    w.drawWeaponHitBox(p.xPos, p.yPos);
    //B.drawBarrier();
    for (int i = 0; i < z.size(); i++)
    {
      z.get(i).drawZombie();
      if (!pause)
        z.get(i).moveZombie();
      if(z.get(i).yPos < 0 || z.get(i).yPos > height || z.get(i).xPos < 0 || z.get(i).xPos > width)
        z.remove(i);
    }
    if(millis() > spawnTimer && z.size() == 0)
    {
      spawnZombies();
      zombieCount += 11;
      level++;
    }
    if(level == 1 || level == 5 || level == 10)
    {
      if(b.alive)
      {
        b.drawBoss();
        b.moveBoss();
      }
      b.alive = true;
    }
    p.drawPlayer();
    HUD.drawHUD();
    HUD.score();
    HUD.drawHealthBar();
    HUD.scrollingThroughItems();
    blockPathing( p );
    blockPathingZom( z );
    
    if(b.health <= 0)
    {
      b.alive = false;
      w.power = 25;
    }
    
    for (int i = 0; i < pUp.length; i++)
    {
      if ( dist(p.xPos, p.yPos, pUp[i].xPos, pUp[i].yPos) < 65 && pUp[i].isPickedUp == false)
      {
        textSize(25);
        fill(255);
        text("Press F to pick up", pUp[i].xPos, pUp[i].yPos - 50);
      }  
    }

    if (pause)
      HUD.drawSettingsOptions();

    if (HUD.health <= 0)
      exit();

    image(crossHair, mouseX, mouseY);
  }

  zomTimer++;
  //println("spawnTimer: " + spawnTimer);
  textSize(50);
  text("zombie count: " + zombieCount, 50, 100);
  text("level: " + level, 50, 150);
  text("zombie size: " + z.size(), 50, 200);
  if(z.size() > 0)
  {
    text("last zom xPos: " + z.get(0).xPos, 50, 250);
    text("last zom yPos: " + z.get(0).yPos, 50, 300);
  }
}

void blockPathing( Player o )
{
  //look at all blocks
  for ( Barrier b : barrier )
  {
    //if object player block
    if ( o.xPos+o.size/2 > b.barrierXpos-b.barrierXsize/2
      && o.xPos-o.size/2 < b.barrierXpos+b.barrierXsize/2
      && o.yPos+o.size/2 > b.barrierYpos-b.barrierYsize/2
      && o.yPos-o.size/2 < b.barrierYpos+b.barrierYsize/2 )
    {
      //find nearest side (default to left)
      int side  = 0; //0-left, 1-top, 2-right, 3-bottom
      float dist = dist(o.xPos, o.yPos, b.barrierXpos-b.barrierXsize/2, b.barrierYpos); //distance from last check
      //check top
      if ( dist( o.xPos, o.yPos, b.barrierXpos, b.barrierYpos-b.barrierYsize/2 ) < dist )
      {
        dist = dist( o.xPos, o.yPos, b.barrierXpos, b.barrierYpos-b.barrierYsize/2 );
        side = 1;
      }
      //check right
      if ( dist( o.xPos, o.yPos, b.barrierXpos+b.barrierXsize/2, b.barrierYpos ) < dist )
      {
        dist = dist( o.xPos, o.yPos, b.barrierXpos+b.barrierXsize/2, b.barrierYpos );
        side = 2;
      }
      //check bottom
      if ( dist( o.xPos, o.yPos, b.barrierXpos, b.barrierYpos+b.barrierYsize/2 ) < dist )
      {
        dist = dist( o.xPos, o.yPos, b.barrierXpos, b.barrierYpos+b.barrierYsize/2 );
        side = 3;
      }
      //Set object to that side of block
      if ( side == 0 ) o.xPos = b.barrierXpos-b.barrierXsize/2-o.size/2;
      if ( side == 1 ) o.yPos = b.barrierYpos-b.barrierYsize/2-o.size/2;
      if ( side == 2 ) o.xPos = b.barrierXpos+b.barrierXsize/2+o.size/2;
      if ( side == 3 ) o.yPos = b.barrierYpos+b.barrierYsize/2+o.size/2;
      //Only one block activates per call
      //return;
    }
  }
}

void blockPathingZom( ArrayList<Zombies> Z )
{
  ArrayList<Zombies> zom = Z;
  //look at all blocks
  for (int i = 0; i < z.size(); i++)
  {
    for ( Barrier b : barrier )
    {
      //if object zombie block
      if ( zom.get(i).xPos+zom.get(i).size/2 > b.barrierXpos-b.barrierXsize/2
        && zom.get(i).xPos-zom.get(i).size/2 < b.barrierXpos+b.barrierXsize/2
        && zom.get(i).yPos+zom.get(i).size/2 > b.barrierYpos-b.barrierYsize/2
        && zom.get(i).yPos-zom.get(i).size/2 < b.barrierYpos+b.barrierYsize/2 )
      {
        //find nearest side (default to left)
        int side  = 0; //0-left, 1-top, 2-right, 3-bottom
        float dist = dist(zom.get(i).xPos, zom.get(i).yPos, b.barrierXpos-b.barrierXsize/2, b.barrierYpos); //distance from last check
        //check top
        if ( dist( zom.get(i).xPos, zom.get(i).yPos, b.barrierXpos, b.barrierYpos-b.barrierYsize/2 ) < dist )
        {
          dist = dist( zom.get(i).xPos, zom.get(i).yPos, b.barrierXpos, b.barrierYpos-b.barrierYsize/2 );
          side = 1;
        }
        //check right
        if ( dist( zom.get(i).xPos, zom.get(i).yPos, b.barrierXpos+b.barrierXsize/2, b.barrierYpos ) < dist )
        {
          dist = dist( zom.get(i).xPos, zom.get(i).yPos, b.barrierXpos+b.barrierXsize/2, b.barrierYpos );
          side = 2;
        }
        //check bottom
        if ( dist( zom.get(i).xPos, zom.get(i).yPos, b.barrierXpos, b.barrierYpos+b.barrierYsize/2 ) < dist )
        {
          dist = dist( zom.get(i).xPos, zom.get(i).yPos, b.barrierXpos, b.barrierYpos+b.barrierYsize/2 );
          side = 3;
        }
        //Set object to that side of block
        if ( side == 0 ) zom.get(i).xPos = b.barrierXpos-b.barrierXsize/2-zom.get(i).size/2;
        if ( side == 1 ) zom.get(i).yPos = b.barrierYpos-b.barrierYsize/2-zom.get(i).size/2;
        if ( side == 2 ) zom.get(i).xPos = b.barrierXpos+b.barrierXsize/2+zom.get(i).size/2;
        if ( side == 3 ) zom.get(i).yPos = b.barrierYpos+b.barrierYsize/2+zom.get(i).size/2;
        //Only one block activates per call
        //return;
      }
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
    pw.println( score );

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

void mousePressed()
{
  //start game
  if ( mouseX >= width/2-225 && mouseX <= width/2+225 && mouseY >= height/2-(450/2) && mouseY <= height/2+(450/2) && !startGame || !loadGame)
  {
    startGame = true;
    musicOn = true;
  }

  //load game
  if ( mouseX >= width/2-225 && mouseX <= width/2+225 && mouseY >= height/1.25-(225/2) && mouseY <= height/1.25+(225/2) && !startGame || !loadGame)
  {
    loadGame = true;
    loadGame();
    musicOn = true;
  }

  //open the settings menu
  if ( dist(mouseX, mouseY, HUD.settingsXpos, HUD.settingsYpos ) < 100)
    pause = true;
  //save the game through this button
  if (dist(mouseX, mouseY, HUD.saveXpos, HUD.saveYpos ) < 100 && pause)
    saveGame();
  //resume the game with this button
  if (dist(mouseX, mouseY, HUD.unPauseXpos, HUD.unPauseYpos ) < 100 && pause)
    pause = false;
  //this button is for exiting the game

  if ( startGame == true || loadGame == true )
  {
    if (dist(mouseX, mouseY, HUD.exitXpos, HUD.exitYpos ) < 100 && pause)
      exit();
  }

    
  for (int i = 0; i < pUp.length; i++)
  {
    if (mouseButton == RIGHT &&  HUD.h[i].isSelected == true &&HUD.h[pUp[i].item].amount > 0)
    {
      HUD.handleHeals(i+1);
      HUD.h[pUp[i].item].amount--;
    }
    else
      kelpShakeUsed = false;
  }
  if (mouseButton == LEFT)
  {
    w.strikeZoms();
    w.attack();
    for (int i = 0; i < z.size(); i++)
      if ( dist( z.get(i).xPos, z.get(i).yPos, w.dangerX, w.dangerY ) < dangerSize )
      {
        z.get(i).hurt = true;
        z.get(i).health -= w.power;
        if (z.get(i).health <= 0)
          z.remove(i);
          
        score += 50;
      }
    if ( dist( b.xPos, b.yPos, w.dangerX, w.dangerY ) < dangerSize )
    {
        b.health -= w.power;
    }
  }
}

void keyPressed()
{
  if (key == 'a' || key == 'A' || keyCode == LEFT)
    p.left = true;
  if (key == 'd' || key == 'D' || keyCode == RIGHT)
    p.right = true;
  if (key == 'w' || key == 'W' || keyCode == UP)
    p.up = true;
  if (key == 's' || key == 'S' || keyCode == DOWN)
    p.down = true;

  if (key == '1')
  {
    HUD.h[0].isSelected = true;
    HUD.h[1].isSelected = false;
    HUD.h[2].isSelected = false;
    HUD.h[3].isSelected = false;
    HUD.h[4].isSelected = false;
    HUD.scrollCount = 1;
  }
  if (key == '2')
  {
    HUD.h[1].isSelected = true;
    HUD.h[0].isSelected = false;
    HUD.h[2].isSelected = false;
    HUD.h[3].isSelected = false;
    HUD.h[4].isSelected = false;
    HUD.scrollCount = 2;
  }
  if (key == '3')
  {
    HUD.h[2].isSelected = true;
    HUD.h[0].isSelected = false;
    HUD.h[1].isSelected = false;
    HUD.h[3].isSelected = false;
    HUD.h[4].isSelected = false;
    HUD.scrollCount = 3;
  }
  if (key == '4')
  {
    HUD.h[3].isSelected = true;
    HUD.h[0].isSelected = false;
    HUD.h[1].isSelected = false;
    HUD.h[2].isSelected = false;
    HUD.h[4].isSelected = false;
    HUD.scrollCount = 4;
  }
  if (key == '5')
  {
    HUD.h[4].isSelected = true;
    HUD.h[0].isSelected = false;
    HUD.h[1].isSelected = false;
    HUD.h[2].isSelected = false;
    HUD.h[3].isSelected = false;
    HUD.scrollCount = 5;
  }

  if (key == 'e' || key == 'E' && dist(B.barrierXpos, B.barrierYpos, p.xPos, p.yPos) <= 250)
  {
    inCabin = true;
    outOfCabin = false;
  } else if ( inCabin == true && p.yPos > 965 && key == 'e' || key == 'E')
  {
    inCabin = false;
    outOfCabin = true;
  }

  for (int i = 0; i < pUp.length; i++)
  {
    if ( dist(p.xPos, p.yPos, pUp[i].xPos, pUp[i].yPos) < 65 && ( key == 'f'  || key == 'F' ) )
    {
      pUp[i].isPickedUp = true;
      HUD.h[pUp[i].item].amount++;
    }
  }
  
}
void spawnZombies()
{
    for (int i = 0; i < zombieCount-1; i++)
    {
      z.add( new Zombies( random(width), random(height) ) );
    }
  spawnTimer = millis() + 10000;
}

void keyReleased()
{
  if (key == 'a' || key == 'A' || keyCode ==LEFT)
    p.left = false;
  if (key == 'd' || key == 'D' || keyCode == RIGHT)
    p.right = false;
  if (key == 'w' || key == 'W'|| keyCode == UP)
    p.up = false;
  if (key == 's' || key == 'S' || keyCode == DOWN)
    p.down = false;
  if (key == 'e' || key == 'E')
    c.checkDoorInteraction();
}

void mouseWheel(MouseEvent event)
{
  float e = event.getCount();
  HUD.scrollCount += e;
}
