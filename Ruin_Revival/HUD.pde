class HUD
{

  HotBox [] h = new HotBox[5];
  
  public HUD()
  {
    for(int i = 0; i < h.length; i++)
    {
      h[i] = new HotBox(100*i, 1000, false);
    }
  }
  
  void drawHUD()
  {
    for(int i = 0; i < h.length; i++)
    {
      h[i].drawHot();
    }
  }
}
