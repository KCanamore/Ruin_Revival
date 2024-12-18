class Barrier
{
  float barrierXpos, barrierYpos;
  float barrierXsize, barrierYsize;
  int type;

  public Barrier( float x, float y, int t )
  {
    barrierXpos = x;
    barrierYpos = y;
    barrierXsize = (250/mapScale);
    barrierYsize = (250/mapScale);
    type = t;
    //println( "A " + type + " barrier was created!");
  }

  void drawBarrier()
  {
    fill(255);
    rect( barrierXpos, barrierYpos, barrierXsize, barrierYsize );
    fill(0);
    text( "X: " + barrierXpos + "\nY: " + barrierYpos, barrierXpos, barrierYpos );
    text( type, barrierXpos, barrierYpos+ 50 );
  }
  
}
