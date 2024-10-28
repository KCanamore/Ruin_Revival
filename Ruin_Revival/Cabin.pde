class Cabin
{
  PImage cabinInside;

  public Cabin()
  {
    cabinInside = loadImage("cabin-inside.png");
    cabinInside.resize(height, 0);
    
    if (inCabin)
    {
      //p.xPos = width/2;
      //p.yPos = height/2;
      //left
      cabinBarrier.add( new Barrier(420, (250/mapScale), 1) );
      cabinBarrier.add( new Barrier(420, 500, 1) );
      cabinBarrier.add( new Barrier(420, 750, 1) );
      cabinBarrier.add( new Barrier(420, 1000, 1) );
      cabinBarrier.add( new Barrier(420, 1250, 1) );

      //right
      cabinBarrier.add( new Barrier(1500, (250/mapScale), 1) );
      cabinBarrier.add( new Barrier(1500, 500, 1) );
      cabinBarrier.add( new Barrier(1500, 750, 1) );
      cabinBarrier.add( new Barrier(1500, 1000, 1) );
      cabinBarrier.add( new Barrier(1500, 1250, 1) );

      //top
      cabinBarrier.add( new Barrier(525, 135, 1) );
      cabinBarrier.add( new Barrier(775, 135, 1) );
      cabinBarrier.add( new Barrier(1025, 135, 1) );
      cabinBarrier.add( new Barrier(1275, 135, 1) );
      cabinBarrier.add( new Barrier(1525, 135, 1) );

      //bottom
      cabinBarrier.add( new Barrier(545, height, 1) );
      cabinBarrier.add( new Barrier(795, height, 1) );
      cabinBarrier.add( new Barrier(width/2, height+75, 1) );
      cabinBarrier.add( new Barrier(1130, height, 1) );
      cabinBarrier.add( new Barrier(1380, height, 1) );
    }
    if (outOfCabin)
      for (int i = 0; i < cabinBarrier.size(); i++)
        cabinBarrier.remove(i);

  }

  void drawCabinInside()
  {
    image(cabinInside, width/2, height/2);
  }
}
