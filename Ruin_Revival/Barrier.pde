class Barrier
{
  float barrierXpos, barrierYpos;
  float barrierXsize, barrierYsize;
  
  public Barrier( float x, float y )
  {
    barrierXpos = x;
    barrierYpos = y;
    barrierXsize = 200;
    barrierYsize = 200;
  }
  
  void drawBarrier()
  {
    fill(255);
    rect( barrierXpos, barrierYpos, barrierXsize, barrierYsize );
  }
}
