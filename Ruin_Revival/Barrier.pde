class Barrier
{
  float barrierXpos, barrierYpos;
  float barrierXsize, barrierYsize;
  
  public Barrier()
  {
    barrierXpos = random(width);
    barrierYpos = random(height);
    barrierXsize = 200;
    barrierYsize = 200;
  }
  
  void drawBarrier()
  {
    fill(255);
    rect( barrierXpos, barrierYpos, barrierXsize, barrierYsize );
  }
  void blockPathing( Object o )
  {
    //look at all blocks
    for( Barrier b: barrier )
    {
      //if object inside block
      if( o.barrierXpos+o.size/2 > b.barrierXpos-b.barrierXsize/2
       && o.barrierXpos-o.size/2 < b.barrierXpos+b.barrierXsize/2
       && o.barrierYpos+o.size/2 > b.barrierYpos-b.barrierYsize/2
       && o.barrierYpos-o.size/2 < b.barrierYpos+b.barrierYsize/2 )
      {
        //find nearest side (default to left)
        int side  = 0; //0-left, 1-top, 2-right, 3-bottom
        float dist = dist(o.barrierXpos, o.barrierYpos, b.barrierXpos-b.barrierXsize/2, b.barrierYpos); //distance from last check
        //check top
        if( dist( o.barrierXpos, o.barrierYpos, b.barrierXpos, b.barrierYpos-b.barrierYsize/2 ) < dist )
        {
          dist = dist( o.barrierXpos, o.barrierYpos, b.barrierXpos, b.barrierYpos-b.barrierYsize/2 );
          side = 1;
        }
        //check right
        if( dist( o.barrierXpos, o.barrierYpos, b.barrierXpos+b.barrierXsize/2, b.barrierYpos ) < dist )
        {
          dist = dist( o.barrierXpos, o.barrierYpos, b.barrierXpos+b.barrierXsize/2, b.barrierYpos );
          side = 2;
        }
        //check bottom
        if( dist( o.barrierXpos, o.barrierYpos, b.barrierXpos, b.barrierYpos+b.barrierYsize/2 ) < dist )
        {
          dist = dist( o.barrierXpos, o.barrierYpos, b.barrierXpos, b.barrierYpos+b.barrierYsize/2 );
          side = 3;
        }
        //Set object to that side of block
        if( side == 0 ) o.barrierXpos = b.barrierXpos-b.barrierXsize/2-o.size/2;
        if( side == 1 ) o.barrierYpos = b.barrierYpos-b.barrierYsize/2-o.size/2;
        if( side == 2 ) o.barrierXpos = b.barrierXpos+b.barrierXsize/2+o.size/2;
        if( side == 3 ) o.barrierYpos = b.barrierYpos+b.barrierYsize/2+o.size/2;
        //Only one block activates per call
        //return;
      }
    }
  }
}
