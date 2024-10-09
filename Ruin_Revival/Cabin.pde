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
      if(inCabin)
      {
        //left
        barrier.add( new Barrier(320,250, 1) );
        barrier.add( new Barrier(320,500, 1) );
        barrier.add( new Barrier(320,750, 1) );
        barrier.add( new Barrier(320,1000, 1) );
        barrier.add( new Barrier(320,1250, 1) );
        
        //right
        barrier.add( new Barrier(1600,250, 1) );
        barrier.add( new Barrier(1600,500, 1) );
        barrier.add( new Barrier(1600,750, 1) );
        barrier.add( new Barrier(1600,1000, 1) );
        barrier.add( new Barrier(1600,1250, 1) );

        //top
        barrier.add( new Barrier(525,135, 1) );
        barrier.add( new Barrier(775,135, 1) );
        barrier.add( new Barrier(1025,135, 1) );
        barrier.add( new Barrier(1275,135, 1) );
        barrier.add( new Barrier(1525,135, 1) );
        
        ////bottom
        //barrier.add( new Barrier(525,250, 1) );
        //barrier.add( new Barrier(775,500, 1) );
        //barrier.add( new Barrier(1025,750, 1) );
        //barrier.add( new Barrier(1275,1000, 1) );
      }
  }
  
}
