class Weapon
{
  String name;
  PImage image;
  int strength;
  float swing;
  float wepAngle = 0;
  boolean attackOn = false;
  int power = 10;
  float dangerX, dangerY;
  
  public Weapon(String name, String end)
  {
    image = loadImage(name + end);
    image.resize(80, 0);
  }

  public void drawWeapon(float xPos, float yPos)
  {
    push();
    imageMode(CORNER);
    translate(xPos, yPos);
    rotate(swing);
    wepAngle = atan2(mouseY-yPos, mouseX-xPos);
    rotate(wepAngle-HALF_PI);
    image(image, 0, 0);
    pop();
    
    
    
    if ( attackOn )
    {
      swing += 0.25;
      if ( swing >= 2)
        attackOn = false;
    } 
    else if ( swing > 0 )
      swing -= 0.1;
  }
  
  public void drawWeaponHitBox(float xPos, float yPos)
  {
    push();
    fill(0, 50);
    noStroke();
    translate(xPos, yPos);
    rotate(wepAngle+QUARTER_PI+QUARTER_PI);
    arc(0, 0, 200, 200, PI+QUARTER_PI, TWO_PI);
    pop();
  }

  public void attack()
  {
    //rotates/shoots to deal damage to enemies
    attackOn = !attackOn;
  }
  
  void findDangerZone( float dist )
  {
    float direction = atan2(mouseY-p.yPos, mouseX-p.xPos);
    
    
    direction = degrees(direction);
    float xDist = dist*cos(TWO_PI * direction / 360);
    float yDist = dist*sin(TWO_PI * direction / 360);
    
    fill(255,255,0);
    
    dangerX = p.xPos+xDist;
    dangerY = p.yPos+yDist;
  }
  void strikeZoms()
  {
    float dangerAngle = atan2(mouseY-p.yPos, mouseX-p.xPos);
    for( Zombies Z: z )
    {
      float zomAngle = atan2( Z.yPos-p.yPos, Z.xPos-p.xPos );
      if( zomAngle < dangerAngle+QUARTER_PI && zomAngle > dangerAngle-QUARTER_PI && dist(p.xPos,p.yPos,Z.xPos,Z.yPos) < 110)
        Z.hurt = true;
    }
  }


}
