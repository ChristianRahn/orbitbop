ArrayList<Body> balls;
Container box;
Container gelGo;
Container gelSlow;
Container gelRand;

PVector gravity;


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
  box = new Container(width/2, height/2, 0,color(255), 600);
  gelGo = new Container((width/2-200),(height/2-200),-200, color(0,100,0), 200);
  gelSlow = new Container((width/2+200),(height/2+200),200, color(100,0,0), 200);
  gelRand = new Container(width/2,height/2,0,color(0), 100);
  
}

void draw() {
  //Movable camera
  camera(mouseX, mouseY, (height/2.0) / tan(PI*30.0 / 360.0), 
         width/2.0, height/2.0, 0, 
         0, 1, 0);
  
  background(0);
  lights();
  directionalLight(128,128,128,0,1,-1);
  
  
  //Show containers
  box.display();
  gelGo.display();
  gelSlow.display();
  gelRand.display();
  
  
  //Ball handler (lol)
  for (int i = 0; i < balls.size(); i++) {
    Body ball = (Body) balls.get(i);
    
    //Seal them in    
    ball.bounceWall(box);
    
    //Enviromental forces
    gravity = new PVector(0,.1*ball.mass,0);
    //ball.applyForce(gravity);
    
    ball.update();
    ball.display();
    
    //Check if in any boxes
    
    //gelRand will apply a random acceleration
    if (ball.isInside(gelRand)) {
      PVector rando = PVector.random3D();
      rando.mult(ball.mass);
      ball.applyForce(rando);
    }
    
    //gelGo applies a force equal to vel unit
    if (ball.isInside(gelGo)) {
      PVector faster = ball.velocity.get();
      faster.normalize();
      faster.mult(ball.mass);
      ball.applyForce(faster);
    }
    //gelSlow applies inverse vel unit, but won't stop the ball
    if (ball.isInside(gelSlow) && ball.velocity.mag()>2) {
      PVector slower = ball.velocity.get();
      slower.normalize();
      slower.mult(-1*ball.mass);
      ball.applyForce(slower);
    }
    
    
  
  }
  
  
  
    
}


