class Zombies
{

  public float xPos, yPos;
  float xSpd, ySpd;
  int size;
  int zomCount;
  int health;
  boolean left, right, up, down, hurt;

  public Zombies(float x, float y)
  {
    xPos = x;
    yPos = y;

    size = 50;

    zomCount = 2;

    xSpd = 0;
    ySpd = 0;
    health = 15;
  }

  void drawZombie()
  {
    //fill(#FA0505);
    if( hurt )
      fill(255,0,0);
    else
      fill(0);
      
    circle(xPos, yPos, size);
    
  }

  void moveZombie()
  {
    xPos += xSpd;
    yPos += ySpd;

    //BOUNCE

    xSpd *= 0.80;
    ySpd *= 0.80;

    if (inCabin == false && dist(p.xPos, p.yPos, xPos, yPos)< height/2 && dist(p.xPos, p.yPos, xPos, yPos)< width/2)
    {
      if (p.xPos < xPos)
      {
        left = true;
        right = false;
      }

      if (p.xPos > xPos)
      {
        right = true;
        left = false;
      }

      if (p.yPos < yPos)
      {
        up = true;
        down = false;
      }

      if (p.yPos > yPos)
      {
        down = true;
        up = false;
      }
    } else
    {
      up = false;
      down = false;
      left = false;
      right = false;
    }

    if (left)
      xSpd -= 0.5;
    if (right)
      xSpd += 0.5;
    if (up)
      ySpd -= 0.5;
    if (down)
      ySpd += 0.5;
  }
}
