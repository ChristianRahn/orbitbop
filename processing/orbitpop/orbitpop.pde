void setup() {
  size(600,600,P3D);
  background(0);
  
}


void draw() {
  pushMatrix();
  translate(width/2,height/2,0);
  sphere(50);
  popMatrix();
}

