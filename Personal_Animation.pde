//Alexander Double
//Feb 20 2021
//1-4b

//Base planet speed to keep all of the planets speeds relative (I used Earths speed as the reference)
//I used this site(https://space-facts.com/planet-orbits/) for the actual relative orbit speeds
float EarthSpeed;

// Rotation angles of planets
float MercuryDeg;
float VenusDeg;
float EarthDeg;
float MarsDeg;
float JupiterDeg;
float SaturnDeg;

void setup() {//---------------------------------------------------
  size(1400, 1400);
  
  //Define base planet speed
  EarthSpeed = 0.01;
} //---------------------------------------------------

void draw() { //---------------------------------------------------
  background(0);
  
  //Planet rotation vars
  MercuryDeg = MercuryDeg + EarthSpeed * 4.2;
  VenusDeg = VenusDeg + EarthSpeed * 1.6;
  EarthDeg = EarthDeg + EarthSpeed;
  MarsDeg = MarsDeg + EarthSpeed * 0.532;
  JupiterDeg = JupiterDeg + EarthSpeed * 0.084;
  SaturnDeg = SaturnDeg + EarthSpeed * 0.034;
  
  
  //Layer order ------
  
  //Paths
  SaturnPath();
  JupiterPath();
  MarsPath();
  EarthPath();
  VenusPath();
  MercuryPath();
  
  //Planets + Sun
  Sun();
  Mercury(700, 700);
  Venus(700, 700);
  Earth(700, 700);
  Mars(700, 700);
  Jupiter(700, 700);
  Saturn(700, 700);
  
} //---------------------------------------------------

void Sun() {
  strokeWeight(8);
  stroke(250, 200, 0);
  fill(250, 240, 0);
  
  ellipse(700, 700, 150, 150);
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
  
  ellipse(700, 700, 210, 210);
}

void Venus(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  rotate(VenusDeg);
  
  strokeWeight(5);
  stroke(160, 150, 130);
  fill(210, 190, 160);
  
  ellipse(160, 0, 50, 50);
  
  popMatrix();
}

void VenusPath() {
  strokeWeight(1);
  stroke(255);
  fill(0);
  
  ellipse(700, 700, 320, 320);
}

void Earth(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  rotate(EarthDeg);
  
  strokeWeight(5);
  stroke(2, 65, 200);
  fill(22, 85, 240);
  
  ellipse(230, 0, 55, 55);
  
  strokeWeight(2);
  stroke(15, 160, 30);
  fill(15, 190, 35);
  
  //Very abstract continents
  rect(225, 5, 10, 10);
  rect(235, -13, 10, 10);
  rect(215, -11, 10, 10);
  
  popMatrix();
}

void EarthPath() {
  strokeWeight(1);
  stroke(255);
  fill(0);
  
  ellipse(700, 700, 460, 460);
}

void Mars(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  rotate(MarsDeg);
  
  strokeWeight(5);
  stroke(165, 50, 10);
  fill(200, 60, 10);
  
  ellipse(300, 0, 57, 57);
  
  popMatrix();
}

void MarsPath() {
  strokeWeight(1);
  stroke(255);
  fill(0);
  
  ellipse(700, 700, 600, 600);
}

void Jupiter(int x, int y) {
  pushMatrix();
  translate(700, 700);
  
  rotate(JupiterDeg);
  
  strokeWeight(6);
  stroke(210, 200, 175);
  fill(232, 219, 194);
  
  ellipse(400, 0, 110, 110);
  
  popMatrix();
}

void JupiterPath() {
  strokeWeight(1);
  stroke(255);
  fill(0);
  
  ellipse(700, 700, 800, 800);
}

void Saturn(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  rotate(SaturnDeg);
  
  strokeWeight(6);
  stroke(155, 100, 10);
  fill(211, 139, 4);
  
  ellipse(515, 0, 95, 95);
  
  popMatrix();
}

void SaturnPath() {
  strokeWeight(1);
  stroke(255);
  fill(0);
  
  ellipse(700, 700, 1030, 1030);
}
