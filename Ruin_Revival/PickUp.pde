class PickUp
{

  float xPos, yPos;
  boolean isPickedUp = false;
  Item item;
  
  public PickUp(float x, float y, Item i)
  {
    
    xPos = x;
    yPos = y;
    item = i;
    
  }
  
  void drawPickUp()
  {
    fill(255);
    circle(xPos, yPos, 100);
  }
  
}
