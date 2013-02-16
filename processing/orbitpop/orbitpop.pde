Planet blackSun;
Planet mars;

void setup() {
  size(600,600,P3D);
  background(150);
  noStroke();
  
  //Black sun
  blackSun=new Planet(color(0,200,100),30);
  //Mars (red)
  mars=new Planet(color(255,0,0),50);
  

}


void draw() {
  //grey background, each time
  background(150);
  //lights
  lights();
  
  //Draw blackSun in center
  blackSun.displayAt(width/2,height/2,0);
  mars.orbit(mouseX,mouseY,0,200);
  
 
 
}

