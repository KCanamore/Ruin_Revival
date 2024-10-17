class Weapon
{
  String name;
  PImage image;
  int strength;
  float swing;
  float wepAngle = 0;
  boolean attackOn = false;
  int power = 10;
  
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

  public void attack()
  {
    //rotates/shoots to deal damage to enemies
    attackOn = !attackOn;
  }
}
