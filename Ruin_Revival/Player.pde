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
    fill(255);
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
      
    if(xPos > width-250)
    {
      xPos = width-250;
      m.mapXpos -= xSpd;
      for(Barrier b: barrier )
        b.barrierXpos -= xSpd;
    }
    if(xPos <= 250)
    {
      xPos = 250;
      m.mapXpos -= xSpd;
      for(Barrier b: barrier )
        b.barrierXpos -= xSpd;
    }
    if(yPos >= height-250)
    {
      yPos = height-250;
      m.mapYpos -= ySpd;
      
      for(Barrier b: barrier )
        b.barrierYpos -= ySpd;
    }
    if(yPos <= 250)
    {
      yPos = 250;
      m.mapYpos -= ySpd;
      
      for(Barrier b: barrier )
        b.barrierYpos -= ySpd;
    }
    
    //if(yPos <= m.bottom())
    //  ySpd = -ySpd;
    //if(yPos >= m.top())
    //  ySpd = -ySpd;
    //if(xPos <= m.right())
    //  xSpd = -xSpd;
    //if(xPos >= m.left())
    //  xSpd = -xSpd;
  }
  
}
