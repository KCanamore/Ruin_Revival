class Map
{
  
  float gridXpos, gridYpos;
  float mapXpos, mapYpos;
  
  public Map()
  {
    gridXpos = p.xPos/250;
    gridYpos = p.yPos/250;
    
    mapXpos = 110;
    mapYpos = 125;
  }
  
  void showTileType()
  {
    fill(200,0,0);
    text( map[ int((mapXpos+p.xPos)/250) ][ int((mapYpos+p.yPos)/250) ], 200, 200);
  }
  
}
