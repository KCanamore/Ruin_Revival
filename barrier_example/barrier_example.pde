ArrayList<Blocker> blocks = new ArrayList<Blocker>();
Object testObj = new Object();

//testing
boolean u,d,l,r;

void setup()
{
  size( 900,900 );
  rectMode(CENTER);
  
  blocks.add( new Blocker() );
  blocks.add( new Blocker() );
  blocks.add( new Blocker() );
  blocks.add( new Blocker() );
  blocks.add( new Blocker() );
  blocks.add( new Blocker() );
  blocks.add( new Blocker() );
}

void draw()
{
  background( 127 );
  
  for( Blocker b: blocks )
    b.drawBlock();
  testObj.drawObj();
  testObj.moveObj();
  
  blockPathing( testObj );
}


void blockPathing( Object o )
{
  //look at all blocks
  for( Blocker b: blocks )
  {
    //if object inside block
    if( o.xPos+o.size/2 > b.xPos-b.xSize/2
     && o.xPos-o.size/2 < b.xPos+b.xSize/2
     && o.yPos+o.size/2 > b.yPos-b.ySize/2
     && o.yPos-o.size/2 < b.yPos+b.ySize/2 )
    {
      //find nearest side (default to left)
      int side  = 0; //0-left, 1-top, 2-right, 3-bottom
      float dist = dist(o.xPos, o.yPos, b.xPos-b.xSize/2, b.yPos); //distance from last check
      //check top
      if( dist( o.xPos, o.yPos, b.xPos, b.yPos-b.ySize/2 ) < dist )
      {
        dist = dist( o.xPos, o.yPos, b.xPos, b.yPos-b.ySize/2 );
        side = 1;
      }
      //check right
      if( dist( o.xPos, o.yPos, b.xPos+b.xSize/2, b.yPos ) < dist )
      {
        dist = dist( o.xPos, o.yPos, b.xPos+b.xSize/2, b.yPos );
        side = 2;
      }
      //check bottom
      if( dist( o.xPos, o.yPos, b.xPos, b.yPos+b.ySize/2 ) < dist )
      {
        dist = dist( o.xPos, o.yPos, b.xPos, b.yPos+b.ySize/2 );
        side = 3;
      }
      //Set object to that side of block
      if( side == 0 ) o.xPos = b.xPos-b.xSize/2-o.size/2;
      if( side == 1 ) o.yPos = b.yPos-b.ySize/2-o.size/2;
      if( side == 2 ) o.xPos = b.xPos+b.xSize/2+o.size/2;
      if( side == 3 ) o.yPos = b.yPos+b.ySize/2+o.size/2;
      //Only one block activates per call
      //return;
    }
  }
}

class Object
{
  float xPos = 50, yPos = 50;
  float xSpd, ySpd;
  float size = 50;
  
  void drawObj()
  {
    fill(0);
    circle(xPos,yPos,size);
  }
  
  void moveObj()
  {
    xSpd *= 0.95;
    ySpd *= 0.95;
    
    if(u)
      ySpd-=0.5;
    if(l)
      xSpd-=0.5;
    if(d)
      ySpd+=0.5;
    if(r)
      xSpd+=0.5;
      
    xPos+=xSpd;
    yPos+=ySpd;
  }
}

class Blocker
{
  float xPos, yPos;
  float xSize, ySize;
  
  public Blocker()
  {
    xPos = random(width);
    yPos = random(height);
    xSize = 200;
    ySize = 200;
  }
  
  void drawBlock()
  {
    fill(255);
    rect( xPos, yPos, xSize, ySize );
  }
}

void keyPressed()
{
  if( key == 'w' )
    u = true;
  if( key == 'a' )
    l = true;
  if( key == 's' )
    d = true;
  if( key == 'd' )
    r = true;
}

void keyReleased()
{
  if( key == 'w' )
    u = false;
  if( key == 'a' )
    l = false;
  if( key == 's' )
    d = false;
  if( key == 'd' )
    r = false;
}
