class Container {
  PVector location;
  float edge;
  color c;
  
  Container() {
    edge = 250;
    c = color(255);
    location = new PVector(width/2,height/2,0);
  }
  
  void display() {
    noFill();
    stroke(c);
    strokeWeight(3);
    
    pushMatrix();
    translate(location.x,location.y,location.z);
    box(edge);
    popMatrix();
    
  }
  
  
  
  
  
}
