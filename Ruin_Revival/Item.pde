class Item
{

  int type;
  PImage image;

  public Item(int t, String name, String end)
  {
    type = t;
    image = loadImage(name + end);
    image.resize(80, 0);
  }

  void drawItem(int x, int y)
  {
    image(image, x, y);
  }
    
}
