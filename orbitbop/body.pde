class Body {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius;
  color c;
  float topspeed;
  
  
  //Constructor, random for now
  Body() {
    location = new PVector(width/2,height/2,0);
    velocity = new PVector(0,0,0);
    radius = 10;
    c = color(random(255),random(255),random(255));
    topspeed = 10;
    
  }
  
  void update() {
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display() {
    noStroke();
    fill(c);
    pushMatrix();
    translate(location.x,location.y,location.z);
    sphere(radius);
    popMatrix();
}

void applyForce(PVector force) {
  velocity.add(force);
}

//Perlin Acceleration
void noiseAccel() {
  PVector na;
  float xoff = random(0,1000);
  float yoff = random(0,1000);
  float zoff = random(0,1000);
  
  float x = map(noise(xoff),0,1,-1,1);
  float y = map(noise(yoff),0,1,-1,1);
  float z = map(noise(zoff),0,1,-1,1);
  
  na = new PVector(x,y,z);
  
  acceleration.add(na);
  
  xoff += .1;
  yoff += .1;
  zoff += .1;
  
}

//Random Acceleration
void randAccel() {
  PVector ra;
  
  float x = random(-1,1);
  float y = random(-1,1);
  float z = random(-1,1);
  
  ra = new PVector(x,y,z);
  
  applyForce(ra);
  
}

boolean isInside(Container container) {
  //Nested conditionals - seems like a good thing to do.
  boolean isX = false;
  boolean isY = false;
  boolean isZ = false;
  
  if(location.x < (container.location.x+container.edge/2) && 
      location.x > (container.location.x-container.edge/2))
      {isX = true;}
    
  if(location.y < (container.location.y+container.edge/2) && 
      location.y > (container.location.y-container.edge/2))
      {isY = true;}
  
  if(location.z < (container.location.z+container.edge/2) && 
      location.z > (container.location.z-container.edge/2))
      {isZ = true;}    
  
  if (isX && isY && isZ) {return true;}
  else {return false;}
}

void bounceWall(Container container) {
  //X bounce
  if ((location.x+radius) > (container.location.x + container.edge/2)) {
   location.x = (container.location.x+container.edge/2)-radius;
   velocity.x *= -1;
  }
   else if ((location.x-radius) < (container.location.x - container.edge/2)) {
     location.x = (container.location.x-container.edge/2)+radius;
     velocity.x *= -1;
  }
  //Y bounce
  if ((location.y+radius) > (container.location.y + container.edge/2)) {
   location.y = (container.location.y+container.edge/2)-radius;
   velocity.y *= -1;
  }
   else if ((location.y-radius) < (container.location.y - container.edge/2)) {
     location.y = (container.location.y-container.edge/2)+radius;
     velocity.y *= -1;
  }
  //Z bounce
  if ((location.z+radius) > (container.location.z + container.edge/2)) {
   location.z = (container.location.z+container.edge/2)-radius;
   velocity.z *= -1;
  }
   else if ((location.z-radius) < (container.location.z - container.edge/2)) {
     location.z = (container.location.z-container.edge/2)+radius;
     velocity.z *= -1;
  }
  
}

//Wraps edges FIX BEFORE IMPLEMENT
/*
void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
    
    if (location.z > 0) {
      location.z = -100;
    } else if (location.z < -1000) {
      location.z = -100;
    }
    
  }
*/  
  
}
