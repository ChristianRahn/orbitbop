ArrayList<Planet> planetList;

void setup() {
  size(1000,1000,P3D);
  background(150);
  noStroke();
  
  planetList = new ArrayList<Planet>();
  
  //Black sun
  Planet blackSun=new Planet(color(80),30,width*.3,height*.3,0);
  Planet blueSun=new Planet(color(0,0,255),20,width*.6,height*.6,0);
  planetList.add(blackSun);
  planetList.add(blueSun);
 
  //Mars (red)
  Planet mars=new OrbiterPlanet(color(255,0,0),50,150);
  blackSun.addChild(mars);
  mars.addChild(new OrbiterPlanet(color(0,42,99),30,100));
 

}

void drawPlanets(ArrayList<Planet> planets) {
  //for each planet
  for (Planet planet : planets) {
   //push the matrix to the planet position
   planet.moveToPosition();
  
  //draw the planet
  planet.display();
  
  drawPlanets(planet.getChildren());
  popMatrix();
  
  }
  //pop the matrix
}

void draw() {
  //grey background, each time
  background(150);
  //lights
  lights();
  
  drawPlanets(planetList);   

 
}

