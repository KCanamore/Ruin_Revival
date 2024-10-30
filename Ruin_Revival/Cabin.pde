class Cabin
{
  PImage cabinInside;
  
  float cabinXpos, cabinYpos;

  public Cabin()
  {
    cabinInside = loadImage("cabin-inside.png");
    cabinInside.resize(height, 0);
    
    cabinXpos = -width/2;
    cabinYpos = height/2;
    
    //left
    cabinBarrier.add( new Barrier(cabinXpos-420, cabinYpos-(250/mapScale), 1) );
    cabinBarrier.add( new Barrier(cabinXpos-420, cabinYpos-500 , 1) );
    cabinBarrier.add( new Barrier(cabinXpos-420, cabinYpos-750 , 1) );
    cabinBarrier.add( new Barrier(cabinXpos-420, cabinYpos-1000, 1) );
    cabinBarrier.add( new Barrier(cabinXpos-420, cabinYpos-1250, 1) );

    //right
    cabinBarrier.add( new Barrier(cabinXpos+1500, cabinYpos+(250/mapScale), 1) );
    cabinBarrier.add( new Barrier(cabinXpos+1500, cabinYpos+500 , 1) );
    cabinBarrier.add( new Barrier(cabinXpos+1500, cabinYpos+750 , 1) );
    cabinBarrier.add( new Barrier(cabinXpos+1500, cabinYpos+1000, 1) );
    cabinBarrier.add( new Barrier(cabinXpos+1500, cabinYpos+1250, 1) );

    //top
    cabinBarrier.add( new Barrier(cabinXpos-525 , cabinYpos-135, 1) );
    cabinBarrier.add( new Barrier(cabinXpos-775 , cabinYpos-135, 1) );
    cabinBarrier.add( new Barrier(cabinXpos-1025, cabinYpos-135, 1) );
    cabinBarrier.add( new Barrier(cabinXpos-1275, cabinYpos-135, 1) );
    cabinBarrier.add( new Barrier(cabinXpos-1525, cabinYpos-135, 1) );

    //bottom
    cabinBarrier.add( new Barrier(cabinXpos+545 , cabinYpos+height, 1) );
    cabinBarrier.add( new Barrier(cabinXpos+795 , cabinYpos+height, 1) );
    cabinBarrier.add( new Barrier(cabinXpos+width/2, cabinYpos+height+75, 1) );
    cabinBarrier.add( new Barrier(cabinXpos+1130, cabinYpos+height, 1) );
    cabinBarrier.add( new Barrier(cabinXpos+1380, cabinYpos+height, 1) );

  }

  void drawCabinInside()
  {
    image(cabinInside, cabinXpos, cabinYpos);
    if (inCabin)
    {
      p.xPos = width/2;
      p.yPos = height/2;
      m.mapXpos += cabinXpos-p.xPos;
      m.mapYpos += cabinYpos-p.yPos;
    }
  }
}
