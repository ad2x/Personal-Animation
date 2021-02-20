//Alexander Double
//Feb 20 2021
//1-4b

// Rotation angles of planets
float MercuryDeg;

void setup() {//---------------------------------------------------
  size(800, 800);
} //---------------------------------------------------

void draw() { //---------------------------------------------------
  background(0);
  
  //Planet rotation vars
  MercuryDeg = MercuryDeg + 0.01;
  
  //Layer order ------
  
  //Paths
  MercuryPath();
  
  //Planets + Sun
  Sun();
  Mercury(400, 400);
  
} //---------------------------------------------------

void Sun() {
  strokeWeight(8);
  stroke(250, 200, 0);
  fill(250, 240, 0);
  
  ellipse(400, 400, 150, 150);
}

void Mercury(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  rotate(MercuryDeg);
  
  strokeWeight(4);
  stroke(165, 140, 100);
  fill(220, 190, 150);
  
  ellipse(105, 0, 35, 35);
  
  popMatrix();
}

void MercuryPath() {
  strokeWeight(1);
  stroke(255);
  fill(0);
  
  ellipse(400, 400, 210, 210);
}
