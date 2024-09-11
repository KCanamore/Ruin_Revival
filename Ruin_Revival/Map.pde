class Map
{
  
  float gridXpos, gridYpos;
  float mapXpos, mapYpos;
  float barrierXpos, barrierYpos;
  
  public Map()
  {
    gridXpos = p.xPos/250;
    gridYpos = p.yPos/250;
    
    mapXpos = 0;
    mapYpos = 0;

    barrierXpos = 0;
    barrierYpos = 0;
  }
  
  //void showTileType()
  //{
  //  fill(200,0,0);
  //  text( map[ int((mapXpos+p.xPos)/250) ][ int((mapYpos+p.yPos)/250) ], 200, 200);
  //}
  
  public float top()     { return barrierYpos; }
  public float bottom()  { return barrierYpos+275; }
  public float left()    { return barrierXpos; }
  public float right()   { return barrierXpos+275; }

}
