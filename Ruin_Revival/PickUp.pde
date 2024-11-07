class PickUp
{

  float xPos, yPos;
  boolean isPickedUp = false;
  //Item item;
  int item;

  public PickUp(float x, float y, int i)
  {

    xPos = x;
    yPos = y;
    item = i;
  }

  void drawPickUp()
  {
    if(!isPickedUp)
    {
      fill(255);
      circle(xPos, yPos, 100);
    }
  }
}
