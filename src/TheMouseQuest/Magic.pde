class Magic {
  //member Variable
  int x, y, w, h, speed;
  PImage b1;

  Magic(int x, int y, int speed) {
    this.x=x;
    this.y=y;
    w=10;
    h=30;
    this.speed = speed;
    b1 = loadImage("TheRealAttack.png");
  }

  void display() {
      imageMode (CENTER);
    image(b1, x, y);
   
  }
  void move() {
    y= y-speed;
  }

  boolean isOffScreen() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }
}
