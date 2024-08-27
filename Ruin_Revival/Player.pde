class Player
{
  float xPos, yPos;
  float xSpd, ySpd;
  int size;
  boolean left, right, up, down;
  
  public Player()
  {
    xPos = width/2;
    yPos = height/2;
    
    size = 50;
    
    xSpd = 0;
    ySpd = 0;
    
  }
  
  void drawPlayer()
  {
    circle(xPos, yPos, size);
  }
  
  void movePlayer()
  {
    xPos += xSpd;
    yPos += ySpd;
    
    //BOUNCE
    
    xSpd *= 0.80;
    ySpd *= 0.80;
    
    if(left)
      xSpd -= 2;
    if(right)
      xSpd += 2;
    if(up)
      ySpd -= 2;
    if(down)
      ySpd += 2;
      
    if(xPos > width-size/2)
    {
      xPos = width-size/2;
      m.mapXpos -= xSpd;
    }
    if(xPos <= size/2)
    {
      xPos = size/2;
      m.mapXpos -= xSpd;
    }
    if(yPos >= height-size/2)
    {
      yPos = height-size/2;
      m.mapYpos -= ySpd;
    }
    if(yPos <= size/2)
    {
      yPos = size/2;
      m.mapYpos -= ySpd;
    }
  }
}
