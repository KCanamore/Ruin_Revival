class Weapon
{
  String name;
  PImage image;
  int strength;
  float swingLength, swing;
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
    
  }

  public void Attack()
  {
    //rotates/shoots to deal damage to enemies
    attackOn = !attackOn;
  }
}
