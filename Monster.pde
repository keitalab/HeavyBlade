class Monster{
  int type;
  FBox box;
  PImage img;
  int w;
  int h;
  Sword sword;
  int timer;
  boolean isAlive;
  
  
  Monster(int _type, Sword _sword){
    type = _type;
    sword = _sword;
    timer = 0;
    isAlive = true;
    FBox myBox;
    
    switch(type){
      case 1:
        h = 60;
        w = 64;
        myBox = new FBox(w, h);
        myBox.setPosition((int)random(200, 1000), (int)random(200, 760));
        myBox.setRotatable(false);
        myBox.setDensity(5);
        myBox.setRestitution(1.5);
        myBox.setGrabbable(false);
        box = myBox;
        world.add(box);
        img = sm;
        break;
      case 2:
        h = 80;
        w = 83;
        myBox = new FBox(w, h);
        myBox.setPosition((int)random(200, 1000), (int)random(200, 760));
        myBox.setRotatable(false);
        myBox.setDensity(5);
        myBox.setGrabbable(false);
        box = myBox;
        world.add(box);
        img = tm;
        break;
    }
  }
  
  void display(){
    pushMatrix();
    translate(box.getX() - w/2, box.getY() - h/2);
    if(sword.posX < box.getX()){
      translate(w, 0);
      scale(-1, 1);
    }
    image(img, 0, 0);
    popMatrix();
    timer++;
    if(timer == 200){
      //attack();
      timer = 0;
    }
    
    if(box.getX() > 1056 || box.getX() < 144 || box.getY() < 96 || box.getY() > 816){
      isAlive = false;
      world.remove(box);
    }
  }
  
}
