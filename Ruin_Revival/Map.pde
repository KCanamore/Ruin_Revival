class Map
{
  
  public Map()
  {
    
  }
  
  void setupMap()
  {
    mapStr += "###############";
    mapStr += "#            *#"; // * - save point
    mapStr += "#  $          #";
    mapStr += "#  ###        #"; // # - trees
    mapStr += "#$ #$#       $#";
    mapStr += "#$ # #        #"; // $ - water
    mapStr += "#             #";
    mapStr += "#  $$$$       #"; //   - grass
    mapStr += "# $$$$$$      #";
    mapStr += "# $$$$$$$     #";
    mapStr += "#  $$$$$      #";
    mapStr += "#             #";
    mapStr += "#             #";
    mapStr += "#             #";
    mapStr += "###############";
    
    //Populates char array with the characters of mapStr
    for( int i = 0; i < map.length; i++ )
    {
      for( int j = 0; j < map[0].length; j++ )
      {
        map[j][i] = mapStr.charAt(j+i*15);
      }
    }
  }
  
  void drawMap()
  {
    rectMode(CENTER);
    noStroke();
    
    //Draws the terrain to make the map
    for( int i = 0; i < map.length; i++ )
      for( int j = 0; j < map[0].length; j++)
      {
        if(map[j][i]=='#')
          image(tree, 35+j*70,35+i*70);
        else if(map[j][i]==' ')
          image(grass, 35+j*70,35+i*70);
        else if(map[j][i]=='$')
          image(water, 35+j*70,35+i*70);
        else if(map[j][i]=='*')
          image(tree, 35+j*70,35+i*70);
      }
  }

}
