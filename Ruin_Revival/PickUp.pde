class PickUp
{

  float xPos, yPos;
  String name;
  boolean isPickedUp = false;
  //Item item = new Item();
  
  public PickUp(float x, float y, String n, Item i)
  {
    
    xPos = x;
    yPos = y;
    name = n;
    //item = i;
    
  }
  
  void drawPickUp()
  {
    fill(255);
    circle(xPos, yPos, 50);
  }
  
}
