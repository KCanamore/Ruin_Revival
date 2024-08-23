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
      xSpd -= 5;
    if(right)
      xSpd += 5;
    if(up)
      ySpd -= 5;
    if(down)
      ySpd += 5;
  }
}
