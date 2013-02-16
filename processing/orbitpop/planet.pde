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
  //Display Planet at location
  void displayAt(float xpos, float ypos, float zpos) {
        
    pushMatrix();
    translate(xpos,ypos,zpos);
    display();
    popMatrix();
  }
  
  void orbit(float xpos,float ypos,float zpos,float orbRad) {
   
    pushMatrix();
    translate(xpos,ypos,zpos);
    rotateY(PI*millis()/1000);
    translate(0,0,orbRad);
    display();
    popMatrix();
  }
  
}
