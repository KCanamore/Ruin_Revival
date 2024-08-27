//Xavier, Kanon, Casey
//zombie apocolyps game

Player p;

PImage start, load, tree, water, grass;

boolean startGame, loadGame;

int mapxSize = 15;
int mapySize = 15;

//map data
char [][] map = new char[mapxSize][mapySize];
String mapStr = "";

void setup()
{
  
  fullScreen();
  
  
  rectMode(CENTER);
  imageMode(CENTER);

  start = loadImage("start_button.png");
  load = loadImage("load_button.png");
  tree = loadImage("tree1.png");
  water = loadImage("water1.png");
  grass = loadImage("grass1.png");
  start.resize(450, 0);
  load.resize(450, 0);
  tree.resize(250, 0);
  water.resize(250, 0);
  grass.resize(250, 0);
  startGame = false;
  loadGame = false;
  
  p = new Player();
  setupMap();
  
}

void draw()
{
  background(0);
  
  drawButtons();
  if(startGame || loadGame)
  {
    background(0);
    noCursor();
    drawMap();
    p.drawPlayer();
    p.movePlayer();
  }
}

void setupMap()
{
  mapStr += "###############";
  mapStr += "#             #"; // * - save point
  mapStr += "#             #";
  mapStr += "#             #"; // # - trees
  mapStr += "#             #";
  mapStr += "#             #"; // $ - water
  mapStr += "#    $$       #";
  mapStr += "#   $$$$      #"; //   - grass
  mapStr += "#  $$$$$$     #";
  mapStr += "#   $$$$      #";
  mapStr += "#    $$       #";
  mapStr += "#             #";
  mapStr += "#             #";
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
  
  //Draws the terrain to make the map
  for( int i = 0; i < map.length; i++ )
    for( int j = 0; j < map[0].length; j++)
    {
      if(map[j][i]=='#')
        image(tree, 475+j*275,35+i*275);
      else if(map[j][i]==' ')
        image(grass, 475+j*250,35+i*250);
      else if(map[j][i]=='$')
        image(water, 475+j*250,35+i*250);
      else if(map[j][i]=='*')
        image(tree, 475+j*275,35+i*275);
    }
}


void drawButtons()
{
 
  textSize(150);
  text("Ruin Revival", width/3.25, height/4);
  
  image(start, width/2, height/2);
  image(load, width/2, height/1.25);
  
}

void mouseClicked()
{
  //start game
  if( mouseX >= width/2-225 && mouseX <= width/2+225 && mouseY >= height/2-(450/2) && mouseY <= height/2+(450/2) )
    startGame = true;
  
  //load game
  if( mouseX >= width/2-225 && mouseX <= width/2+225 && mouseY >= height/1.25-(225/2) && mouseY <= height/1.25+(225/2) )
    loadGame = true;
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
