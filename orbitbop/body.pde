class Body {
  PVector location;
  PVector velocity;
  PVector acceleration;
  //float mass;
  float radius;
  color c;
  float topspeed;
  
  
  //Constructor, random for now
  Body() {
    location = new PVector(width/2,height/2,0);
    velocity = new PVector(0,0,0);
    acceleration = new PVector(0,0,0);
    radius = 20;
    c = 100;
    topspeed = 5;
    
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    noStroke();
    fill(c);
    pushMatrix();
    translate(location.x,location.y,location.z);
    sphere(radius);
    popMatrix();
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

//Wraps edges
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
}
