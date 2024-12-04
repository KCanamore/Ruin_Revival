class HUD
{

  HotBox [] h = new HotBox[5];
  
  float settingsXpos, settingsYpos;
  float unPauseXpos, unPauseYpos;
  float saveXpos, saveYpos;
  float exitXpos, exitYpos;
  float healthXpos, healthYpos;
  int health;
  int scrollCount;

  public HUD()
  {
    for (int i = 0; i < h.length; i++)
      h[i] = new HotBox(100*i, 1000, false, i+1);
    
    settingsXpos = width-75;
    settingsYpos = 75;
    
    unPauseXpos = width/2;
    unPauseYpos = (height/2)-200;
    
    saveXpos = width/2;
    saveYpos = height/2;
    
    exitXpos = width/2;
    exitYpos = (height/2)+200;
    
    healthXpos = width-250;
    healthYpos = height-100;
    
    health = 200;
    
  }

  void drawHUD()
  {
    for (int i = 0; i < h.length; i++)
    {
      h[i].drawHot();
    }
    
    image(settings, settingsXpos, settingsYpos);
  }
  
  void drawSettingsOptions()
  {
    image(resume, unPauseXpos, unPauseYpos);
    image(save, saveXpos, saveYpos);
    image(exit, exitXpos, exitYpos);
  }
  
  void drawHealthBar()
  {
    push();
    fill(255, 0, 0);
    rectMode(CORNER);
    push();
    strokeWeight(5);
    stroke(0);
    noFill();
    rect(healthXpos, healthYpos, 200, 30 );
    pop();
    rect(healthXpos, healthYpos, health, 30 );
    pop();
    if( health > 200 )
      health = 200;
  }
  
  void handleHeals(int t)
  {
    if( t == 1 )
    {
      HUD.health += 10;
    }
    
    if( t == 2 )
    {
      HUD.health += 25;
    }
    
    if( t == 3 )
    {
      HUD.health += 50;
    }
    
    if( t == 4 )
    {
      
    }
    
    if( t == 5 )
    {
      
    }
  }
  void scrollingThroughItems()
  {
    if (scrollCount == 1)
    {
      key = '1';
      keyPressed();
      //h[0].isSelected = true;
      //h[1].isSelected = false;
      //h[2].isSelected = false;
      //h[3].isSelected = false;
      //h[4].isSelected = false;
    }
    if (scrollCount == 2)
    {
      key = '2';
      keyPressed();
      //h[1].isSelected = true;
      //h[0].isSelected = false;
      //h[2].isSelected = false;
      //h[3].isSelected = false;
      //h[4].isSelected = false;
    }
    if (scrollCount == 3)
    {
      key = '3';
      keyPressed();
      //h[2].isSelected = true;
      //h[0].isSelected = false;
      //h[1].isSelected = false;
      //h[3].isSelected = false;
      //h[4].isSelected = false;
    }
    if (scrollCount == 4)
    {
      key = '4';
      keyPressed();
      //h[3].isSelected = true;
      //h[0].isSelected = false;
      //h[1].isSelected = false;
      //h[2].isSelected = false;
      //h[4].isSelected = false;
    }
    if (scrollCount == 5)
    {
      key = '5';
      keyPressed();
      //h[4].isSelected = true;
      //h[0].isSelected = false;
      //h[1].isSelected = false;
      //h[2].isSelected = false;
      //h[3].isSelected = false;
    }
        
    if(scrollCount < 1)
      scrollCount = 1;
    if(scrollCount > 5)
      scrollCount = 5;
  }
}
