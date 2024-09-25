class Map
{
  
  float gridXpos, gridYpos;
  float mapXpos, mapYpos;
  
  public Map()
  {
    gridXpos = p.xPos/250;
    gridYpos = p.yPos/250;
    
    mapXpos = 0;
    mapYpos = 0;

  }
  
  //void showTileType()
  //{
  //  fill(200,0,0);
  //  text( map[ int((mapXpos+p.xPos)/250) ][ int((mapYpos+p.yPos)/250) ], 200, 200);
  //}
  
  void setupMap()
  {
    mapStr += "###############"; //15x15 map
    mapStr += "^             !";
    mapStr += "^     @  $$$  !"; // * = cobble
    mapStr += "^    ***  $$  !";
    mapStr += "^      ***    !"; // # = trees
    mapStr += "^        ***  !";
    mapStr += "^   $$$   **  !"; // $ = water
    mapStr += "^  $$$$$   ** !";
    mapStr += "^  $$$$$   ** !"; // space = grass
    mapStr += "^  $$$$$  **  !";
    mapStr += "^   $$$   **  !"; // @ = cabin
    mapStr += "^       ***   !";
    mapStr += "^  *******    !";
    mapStr += "^             !";
    mapStr += "%%%%%%%%%%%%%%%";
    
    //Populates char array with the characters of mapStr
    for( int i = 0; i < map.length; i++ )
    {
      for( int j = 0; j < map[0].length; j++ )
      {
        map[j][i] = mapStr.charAt(j+i*15);
        if( map[j][i] == '#' || map[j][i] == '!' || map[j][i] == '%' || map[j][i] == '^' )
          barrier.add( new Barrier(j*250,i*250) );
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
        {
          image(grass, m.mapXpos+j*250,m.mapYpos+i*250);
          image(tree1, m.mapXpos+j*250,m.mapYpos+i*250);
        }
        else if(map[j][i]=='!')
        {
          image(grass, m.mapXpos+j*250,m.mapYpos+i*250);
          image(tree2, m.mapXpos+j*250,m.mapYpos+i*250);
        }
        else if(map[j][i]=='%')
        {
          image(grass, m.mapXpos+j*250,m.mapYpos+i*250);
          image(tree3, m.mapXpos+j*250,m.mapYpos+i*250);
        }
        else if(map[j][i]=='^')
        {
          image(grass, m.mapXpos+j*250,m.mapYpos+i*250);
          image(tree4, m.mapXpos+j*250,m.mapYpos+i*250);
        }
        else if(map[j][i]==' ')
          image(grass, m.mapXpos+j*250,m.mapYpos+i*250);
        else if(map[j][i]=='$')
          image(water, m.mapXpos+j*250,m.mapYpos+i*250);
        else if(map[j][i]=='*')
          image(cobble, m.mapXpos+j*250,m.mapYpos+i*250);
        else if(map[j][i]=='@')
        {
          image(grass, m.mapXpos+j*250,m.mapYpos+i*250);
          image(cabin, m.mapXpos+j*250,m.mapYpos+i*250);
        }  
      }
      
  }

  
}
