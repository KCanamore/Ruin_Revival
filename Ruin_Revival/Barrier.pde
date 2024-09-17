class Barrier
{
  float barrierXpos, barrierYpos;
  float barrierXsize, barrierYsize;
  
  public Barrier( float x, float y )
  {
    barrierXpos = x;
    barrierYpos = y;
    barrierXsize = 250;
    barrierYsize = 250;
  }
  
  void drawBarrier()
  {
    fill(255);
    rect( barrierXpos, barrierYpos, barrierXsize, barrierYsize );
  }
}
