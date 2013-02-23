class Container {
  PVector location;
  float edge;
  color c;
  
  
  Container(color colour, float e) {
    edge = e;
    c = colour;
    location = new PVector(width/2,height/2,0);
    
    
  }
  
  void display() {
    fill(c,50);
    stroke(255);
    strokeWeight(3);
    
    pushMatrix();
    translate(location.x,location.y,location.z);
    box(edge);
    popMatrix();
    
  }
  
  
  
  
  
}
