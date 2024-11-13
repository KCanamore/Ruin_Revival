class HUD
{

  HotBox [] h = new HotBox[5];
  
  float settingsXpos, settingsYpos;
  float unPauseXpos, unPauseYpos;
  float saveXpos, saveYpos;
  float exitXpos, exitYpos;

  public HUD()
  {
    for (int i = 0; i < h.length; i++)
    {
      h[i] = new HotBox(100*i, 1000, false, i+1);
    }
    
    settingsXpos = width-75;
    settingsYpos = 75;
    
    unPauseXpos = width/2;
    unPauseYpos = (height/2)-200;
    
    saveXpos = width/2;
    saveYpos = height/2;
    
    exitXpos = width/2;
    exitYpos = (height/2)+200;
    
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
}
