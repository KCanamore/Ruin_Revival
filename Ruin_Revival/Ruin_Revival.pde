//Xavier, Kanon, Casey
//zombie apocolyps game

Player p;

PImage start, load;

boolean startGame, loadGame;

void setup()
{
  
  fullScreen();
  
  
  rectMode(CENTER);
  imageMode(CENTER);

  start = loadImage("start_button.png");
  load = loadImage("load_button.png");
  start.resize(450, 0);
  load.resize(450, 0);
  startGame = false;
  loadGame = false;
  
  p = new Player();

}

void draw()
{
  background(0);
  
  drawButtons();
  if(startGame || loadGame)
  {
    background(0);
    noCursor();
    p.drawPlayer();
    p.movePlayer();
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
