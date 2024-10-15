class PickUp
{

  float xPos, yPos;
  String name;
  boolean isPickedUp = false;
<<<<<<< HEAD
  //Item item = new Item();
=======
  int type;
  Item item = new Item(type);
>>>>>>> f7aef864c7cb1929c67a05f9ad7199de74bc9deb
  
  public PickUp(float x, float y, String n, Item i, int t)
  {
    
    xPos = x;
    yPos = y;
    name = n;
<<<<<<< HEAD
    //item = i;
=======
    item = i;
    type = t;
>>>>>>> f7aef864c7cb1929c67a05f9ad7199de74bc9deb
    
  }
  
  void drawPickUp()
  {
    fill(255);
    circle(xPos, yPos, 50);
  }
  
}
