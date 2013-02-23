ArrayList<Body> balls;
Container box;
Container gel;



void setup() {
  size(600,600,P3D);
  background(200);
  hint(DISABLE_DEPTH_TEST);
  
  balls = new ArrayList();
  for (int i = 0; i < 10; i++) {
    balls.add(new Body());
  }
  box = new Container(color(0,0,100), 250);
  gel = new Container(color(0,100,0), 80);
  
}

void draw() {
  //Movable camera
  camera(mouseX, mouseY, (height/2.0) / tan(PI*30.0 / 180.0), 
         width/2.0, height/2.0, 0, 
         0, 1, 0);
  
  background(200);
  lights();
  
  box.display();
  gel.display();
  
  for (int i = 0; i<balls.size(); i++) {
    Body ball = (Body) balls.get(i);
    
    ball.bounceWall(box);
    
    if (ball.isInside(gel)) {ball.velocity.mult(.5);}

    ball.randAccel();
    ball.update();
    ball.display();
  
  }
    
}


