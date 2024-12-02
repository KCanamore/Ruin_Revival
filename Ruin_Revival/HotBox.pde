class HotBox
{

  float xPos, yPos;
  boolean isSelected = false;
  int type;
  int amount;
  
  
  public HotBox(float x, float y, boolean s, int t)
  {
    xPos = x;
    yPos = y;
    isSelected = s;
    type = t;
  }

  void drawHot()
  {
    if (isSelected == false)
    {
      image(unHot, xPos+100, yPos);
    } 
    else
    {
      image(hot, xPos+100, yPos);
    }
    
    if(type == 1 )
    {
      if( amount == 0 )
        tint(50);
      
      image(kelpJ, xPos+100, yPos);
      noTint();
    }
    if(type == 2 )
    {
      if( amount == 0 )
        tint(50);
      
      image(kelpS, xPos+100, yPos);
      noTint();
    }
    if(type == 3 )
    {
      if( amount == 0 )
        tint(50);
      
      image(burbur, xPos+100, yPos);
      noTint();
    }
    if(type == 4 )
    {
      
    }
    if(type == 5 )
    {
      
    }
  }
}
