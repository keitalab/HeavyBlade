class Sword {
  FBox box;
  int type;
  int w;
  int h;
  float posX;
  float posY;
    boolean pressed;
  Elastic e;
  PImage img;


  Sword(int _posX, int _posY, int _type) {
    type = _type;
    pressed = false;
    FBox myBox;
    switch(_type) {
    case 2:
      img = s2;
      w = 45;
      h = 129;
      myBox = new FBox(w, h);
      myBox.setPosition(_posX, _posY);
      myBox.setGrabbable(false);
      myBox.setDensity(1);
      myBox.setRestitution(1.5);
      box = myBox;
      world.add(box);
      break;
    case 1:
      img = s1;
      w = 20;
      h = 68;
      myBox = new FBox(w, h);
      myBox.setPosition(_posX, _posY);
      myBox.setGrabbable(false);
      myBox.setDensity(0.7);
      myBox.setRestitution(1.5);
      box = myBox;
      world.add(box);
      break;
    case 3:
      img = s3;
      w = 40;
      h = 120;
      myBox = new FBox(w, h);
      myBox.setPosition(_posX, _posY);
      myBox.setGrabbable(false);
      myBox.setDensity(2);
      myBox.setRestitution(1.5);
      box = myBox;
      world.add(box);
      break;
    }

    e = new Elastic(box, 0.5);
  }

  void display() {
    posX = box.getX();
    posY = box.getY();
    pushMatrix();
    translate(posX, posY);
    rotate(box.getRotation());
    image(img, -w/2, -h/2);
    popMatrix();
    e.draw();

    if (pressed) {
      e.setLength(mouseX, mouseY);
      box.addForce(-e.calForceX(), -e.calForceY());
    } else {
      e.lengthX = 0;
      e.lengthY = 0;
    }
  }
}
