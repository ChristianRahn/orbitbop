
class OrbiterPlanet extends Planet {
  float orbRad;
  //random Y and Z tilts up to 45deg
  float Xoff = radians(Math.random()*45);
  float Zoff = radians(Math.random()*45);
  
  //Constructor  
  OrbiterPlanet(color pc, float rad, float orbRad) {
    super(pc,rad,0,0,0);
    this.orbRad=orbRad;
        
  }
  
 void moveToPosition() {
    pushMatrix();
    rotateX(Xoff);
    rotateZ(Zoff);
    rotateY(PI*millis()/1000);
    translate(0,0,orbRad);
    }
 
     
   
     
 } 
 
 



