class Zombies
{

  float xPos, yPos;
  float xSpd, ySpd;
  int size;
  boolean left, right, up, down;

  public Zombies()
  {
    xPos = width/2;
    yPos = height/2;

    size = 50;

    xSpd = 0;
    ySpd = 0;
  }

  void drawZombie()
  {
    fill(#124D00);
    circle(xPos, yPos, size);
  }

  void moveZombie()
  {
    xPos += xSpd;
    yPos += ySpd;

    //BOUNCE

    xSpd *= 0.80;
    ySpd *= 0.80;

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

    if (left)
      xSpd -= 1;
    if (right)
      xSpd += 1;
    if (up)
      ySpd -= 1;
    if (down)
      ySpd += 1;
  }
}
