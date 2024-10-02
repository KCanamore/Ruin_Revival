class Barrier
{
  float barrierXpos, barrierYpos;
  float barrierXsize, barrierYsize;
  int type;
  
  public Barrier( float x, float y, int t )
  {
    barrierXpos = x;
    barrierYpos = y;
    barrierXsize = 250;
    barrierYsize = 250;
    type = t;
    println( "A " + type + " barrier was created!");
  }
  
  void drawBarrier()
  {
    fill(0);
    rect( barrierXpos, barrierYpos, barrierXsize, barrierYsize );
    fill(255);
    text( "X: " + barrierXpos + "\nY: " + barrierYpos, barrierXpos, barrierYpos );
    text( type, barrierXpos, barrierYpos+ 50 );
  }
}
