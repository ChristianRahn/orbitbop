
class OrbiterPlanet extends Planet {
  
  //Constructor  
  OrbiterPlanet(color pc, float rad) {
    super(pc,rad);  
  }
  
  //displays with on orbital radius orbRad, then popMatrix
 void orbit(float orbRad) {
    rotateY(PI*millis()/1000);
    translate(0,0,orbRad);
    super.display();
    popMatrix();
  }
 
     
   
     
 } 
 
 



