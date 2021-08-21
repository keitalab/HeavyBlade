class Elastic{
  FBox body;
  float lengthX;
  float lengthY;
  float k;
  int  dirX, dirY;
  boolean visible;
  
  Elastic(FBox _body, float _k){
    body = _body;
    lengthX = 0;
    lengthY = 0;
    k = _k;
    dirX = 1;
    dirY = 1;
    visible = true;
  }
  
  float calForceX(){
    return dirX * lengthX * k * 50;
  }
  
  float calForceY(){
    return dirY * lengthY * k * 50;
  }
  
  void draw(){
    fill(120, 120, 120);
    strokeWeight(5);
    float realLenX = lengthX * 1/ body.getDensity();
    float realLenY= lengthY * 1/ body.getDensity();
    
    if(visible)
    stroke(5);
    line(body.getX(), body.getY(), body.getX() - dirX * realLenX , body.getY() - dirY * realLenY);
  }
  
  void setLength(float mouseX, float mouseY){
    float lenX = body.getX() - mouseX;
    dirX = lenX > 0 ? 1 : -1;
    lenX = abs(lenX);
    lengthX = sqrt(lenX/20)*20;
    
    float lenY = body.getY() - mouseY;
    dirY = lenY > 0 ? 1 : -1;
    lenY = abs(lenY);
    lengthY = sqrt(lenY/20)*20;
  }
}
