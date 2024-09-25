class Cabin
{
  PImage cabinInside;
  
  public Cabin()
  {
    cabinInside = loadImage("cabin-inside.png");
    cabinInside.resize(1000, 0);
    
  }
  
  void drawCabinInside()
  {
    image(cabinInside, width/2, height/2);
  }
  
}
