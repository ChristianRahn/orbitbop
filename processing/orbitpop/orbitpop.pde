ArrayList<Planet> planetList;

//*************SETUP

void setup() {
  size(800,600,P3D);
  background(150);
  noStroke();
  
  planetList = new ArrayList<Planet>();
  
  //A few stationary planets in the background
  Planet redSun=new Planet(color(200,50,50),20,width/2,height/2,-200);
  Planet blueSun=new Planet(color(50,50,200),30,-width/2,-height/2,-width*2);
  Planet greenSun=new Planet(color(50,200,50),40,width*1.5,height*1.5,-width*2);
  
  planetList.add(redSun);
  planetList.add(blueSun);
  planetList.add(greenSun);
  

}


//************** RENDERING FUNCTIONS

//adds an orbiting greyscale planet to any existing body randomly
void addRandomOrbiter(ArrayList<Planet> planets) {
  //randomizer coin
  boolean coin;
  coin= boolean(int(floor(random(2))));
  //random array location
  int rp = int(random(planets.size()));
  
  //random orbiter stats
  float rc = random(255);
  float rr = random(5,15);
  float rorb = random(60,500);
  
  //if this.ArrayList is empty, add an orbiter to it
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

//Rendering function for all planet objects
void drawPlanets(ArrayList<Planet> planets) {
  //for each planet
  for (Planet planet : planets) {
   //push matrix and move to the planet position (no pop)
    planet.moveToPosition();
    //draw the planet
    planet.display();
    //draw all its children
    drawPlanets(planet.getChildren());
  //pop after each planet drawn
  popMatrix();
  
  }
  
}

//***********DRAW

void draw() {
  //grey background, each time
  background(150);
  //lights
  lights();
  //white light facing down,left,back
  directionalLight(255,255,255,-.5,.5,-.5);
  
  //render all planets
  drawPlanets(planetList);   
  
  fill(0);
  text("Click to add Planet, Press a key to add a Moon randomly to any existing body",10,10);
 
}

//***************INPUT INTERACTIONS

//adds a stationary planet at click (z at screen - correct for depth later)
void mousePressed() {
     planetList.add(new Planet(color(random(255),random(255),random(255)),20,mouseX,mouseY,0));
}

//adds a random orbiter when any key is pressed
void keyPressed() {
  addRandomOrbiter(planetList);
}

