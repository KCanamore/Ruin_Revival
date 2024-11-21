class Map
{

  float gridXpos, gridYpos;
  float mapXpos, mapYpos;

  public Map()
  {
    gridXpos = p.xPos/(250/mapScale);
    gridYpos = p.yPos/(250/mapScale);

    mapXpos = 0;
    mapYpos = 0;
  }

  //void showTileType()
  //{
  //  fill(200,0,0);
  //  text( map[ int((mapXpos+p.xPos)/(250/mapScale)) ][ int((mapYpos+p.yPos)/(250/mapScale)) ], 200, 200);
  //}

  void setupMap()
  {
    mapStr += "###############"; //15x15 map
    mapStr += "^             !";
    mapStr += "^     @  $$$  !"; // * = cobble
    mapStr += "^    ***  $$  !";
    mapStr += "^      /<>    !"; // #/%/!/^ = trees
    mapStr += "^        ***  !";
    mapStr += "^   $$$   **  !"; // $ = water
    mapStr += "^  $$$$$   ** !";
    mapStr += "^  $$$$$   ** !"; // space = grass
    mapStr += "^  $$$$$  **  !";
    mapStr += "^   $$$   **  !"; // @ = cabin
    mapStr += "^       ***   !";
    mapStr += "^  *******    !"; // < = test PickUp // REMOVE!!!
    mapStr += "^             !";
    mapStr += "%%%%%%%%%%%%%%%";

    //Populates char array with the characters of mapStr
    for ( int i = 0; i < map.length; i++ )
    {
      for ( int j = 0; j < map[0].length; j++ )
      {
        map[j][i] = mapStr.charAt(j+i*15);
        if ( map[j][i] == '#' )
          barrier.add( new Barrier(j*(250/mapScale), i*(250/mapScale), 1) );
        if ( map[j][i] == '@' )
        {
          barrier.add( new Barrier(j*(250/mapScale), i*(250/mapScale), 2) );
          B = new Barrier(j*(250/mapScale), i*(250/mapScale), 2);
        }
        if ( map[j][i] == '#' || map[j][i] == '!' || map[j][i] == '%' || map[j][i] == '^' )
          barrier.add( new Barrier(j*(250/mapScale), i*(250/mapScale), 1) );
        if ( map[j][i] == '$' )
          barrier.add( new Barrier(j*(250/mapScale), i*(250/mapScale), 1) );
        if( map[j][i] == '<' )
          pUp [0]= new PickUp(m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale), 0);
          //pUp = new PickUp(m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale), new Item(1, "Kelp_Shake", ".png"));
        if( map[j][i] == '>' )
          pUp [1]= new PickUp(m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale), 1);
        if( map[j][i] == '/' )
          pUp [2]= new PickUp(m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale), 2);
    }
    }
  }

  void drawMap()
  {
    rectMode(CENTER);
    noStroke();

    //Draws the terrain to make the map
    for ( int i = 0; i < map.length; i++ )
      for ( int j = 0; j < map[0].length; j++)
      {
        if (map[j][i]=='#')
        {
          image(grass, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
          image(tree1, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
        } else if (map[j][i]=='!')
        {
          image(grass, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
          image(tree2, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
        } else if (map[j][i]=='%')
        {
          image(grass, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
          image(tree3, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
        } else if (map[j][i]=='^')
        {
          image(grass, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
          image(tree4, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
        } else if (map[j][i]==' ')
          image(grass, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
        else if (map[j][i]=='$')
          image(water, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
        else if (map[j][i]=='*')
          image(cobble, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
        else if (map[j][i]=='@')
        {
          image(grass, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
          image(cabin, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
        } 
        else if (map[j][i]=='<')
        {
          image(cobble, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
          pUp[0].drawPickUp();
        }
        else if (map[j][i]=='>')
        {
          image(cobble, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
          pUp[1].drawPickUp();
        }
        else if (map[j][i]=='/')
        {
          image(cobble, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
          pUp[2].drawPickUp();
        }
        else if (map[j][i]=='@')
        {
          image(grass, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
          image(cabin, m.mapXpos+j*(250/mapScale), m.mapYpos+i*(250/mapScale));
          c.drawCabinDoor((m.mapXpos+j*(250/mapScale))-35, (m.mapYpos+i*(250/mapScale))+115);
        }
      }
  }
}
