class Container {
  PVector location;
  float edge;
  color c;
  
  Container() {
    edge = 200;
    c = color(100,0,100);
    location = new PVector(width/2,height/2,0);
  }
  
  void display() {
    noFill();
    stroke(c);
    strokeWeight(3);
    
    pushMatrix();
    translate(location.x,location.y,location.z);
    //rotateY(.5);
    box(edge);
    popMatrix();
    
  }
  
  
  
  
  
}
