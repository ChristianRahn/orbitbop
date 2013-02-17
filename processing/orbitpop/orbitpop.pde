ArrayList<Planet> planetList;

void setup() {
  size(800,600,P3D);
  background(150);
  noStroke();
  
  planetList = new ArrayList<Planet>();
  
  //origin point at center
  Planet blackSun=new Planet(color(80),20,width/2,height/2,-200);
 
  Planet blueSun=new Planet(color(50,50,200),30,width*.01,height*.01,-1000);
  Planet greenSun=new Planet(color(50,200,50),40,width*.99,height*.99,-1000);
  
  planetList.add(blackSun);
  planetList.add(blueSun);
  planetList.add(greenSun);
  
  
  /*
  //Mars orbiting origin
  Planet mars=new OrbiterPlanet(color(255,0,0),30,150);
  blackSun.addChild(mars);
  
  //anonymous mars orbiter
  mars.addChild(new OrbiterPlanet(color(0,42,99),10,100));
 */

}

//performance test, woot! -all planets random greyscale
void addRandomOrbiter(ArrayList<Planet> planets) {
  //randomizer coin
  boolean coin;
  coin= boolean(int(floor(random(2))));
  //random array location
  int rp = int(random(planets.size()));
  
  //random planet stats
  float rc = random(255);
  float rr = random(5,15);
  float rx = width/random(10);
  float ry = height/random(10);
  float rz = random(-500,100);
  float rorb = random(60,500);
  
  //if the ArrayList is empty, add an orbiter to it
  if (planets.size() == 0) {planets.add(new OrbiterPlanet(color(rc),rr,rorb));}
  else {
  
  //if coin true, add an orbiter to a random planet
  if (coin) {
    planets.get(rp).addChild(new OrbiterPlanet(color(rc),rr,rorb));
  }
  //else flip for adding to a random child
  else {
    addRandomOrbiter(planets.get(rp).getChildren());
  }
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
  if (frameCount%150 == 0) {
    addRandomOrbiter(planetList);
  }

 
}

