Body ball;
Container box;
PVector ra;
float xoff = 0;
float yoff = 10000;
float zoff = 100;

void setup() {
  size(600,600,P3D);
  background(255);
  lights();
  
  ball = new Body();
  box = new Container();
  
}

void draw() {
  camera(mouseX, mouseY, (height/2.0) / tan(PI*30.0 / 180.0), 
         width/2.0, height/2.0, 0, 
         0, 1, 0);
  
  background(255);
  
  ball.bounceWall(box);

  xoff += .1;
  yoff += .1;
  
  float x = map(noise(xoff),0,1,-1,1);
  float y = map(noise(yoff),0,1,-1,1);
  float z = map(noise(zoff),0,1,-1,1);
  
  ra = new PVector(x,y,z);
  
  ball.acceleration.add(ra);
  ball.update();
  ball.display();
  
  box.display();

  
  //rotateY(PI*frameCount/200);
  
}


