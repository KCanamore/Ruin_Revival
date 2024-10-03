class Zombies
{

  float xPos, yPos;
  float xSpd, ySpd;
  int size;
  int zomCount;
  boolean left, right, up, down;

  public Zombies(float x, float y)
  {
    xPos = x;
    yPos = y;

    size = 50;

    zomCount = 2;

    xSpd = 0;
    ySpd = 0;
  }

  void drawZombie()
  {
    fill(#FA0505);
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
