ArrayList<Body> balls;
Container box;
Container gelGo;
Container gelSlow;
Container gelRand;

PVector randAccel;


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
  gelGo = new Container((width/2-100),(height/2-100),-100, color(0,100,0), 100);
  gelSlow = new Container((width/2+100),(height/2+100),100, color(100,0,0), 100);
  gelRand = new Container(width/2,height/2,0,color(0), 100);
  
}

void draw() {
  //Movable camera
  camera(mouseX, mouseY, (height/2.0) / tan(PI*30.0 / 180.0), 
         width/2.0, height/2.0, 0, 
         0, 1, 0);
  
  background(100);
  lights();
  
  //Show containers
  box.display();
  gelGo.display();
  gelSlow.display();
  gelRand.display();
  
  
  //Ball handler (lol)
  for (int i = 0; i < balls.size(); i++) {
    Body ball = (Body) balls.get(i);
    
    //Random for each ball
    randAccel = PVector.random3D();
    
    ball.bounceWall(box);

    ball.update();
    ball.display();
    
    //Check if in any boxes
    if (ball.isInside(gelRand)) {ball.applyForce(randAccel);}
    if (ball.isInside(gelGo)) {
      PVector faster = ball.velocity.get();
      faster.normalize();
      faster.mult(1);
      ball.applyForce(faster);
    }
    if (ball.isInside(gelSlow) && ball.velocity.mag()>1) {
      PVector slower = ball.velocity.get();
      slower.normalize();
      slower.mult(-1);
      ball.applyForce(slower);
    }
    
    
  
  }
  
  
  
  //text(str(balls.size()),200,200);
    
}


