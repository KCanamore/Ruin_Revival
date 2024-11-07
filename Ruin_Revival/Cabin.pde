class Cabin
{
  PImage cabinInside;
  
  float cabinXpos, cabinYpos, doorX, doorY, doorWidth, doorHeight;

  public Cabin()
  {
    cabinInside = loadImage("cabin-inside.png");
    cabinInside.resize(height, 0);
    
    cabinXpos = width/2;
    cabinYpos = height/2;
    
    doorX = width/2;
    doorY = height/2;
    
    doorWidth = 30;
    doorHeight = 50;
    
    ////left
    //cabinBarrier.add( new Barrier(cabinXpos-420, cabinYpos-(250/mapScale), 1) );
    //cabinBarrier.add( new Barrier(cabinXpos-420, cabinYpos-500 , 1) );
    //cabinBarrier.add( new Barrier(cabinXpos-420, cabinYpos-750 , 1) );
    //cabinBarrier.add( new Barrier(cabinXpos-420, cabinYpos-1000, 1) );
    //cabinBarrier.add( new Barrier(cabinXpos-420, cabinYpos-1250, 1) );

    ////right
    //cabinBarrier.add( new Barrier(cabinXpos+1500, cabinYpos+(250/mapScale), 1) );
    //cabinBarrier.add( new Barrier(cabinXpos+1500, cabinYpos+500 , 1) );
    //cabinBarrier.add( new Barrier(cabinXpos+1500, cabinYpos+750 , 1) );
    //cabinBarrier.add( new Barrier(cabinXpos+1500, cabinYpos+1000, 1) );
    //cabinBarrier.add( new Barrier(cabinXpos+1500, cabinYpos+1250, 1) );

    ////top
    //cabinBarrier.add( new Barrier(cabinXpos-525 , cabinYpos-135, 1) );
    //cabinBarrier.add( new Barrier(cabinXpos-775 , cabinYpos-135, 1) );
    //cabinBarrier.add( new Barrier(cabinXpos-1025, cabinYpos-135, 1) );
    //cabinBarrier.add( new Barrier(cabinXpos-1275, cabinYpos-135, 1) );
    //cabinBarrier.add( new Barrier(cabinXpos-1525, cabinYpos-135, 1) );

    ////bottom
    //cabinBarrier.add( new Barrier(cabinXpos+545 , cabinYpos+height, 1) );
    //cabinBarrier.add( new Barrier(cabinXpos+795 , cabinYpos+height, 1) );
    //cabinBarrier.add( new Barrier(cabinXpos+width/2, cabinYpos+height+75, 1) );
    //cabinBarrier.add( new Barrier(cabinXpos+1130, cabinYpos+height, 1) );
    //cabinBarrier.add( new Barrier(cabinXpos+1380, cabinYpos+height, 1) );

  }

  void drawCabinInside()
  {
    image(cabinInside, cabinXpos, cabinYpos);
  }
  void drawCabinDoor(float x, float y)
  {
    doorX = x;
    doorY = y;
    rect(doorX, doorY, doorWidth, doorHeight);
  }
  void checkDoorInteraction()
  {
    if (!inCabin) 
    {
      // Check if player is near the door to enter the cabin
      if (dist(p.xPos, p.yPos, doorX + doorWidth / 2, doorY + doorHeight / 2) < 100 ) 
      {
        inCabin = true;
        p.xPos = width / 2;
        p.yPos = height - 60;  // Place player near the exit door inside
      }
    } 
    else
    {
      // Inside the cabin, check if player is near the exit door
      float exitDoorX = width / 2 - 10;
      float exitDoorY = height - 40;
  
      if (dist(p.xPos, p.yPos, exitDoorX + doorWidth / 2, exitDoorY + doorHeight / 2) < 100 )
      {
        inCabin = false;
        p.xPos = doorX + doorWidth / 2;
        p.yPos = doorY + doorHeight;  // Place player just outside the cabin door
      }
    }   

  }
}
