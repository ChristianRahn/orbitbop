ArrayList<Planet> planetList;

void setup() {
  size(800,600,P3D);
  background(150);
  noStroke();
  
  planetList = new ArrayList<Planet>();
  
  //origin point at center
  Planet blackSun=new Planet(color(80),20,width/2,height/2,0);
  planetList.add(blackSun);
 
  //Mars orbiting origin
  Planet mars=new OrbiterPlanet(color(255,0,0),30,150);
  blackSun.addChild(mars);
  
  //anonymous mars orbiter
  mars.addChild(new OrbiterPlanet(color(0,42,99),10,100));
 

}

//performance test, woot! -all planets random greyscale
void addRandomOrbiter(ArrayList<Planet> planets) {
  //randomizer coin
  boolean coin;
  coin= boolean(int(random(2)));
  //random array location
  //int rp = int(random(planets.length));
  
  //random planet stats
  float rc = random(255);
  float rr = random(10,20);
  float rx = width/random(10);
  float ry = height/random(10);
  float rz = random(-200,200);
  float rorb = random(60,15);
  
  //if coin true, add an orbiter to a random planet
  if (coin) {
    planets.get(int(random(planets.size()))).addChild(new OrbiterPlanet(color(rc),rr,rorb));
  }
  //else recurse on childList
  else {
    addRandomOrbiter(planets.get(int(random(planets.size()))).getChildren());
  }
}

void drawPlanets(ArrayList<Planet> planets) {
  //for each planet
  for (Planet planet : planets) {
   //push the matrix to the planet position
    planet.moveToPosition();
  //draw the planet
    planet.display();
  //draw all its children
    drawPlanets(planet.getChildren());
  //pop after each planet drawn
  popMatrix();
  
  }
  
}

void draw() {
  //grey background, each time
  background(150);
  //lights
  lights();
  //white light facing down,left,back
  directionalLight(255,255,255,-.5,.5,-.5);
  
  //render all planets
  drawPlanets(planetList);   
  
  //new orbiter every 5 seconds
  if (frameCount%200 == 0) {
    addRandomOrbiter(planetList);
  }

 
}

