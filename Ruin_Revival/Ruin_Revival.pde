//Xavier, Kanon, Casey
//zombie apocolyps game

PImage start, load;

void setup()
{
  
  fullScreen();
  
  rectMode(CENTER);
  imageMode(CENTER);

  start = loadImage("start_button.png");
  load = loadImage("load_button.png");
  start.resize(450, 0);
  load.resize(450, 0);

}

void draw()
{
  
  background(0);
  
  drawButtons();
  
}

void drawButtons()
{
 
  textSize(150);
  text("Ruin Revival", width/3.25, height/4);
  
  image(start, width/2, height/2);
  image(load, width/2, height/1.25);
  
}
