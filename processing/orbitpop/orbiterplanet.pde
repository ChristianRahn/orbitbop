
class OrbiterPlanet extends Planet {
  float orbRad;
  //Constructor  
  OrbiterPlanet(color pc, float rad, float orbRad) {
    super(pc,rad,0,0,0);
    this.orbRad=orbRad;    
  }
  
 void moveToPosition() {
    pushMatrix();
    rotateY(PI*millis()/1000);
    translate(0,0,orbRad);
    }
 
     
   
     
 } 
 
 



