class Boss {
  int x, y, w, h, speed, health, lvl;
  PImage boss1;

    Boss(int x, int y, int lvl) {
    this.x =x;
    this.y=y;
    this.lvl =lvl;
    w=200;
    h = 200;
    speed=3;
    health=10000;
    if (lvl == 1) {
      boss1 = loadImage("boss01.png");
    } else if (lvl == 2) {
      boss1 = loadImage("boss01.png");
    } else if (lvl == 3) {
      boss1 = loadImage("boss01.png");
    }
  }

  void display() {
    fill(255, 3, 3);
    ellipse(x, y, w, h);
  }
  void move() {
    x=x+speed;
  }
}
