ArrayList<Body> balls;
Container box;
Container gel1;
Container gel2;
PVector faster = new PVector(1.1,1.1,1.1);
PVector slower = new PVector(.99,.99,.99);



void setup() {
  size(1000,600,P3D);
  background(200);
  hint(DISABLE_DEPTH_TEST);
  
  //Populate the balls array
  balls = new ArrayList();
  for (int i = 0; i < 25; i++) {
    balls.add(new Body());
  }
  
  //Containers
  box = new Container(width/2, height/2, 0,color(0,0,100), 400);
  gel1 = new Container((width/2-100),(height/2-100),-100, color(0,100,0), 100);
  gel2 = new Container((width/2+100),(height/2+100),100, color(100,0,0), 100);
  
  //Accelerate the balls at random
  for (int i = 0; i < balls.size(); i++) {
    Body ball = balls.get(i);
    PVector accel = new PVector(random(-1,1), random(-1,1), random(-1,1));
    ball.applyForce(accel);
  }
}

void draw() {
  //Movable camera
  camera(mouseX, mouseY, (height/2.0) / tan(PI*30.0 / 180.0), 
         width/2.0, height/2.0, 0, 
         0, 1, 0);
  
  background(200);
  lights();
  
  box.display();
  gel1.display();
  gel2.display();
  
  for (int i = 0; i<balls.size(); i++) {
    Body ball = (Body) balls.get(i);
    
    ball.bounceWall(box);
    
    if (ball.isInside(gel1)) {ball.velocity.mult(faster);}
    if (ball.isInside(gel2)) {ball.velocity.mult(slower);}

    //ball.randAccel();
    ball.update();
    ball.display();
  
  }
    
}


