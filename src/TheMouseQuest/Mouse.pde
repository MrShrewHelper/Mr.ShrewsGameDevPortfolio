class Mouse {
  // Member Variables
  int x, y, health, turretCount;
  PImage m1;

  // Constructor
  Mouse(int x, int y) {
    this.x = x;
    this.y = y;
health = 100;
turretCount = 1;
    m1 = loadImage("Mouse Protaginist.png");
  }

  //Member Methods
  void display() {
    imageMode (CENTER);
    image(m1, x, y);
  }
  void move(int tempX, int tempY) {
    x=tempX;
    y=tempY;
  }


  boolean isHit(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
