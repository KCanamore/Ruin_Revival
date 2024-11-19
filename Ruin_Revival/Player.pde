class Player
{
  float xPos, yPos;
  float xSpd, ySpd;
  int size;
  int health;
  boolean left, right, up, down;
  
  boolean invun;
  int invunTime;

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
    
    if(invun)
      fill(50);
    
    circle(xPos, yPos, size);
  }

  void movePlayer()
  {
    xPos += xSpd;
    yPos += ySpd;

    //BOUNCE

    xSpd *= 0.80;
    ySpd *= 0.80;

    if (left)
      xSpd -= 2;
    if (right)
      xSpd += 2;
    if (up)
      ySpd -= 2;
    if (down)
      ySpd += 2;

    if (!inCabin && xPos > width-(250/mapScale))
    {
      xPos = width-(250/mapScale);
      m.mapXpos -= xSpd;
      for (int i = 0; i < pUp.length; i++)
        pUp[i].xPos -= xSpd;
      for (int i = 0; i < z.size(); i++)
        z.get(i).xPos -= xSpd;
      for (Barrier b : barrier )
        b.barrierXpos -= xSpd;
      B.barrierXpos -= xSpd;
    }
    if (!inCabin && xPos <= (250/mapScale))
    {
      xPos = (250/mapScale);
      m.mapXpos -= xSpd;
      for (int i = 0; i < pUp.length; i++)
        pUp[i].xPos -= xSpd;
      for (int i = 0; i < z.size(); i++)
        z.get(i).xPos -= xSpd;
      for (Barrier b : barrier )
        b.barrierXpos -= xSpd;
      B.barrierXpos -= xSpd;
    }
    if (!inCabin && yPos >= height-(250/mapScale))
    {
      yPos = height-(250/mapScale);
      m.mapYpos -= ySpd;
      for (int i = 0; i < pUp.length; i++)
        pUp[i].yPos -= ySpd;
      for (int i = 0; i < z.size(); i++)
        z.get(i).yPos -= ySpd;
      for (Barrier b : barrier )
        b.barrierYpos -= ySpd;
      B.barrierYpos -= ySpd;
    }
    if (!inCabin && yPos <= (250/mapScale))
    {
      yPos = (250/mapScale);
      m.mapYpos -= ySpd;
      for (int i = 0; i < pUp.length; i++)
        pUp[i].yPos -= ySpd;
      for (int i = 0; i < z.size(); i++)
        z.get(i).yPos -= ySpd;
      for (Barrier b : barrier )
        b.barrierYpos -= ySpd;
      B.barrierYpos -= ySpd;
    }
    
    for (int i = 0; i < z.size(); i++)
      if( dist(xPos, yPos, z.get(i).xPos, z.get(i).yPos)< 25 && invun == false)
      {
        invun = true;
        invunTime = 50;
        
        HUD.health -= 5;
      }
      
   if(kelpShakeUsed)
     HUD.health += 5;
      
   if(invunTime == 0)
     invun = false;
   
   if(invunTime > 0)
     invunTime--;
  }
}
