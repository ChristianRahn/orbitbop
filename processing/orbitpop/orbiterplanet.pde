
class OrbiterPlanet extends Planet {
  float orbRad;
  float Xoff;
  float Zoff;
  
  //Constructor  
  OrbiterPlanet(color pc, float rad, float orbRad) {
    super(pc,rad,0,0,0);
    this.orbRad=orbRad;
    //random Y and Z tilts up to 20deg
    this.Xoff = random(-20,20);
    this.Zoff = random(-20,20);
        
  }
  
 void moveToPosition() {
    pushMatrix();
    rotateX(radians(Xoff));
    rotateZ(radians(Zoff));
    rotateY(PI * frameCount/200);
    translate(0,0,orbRad);
    }
 
     
   
     
 } 
 
 



