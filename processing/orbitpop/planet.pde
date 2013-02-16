class Planet {
  color c; //fill color
  float radius;
  
//Constructor  
  Planet(color pc, float rad) {
    c = pc;
    radius = rad;
    
    
  }
  
  void display() {
   fill(c);
   sphere(radius); 
   
  }
  //Display Planet at location, and does not popMatrix
  void displayAt(float xpos, float ypos, float zpos) {
        
    pushMatrix();
    translate(xpos,ypos,zpos);
    display();
  }
  //unused method right now
  void orbitAt(float xpos,float ypos,float zpos,float orbRad) {
   
    pushMatrix();
    translate(xpos,ypos,zpos);
    rotateY(PI*millis()/1000);
    translate(0,0,orbRad);
    display();
    popMatrix();
  }
  
}
