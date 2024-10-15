class PickUp
{

  float xPos, yPos;
  String name;
  boolean isPickedUp = false;
  int type;
  Item item = new Item(type);
  
  public PickUp(float x, float y, String n, Item i, int t)
  {
    
    xPos = x;
    yPos = y;
    name = n;
    item = i;
    type = t;

    
  }
  
  void drawPickUp()
  {
    fill(255);
    circle(xPos, yPos, 50);
  }
  
}
