ArrayList<Body> balls;
Container box;



void setup() {
  size(600,600,P3D);
  background(255);
  hint(DISABLE_DEPTH_TEST);
  
  balls = new ArrayList();
  for (int i = 0; i < 50; i++) {
    balls.add(new Body());
  }
  box = new Container();
  
}

void draw() {
  //Movable camera
  camera(mouseX, mouseY, (height/2.0) / tan(PI*30.0 / 180.0), 
         width/2.0, height/2.0, 0, 
         0, 1, 0);
  
  background(255);
  lights();
  
  box.display();
  
  for (int i = 0; i<balls.size(); i++) {
    Body ball = (Body) balls.get(i);
    
    ball.bounceWall(box);

    ball.randAccel();
    ball.update();
    ball.display();
  
  }
    
}


