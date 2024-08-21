//Xavier, Kanon, Casey
//zombie apocolyps game

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

}

void draw()
{
  background(0);
  
  drawButtons();
  if(startGame || loadGame)
    background(0);
    
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
  if( mouseX >= width/2-225 && mouseX <= width/2+225 && mouseY >= height/2-(225/2) && mouseY <= height/2+(225/2) )
    startGame = true;
  
  //load game
  if( mouseX >= width/2-225 && mouseX <= width/2+225 && mouseY >= height/1.25-(225/2) && mouseY <= height/1.25+(225/2) )
    loadGame = true;

}
