class Powerup {
  //Member Variables
  int x, y, size, speed;
  char  type;
  boolean isHit;
  PImage pu1, pu2, pu3;
  // Constructor
  Powerup(int x, int y) {
    this.x=x;
    this.y=y;

    size = int(random(20, 100));
    speed = int(random(1, 10));
    if (random(3)>2.0) {
      type = 'h';
      //pu1 = loadImage("TheCheese.png");
    } else if (random(2)>1.0) {
      type = 't';
      //pu2 = loadImage("Tablet.png");
    } else {
      type = 's';
      //pu3 = loadImage("TheCheese.png");
    }
    isHit=false;
  }

  //Member Methods
  void display() {
    ellipse(x,y,size,size);
    //imageMode(CENTER);
    //image(pu1, x, y);
    //image(pu2, x, y);
    //image(pu3,x,y);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(20);
    fill(0);
    text(type, x, y);
    
  }

  void move() {
    y= y+speed;
  }
  boolean isOffScreen() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }

  //add isHit()
  boolean isHit(Mouse m) {
    float d = dist(x, y, m.x, m.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
