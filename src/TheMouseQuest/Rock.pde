class Rock {
  //Member Variables
  int x, y, size, health, damage, xp, currency, speed;
  boolean isHit;
  PImage j1;
  // Constructor
  Rock(int x, int y) {
    this.x=x;
    this.y=y;
    size = int(random(10, 100));
    speed = int(random(1, 10));
    health = 100;
    isHit=false;
    j1 = loadImage("MouseTrap (1).png");
  }

  //Member Methods
  void display() {
    image(j1, x, y);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(30);
    text(health, x, y);
  }

  void move() {
    y=y+speed;
  }
  boolean isOffScreen() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
  boolean isHit(Magic l) {
   float d = dist(x, y, l.x, l.y);
    if (d<50) {
      return true;
    } else {
      return false;
 }
 }
}
