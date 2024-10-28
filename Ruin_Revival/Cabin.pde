class Cabin
{
  PImage cabinInside;

  public Cabin()
  {
    cabinInside = loadImage("cabin-inside.png");
    cabinInside.resize(height, 0);
  }

  void drawCabinInside()
  {
    image(cabinInside, width/2, height/2);
    if (inCabin)
    {
      //left
      barrier.add( new Barrier(420, (250/mapScale), 1) );
      barrier.add( new Barrier(420, 500, 1) );
      barrier.add( new Barrier(420, 750, 1) );
      barrier.add( new Barrier(420, 1000, 1) );
      barrier.add( new Barrier(420, 1250, 1) );

      //right
      barrier.add( new Barrier(1500, (250/mapScale), 1) );
      barrier.add( new Barrier(1500, 500, 1) );
      barrier.add( new Barrier(1500, 750, 1) );
      barrier.add( new Barrier(1500, 1000, 1) );
      barrier.add( new Barrier(1500, 1250, 1) );

      //top
      barrier.add( new Barrier(525, 135, 1) );
      barrier.add( new Barrier(775, 135, 1) );
      barrier.add( new Barrier(1025, 135, 1) );
      barrier.add( new Barrier(1275, 135, 1) );
      barrier.add( new Barrier(1525, 135, 1) );

      //bottom
      barrier.add( new Barrier(545, height, 1) );
      barrier.add( new Barrier(795, height, 1) );
      barrier.add( new Barrier(width/2, height+75, 1) );
      barrier.add( new Barrier(1130, height, 1) );
      barrier.add( new Barrier(1380, height, 1) );
    }

    //if(outOfCabin)
    //{
    //  //left
    //  barrier.remove( new Barrier(420,(250/mapScale),  1) );
    //  barrier.remove( new Barrier(420,500,  1) );
    //  barrier.remove( new Barrier(420,750,  1) );
    //  barrier.remove( new Barrier(420,1000, 1) );
    //  barrier.remove( new Barrier(420,1250, 1) );

    //  //right
    //  barrier.remove( new Barrier(1500,(250/mapScale), 1) );
    //  barrier.remove( new Barrier(1500,500, 1) );
    //  barrier.remove( new Barrier(1500,750, 1) );
    //  barrier.remove( new Barrier(1500,1000, 1) );
    //  barrier.remove( new Barrier(1500,1250, 1) );

    //  //top
    //  barrier.remove( new Barrier(525,135, 1) );
    //  barrier.remove( new Barrier(775,135, 1) );
    //  barrier.remove( new Barrier(1025,135, 1) );
    //  barrier.remove( new Barrier(1275,135, 1) );
    //  barrier.remove( new Barrier(1525,135, 1) );

    //  //bottom
    //  barrier.remove( new Barrier(545,height, 1) );
    //  barrier.remove( new Barrier(795,height, 1) );
    //  barrier.remove( new Barrier(width/2,height+75, 1) );
    //  barrier.remove( new Barrier(1130,height, 1) );
    //  barrier.remove( new Barrier(1380,height, 1) );
    //}
  }
}
