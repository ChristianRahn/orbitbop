class Planet {
  color c; //fill color
  float radius;
  float xpos;
  float ypos;
  float zpos;
  ArrayList<Planet> childList;
  
//Constructor  
  Planet(color pc, float rad,float xpos,float ypos, float zpos) {
    c = pc;
    radius = rad;
    childList = new ArrayList();  
    this.xpos=xpos;
    this.ypos=ypos;
    this.zpos=zpos;
    
  }
  
  void display() {
   fill(c);
   sphere(radius); 
   
  }
  //Display Planet at location, and does not popMatrix
  void moveToPosition() {
    pushMatrix();
    translate(xpos,ypos,zpos);
  }
    
  void addChild(Planet planet) {
    childList.add(planet);
  }
  
  ArrayList<Planet> getChildren() {return childList;}
  
}
