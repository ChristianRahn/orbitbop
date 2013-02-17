
class OrbiterPlanet extends Planet {
  float orbRad;
  float Xoff;
  float Zoff;
  
  //Constructor  
  OrbiterPlanet(color pc, float rad, float orbRad) {
    super(pc,rad,0,0,0);
    this.orbRad=orbRad;
    //random Y and Z tilts up to 45deg
    this.Xoff = random(-45,45);
    this.Zoff = random(-45,45);
        
  }
  
 void moveToPosition() {
    pushMatrix();
    rotateY(PI * frameCount/200);
    rotateX(radians(Xoff));
    rotateZ(radians(Zoff));
    translate(0,0,orbRad);
    }
 
     
   
     
 } 
 
 



