// David Madden | 16 Sept 2026 | Mouse's Adventures
import processing.sound.*;
SoundFile magica1, MSC1, MouseSqueak, explode;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Magic> magics = new ArrayList<Magic>();
ArrayList<Powerup> powUps = new ArrayList<Powerup>();
Mouse mouse01;
Boss b1;
Timer rDist, puDist, bossFreq;
int score, rockCount, magicSpeed, level;

void setup() {
  //rocks.add(new Rock(int(random(width)), -60));
  //powUps.add(new Powerup(int(random(width)), -60));
  mouse01 = new Mouse(mouseX/2, 850);
  magica1 = new SoundFile(this, "magica1.mp3");
  MSC1 = new SoundFile(this, "MSC1.mp3");
  MouseSqueak = new SoundFile(this, "MouseSound.mp3");
  explode = new SoundFile(this, "Explode.mp3");
  size(800, 1000);
  rDist = new Timer(1000);
  rDist.start();
  puDist = new Timer(5000);
  puDist.start();
  bossFreq = new Timer(30000);
  bossFreq.start();
  score =0;
  rockCount =0;
  magicSpeed = 4;
  level =1;
  frameRate(30);
}

void draw() {
  noCursor();
  background(20);
  //add rocks
  if (rDist.isFinished() ==true) {
    //spawn new Rock
    rocks.add(new Rock(int(random(width)), -60));
    rockCount++;
    //Reset timer
    rDist.start();
  }
  //add powerups
  if (puDist.isFinished()==true) {
    powUps.add(new Powerup(int(random(width)), -60));
    puDist.start();
  }

  mouse01.move(mouseX, 850);
  mouse01.display();
  for (Powerup p : powUps) {
    p.move();
    p.display();
  }
  // Magic attack displaying
  for (int i = 0; i < magics.size(); i++) {
    println("Magic:"+magics.size());
    Magic l = magics.get(i);
    for (int j = 0; j < rocks.size(); j++) {
      Rock r = rocks.get(j);
      if (r.isHit(l)) {
        //increment score
        magica1.play();
        score= score+100;
        //remove rock and magic attack
        magics.remove(l);
        rocks.remove(r);
      }
    }
    l.move();
    l.display();

    if (l.isOffScreen()==true) {
      magics.remove(l);
    }
  }
  for (int i = 0; i < rocks.size(); i++) {
    println("Rocks:"+rocks.size());
    Rock r = rocks.get(i);
    r.move();
    r.display();
    if (mouse01.isHit(r)) {
      rocks.remove(r);
      score += 100;
    }
    if (mouse01.isHit(r)==true) {
      mouse01.health = mouse01.health-50;
    }
    if (mouse01.health <=0) {
      textSize(100);
      textMode(CENTER);
      text("GameOver", width/2, height/2);
      explode.play();
      noLoop();
    }
  }
  //powerups
  for (int i = 0; i < powUps.size(); i++) {
    println("PowerUp:" +powUps.size());
    Powerup pu = powUps.get(i);
    pu.move();
    pu.display();
    if (pu.isHit(mouse01)) {
      //increase hp of mouse
      if (pu.type == 'h') {
        mouse01.health += 100;
        powUps.remove(pu);
        MouseSqueak.play();
        MouseSqueak.amp(5.0);
      } else if (pu.type == 's') {
        magicSpeed = magicSpeed + 1;
        powUps.remove(pu);
      } else if(pu.type == 't') {
      mouse01.turretCount += 1;
      powUps.remove(pu);
      }
    }
    if (pu.isOffScreen()==true) {
      powUps.remove(pu);
    }
  }
  infoPanel();
}

void mousePressed() {
  if(mouse01.turretCount == 1) {
  magics.add(new Magic(mouse01.x, mouse01.y, magicSpeed));
  MSC1.play();
} else if (mouse01. turretCount == 2) {
  magics.add(new Magic(mouse01.x-50, mouse01.y, magicSpeed));
    magics.add(new Magic(mouse01.x+50, mouse01.y, magicSpeed));
} else if (mouse01. turretCount == 3) {
  magics.add(new Magic(mouse01.x-50, mouse01.y, magicSpeed));
    magics.add(new Magic(mouse01.x+50, mouse01.y, magicSpeed));
     magics.add(new Magic(mouse01.x, mouse01.y, magicSpeed));
} else if (mouse01. turretCount == 4) {
  magics.add(new Magic(mouse01.x-50, mouse01.y, magicSpeed));
    magics.add(new Magic(mouse01.x+50, mouse01.y, magicSpeed));
     magics.add(new Magic(mouse01.x-70, mouse01.y, magicSpeed));
     magics.add(new Magic(mouse01.x+70, mouse01.y, magicSpeed));
} else if (mouse01. turretCount == 5) {
  magics.add(new Magic(mouse01.x+50, mouse01.y, magicSpeed));
    magics.add(new Magic(mouse01.x-50, mouse01.y, magicSpeed));
     magics.add(new Magic(mouse01.x, mouse01.y, magicSpeed));
     magics.add(new Magic(mouse01.x-140, mouse01.y, magicSpeed));
     magics.add(new Magic(mouse01.x+140, mouse01.y, magicSpeed));
} else if (mouse01. turretCount == 6) {
  magics.add(new Magic(mouse01.x-150, mouse01.y, magicSpeed));
    magics.add(new Magic(mouse01.x+150, mouse01.y, magicSpeed));
     magics.add(new Magic(mouse01.x, mouse01.y, magicSpeed));
     magics.add(new Magic(mouse01.x+200, mouse01.y, magicSpeed));
     magics.add(new Magic(mouse01.x-200, mouse01.y, magicSpeed));
     magics.add(new Magic(mouse01.x+250, mouse01.y, magicSpeed));
     magics.add(new Magic(mouse01.x-250, mouse01.y, magicSpeed));
     magics.add(new Magic(mouse01.x+400, mouse01.y, magicSpeed));
}
}
//add infoPanel()
void infoPanel() {
  fill(127, 127);
  rectMode(CORNER);
  rect(0, 0, width, 40);
  fill(225);
  textSize(35);
  textAlign(CORNER, CORNER);
  text("Score:" + score, 20, 35);
  text("MouseTrap Count:" + rockCount, 180, 35);
  text("Health:" + mouse01.health, 500, 35);
}
