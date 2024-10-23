class HotBox
{
  
  float xPos, yPos;  
  boolean isSelected = false;
  
  public HotBox(float x, float y, boolean s)
  {
      xPos = x;
      yPos = y;
      isSelected = s;
  }
  
  void drawHot()
  {
   if(isSelected == false)
   {
     image(unHot, xPos+100, yPos);
   }
   else
   {
     image(hot, xPos+100, yPos);
   }
  }
  
}
