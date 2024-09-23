class Cabin
{
  PImage cabinInside;
  
  public Cabin()
  {
    cabinInside = loadImage("cabin-inside.png");
    
  }
  
  void drawCabinInside()
  {
    image(cabinInside, width/2, height/2);
  }
  
}
