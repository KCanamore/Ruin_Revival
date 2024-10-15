class MiniMap
{
  float gridXpos, gridYpos;
  float miniMapXpos, miniMapYpos;
  
  public MiniMap()
  {
    gridXpos = p.xPos/(250/miniMapScale);
    gridYpos = p.yPos/(250/miniMapScale);
    
    miniMapXpos = 150;
    miniMapYpos = 150;

  }
  
  //void showTileType()
  //{
  //  fill(200,0,0);
  //  text( map[ int((mapXpos+p.xPos)/(250/miniMapScale)) ][ int((mapYpos+p.yPos)/(250/miniMapScale)) ], 200, 200);
  //}
  
  void setupMiniMap()
  {
    miniMapStr += "###############"; // 15x15 map
    miniMapStr += "^             !";
    miniMapStr += "^     @  $$$  !"; // * = cobble
    miniMapStr += "^    ***  $$  !";
    miniMapStr += "^      ***    !"; // # = trees
    miniMapStr += "^        ***  !";
    miniMapStr += "^   $$$   **  !"; // $ = water
    miniMapStr += "^  $$$$$   ** !";
    miniMapStr += "^  $$$$$   ** !"; // space = grass
    miniMapStr += "^  $$$$$  **  !";
    miniMapStr += "^   $$$   **  !"; // @ = cabin
    miniMapStr += "^       ***   !";
    miniMapStr += "^  *******    !";
    miniMapStr += "^             !";
    miniMapStr += "%%%%%%%%%%%%%%%";
    
    //Populates char array with the characters of miniMapStr
    for( int i = 0; i < miniMap.length; i++ )
    {
      for( int j = 0; j < miniMap[0].length; j++ )
      {
        map[j][i] = miniMapStr.charAt(j+i*15);
        if( map[j][i] == '#' )
          barrier.add( new Barrier(j*(250/miniMapScale),i*(250/miniMapScale), 1) );
        if( map[j][i] == '@' )
        {
          barrier.add( new Barrier(j*(250/miniMapScale),i*(250/miniMapScale), 2) );
          B = new Barrier(j*(250/miniMapScale),i*(250/miniMapScale),2);
        }
        if( map[j][i] == '#' || map[j][i] == '!' || map[j][i] == '%' || map[j][i] == '^' )
          barrier.add( new Barrier(j*(250/miniMapScale),i*(250/miniMapScale), 1) );
        if( map[j][i] == '$' )
          barrier.add( new Barrier(j*(250/miniMapScale),i*(250/miniMapScale), 1) );
      }
    }
  }
  
  void drawMiniMap()
  {
    rectMode(CENTER);
    noStroke();
    
    
    //Draws the terrain to make the map
    for( int i = 0; i < map.length; i++ )
      for( int j = 0; j < map[0].length; j++)
      {
        if(map[j][i]=='#')
        {
          image(grass, miniMapXpos+j*(250/miniMapScale),miniMapYpos+i*(250/miniMapScale));
          image(tree1, miniMapXpos+j*(250/miniMapScale),miniMapYpos+i*(250/miniMapScale));
        }
        else if(map[j][i]=='!')
        {
          image(grass, miniMapXpos+j*(250/miniMapScale),miniMapYpos+i*(250/miniMapScale));
          image(tree2, miniMapXpos+j*(250/miniMapScale),miniMapYpos+i*(250/miniMapScale));
        }
        else if(map[j][i]=='%')
        {
          image(grass, miniMapXpos+j*(250/miniMapScale),miniMapYpos+i*(250/miniMapScale));
          image(tree3, miniMapXpos+j*(250/miniMapScale),miniMapYpos+i*(250/miniMapScale));
        }
        else if(map[j][i]=='^')
        {
          image(grass, miniMapXpos+j*(250/miniMapScale),miniMapYpos+i*(250/miniMapScale));
          image(tree4, miniMapXpos+j*(250/miniMapScale),miniMapYpos+i*(250/miniMapScale));
        }
        else if(map[j][i]==' ')
          image(grass, miniMapXpos+j*(250/miniMapScale),miniMapYpos+i*(250/miniMapScale));
        else if(map[j][i]=='$')
          image(water, miniMapXpos+j*(250/miniMapScale),miniMapYpos+i*(250/miniMapScale));
        else if(map[j][i]=='*')
          image(cobble, miniMapXpos+j*(250/miniMapScale),miniMapYpos+i*(250/miniMapScale));
        else if(map[j][i]=='@')
        {
          image(grass, miniMapXpos+j*(250/miniMapScale),miniMapYpos+i*(250/miniMapScale));
          image(cabin, miniMapXpos+j*(250/miniMapScale),miniMapYpos+i*(250/miniMapScale));
        }  
      }
      
  }

  
}
