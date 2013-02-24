class Container {
  PVector location;
  float edge;
  color c;
  
  
  Container(float xpos, float ypos, float zpos, color colour, float e) {
    edge = e;
    c = colour;
    location = new PVector(xpos, ypos, zpos);
    
    
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
