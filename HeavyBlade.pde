import fisica.*;
PImage map;
PImage s1, s2, s3, sm, tm, ui, gameclear;
Sword sword;
FWorld world;
float density = 1;
float resistance = 0;
ArrayList<Monster> Monsters = new ArrayList<Monster>();
int monsterDeadCount = 0;
int monsterDeadMax = 4;
int gameMode;
int preCountAlive;

void setup() {
  map = loadImage("Map.png");
  s1 = loadImage("s1.png");
  s2 = loadImage("s2.png");
  s3 = loadImage("s3.png");
  sm = loadImage("StoneMan.png");
  tm = loadImage("TreeMan.png");
  ui = loadImage("ui.png");
  gameclear = loadImage("GameClear.png");
  size(1200, 900);
  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
  world.setGravity(0, 0);
  gameMode = 1;

  sword = new Sword(width/2, height/2, 1);

  for (int i = 0; i < 3; i++) {
    Monsters.add(new Monster((int)random(1, 3), sword));
  }

  preCountAlive = 0;
}

void draw() {
  image(map, 0, 0);

  if (gameMode == 1) {
    world.step();
    sword.display();

    int countAlive = 0;
    for (Monster monster : Monsters) {
      if (monster.isAlive) {
        monster.display();
        countAlive ++;
      }
    }

    if (countAlive < preCountAlive) {
      monsterDeadCount++;
      if(monsterDeadCount <= monsterDeadMax - 3)Monsters.add(new Monster((int)random(1, 3), sword));
    }
    
    println(monsterDeadCount);
    if (monsterDeadCount >= monsterDeadMax)gameMode = 2;
    
    preCountAlive = countAlive;

    image(ui, 30, 10);
  }

  if (gameMode == 2) {
    image(gameclear, width/2 - gameclear.width/2, height/2 - gameclear.height/2);
  }
  
  
}

void mousePressed() {
  if (gameMode ==1) {
    if (mouseX > sword.box.getX()-30 && mouseX < sword.box.getX()+30 && mouseY > sword.box.getY()-30 && mouseY < sword.box.getY()+30) {
      sword.pressed = true;
    }
  }
}

void mouseReleased() {
  if (gameMode ==1)sword.pressed = false;
}

void keyPressed() {
  if (key=='1') sword = new Sword(width/2, height/2, 1);
  if (key=='2') sword = new Sword(width/2, height/2, 2);
  if (key=='3') sword = new Sword(width/2, height/2, 3);
  if (key == '0')gameMode = 2;
  if (key==' ') {
    gameMode = 1;
    monsterDeadCount = 0;
    sword = new Sword(width/2, height/2, 1);
    Monsters.clear();
    while (Monsters.size() < 3) {
      Monsters.add(new Monster((int)random(1, 3), sword));
    }
  }
}
