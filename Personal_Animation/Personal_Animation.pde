import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song;

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
float UranusDeg;
float NeptuneDeg;

//Colours
color Red = #FF0000;
color Green = #00FF00;
color Volume;

void setup() {//---------------------------------------------------
  size(1600, 1400);
  
  //Setting up minim + song
  minim = new Minim(this);
  song = minim.loadFile("Wes Montgomery Trio - Days of Wine and Roses.mp3");
  song.play();
  song.shiftGain(song.getGain(),-15, 100);
    
  //Define base planet speed
  EarthSpeed = 0.015;
  
  //Initial volume state
  Volume = Green;
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
  UranusDeg = UranusDeg + EarthSpeed * 0.012;
  NeptuneDeg = NeptuneDeg + EarthSpeed * 0.006;
  
  
  //Layer order ------
  
  //Paths
  NeptunePath();
  UranusPath();
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
  Uranus(700, 700);
  Neptune(700, 700);
  
  //UI
  VolumeButton();
  
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

//hehe
void Uranus(int x, int y) {
  pushMatrix();
  translate(700, 700);
  
  rotate(UranusDeg);
  
  strokeWeight(5);
  stroke(5, 135, 147);
  fill(5, 183, 201);
  
  ellipse(610, 0, 75, 75);
  
  popMatrix();
}

void UranusPath() {
  strokeWeight(1);
  stroke(255);
  fill(0);
  
  ellipse(700, 700, 1220, 1220);
}

void Neptune(int x, int y) {
  pushMatrix();
  translate(700, 700);
  
  rotate(NeptuneDeg);
  
  strokeWeight(5);
  stroke(10, 30, 170);
  fill(10, 40, 225);
  
  ellipse(695, 0, 70, 70);
  
  popMatrix();
}

void NeptunePath() {
  strokeWeight(1);
  stroke(255);
  fill(0);
  
  ellipse(700, 700, 1390, 1390);
}

void VolumeButton() {
  //Button background
  strokeWeight(3);
  stroke(230);
  fill(255);
  
  ellipse(1250, 100, 100, 100);
  
  //Mute icon
  strokeWeight(8);
  stroke(Volume + 20);
  fill(Volume);
  
  line(1225, 75, 1275, 125);
  line(1275, 75, 1225, 125);
}

void mouseReleased() {
  //Only way I could figure out to toggle the music
  if (dist(1250, 100, mouseX, mouseY) < 50 && Volume == Green) {
    Volume = Red;
    song.shiftGain(song.getGain(),-150, 100);
  } else if (dist(1250, 100, mouseX, mouseY) < 50 && Volume == Red) {
    Volume = Green;
    song.shiftGain(song.getGain(),-40, 100);
  }
}
