//Import minim stuff
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Import math stuff
import java.util.*;

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
color Blue = #0000FF;

color Volume;
color Pause;
color FF;

//Pause state
int PauseToggle;

//Fast forward state
int FFToggle;

//Variables for the x and y coords of Earth for the purpose of making it into a button
float EarthX, EarthY;

//Planet textbox toggles
int EarthCheck;

//Planet textbox coords
float EarthTX, EarthTY;

void setup() {//---------------------------------------------------
  size(1500, 1400);
  
//Setting up minim + song
  minim = new Minim(this);
  song = minim.loadFile("Wes Montgomery Trio - Days of Wine and Roses.mp3"); //I'm assuming you can use copyrighted songs in a school project? Either way you can see the name and artist so I'm giving credit
  song.play();
  song.shiftGain(song.getGain(),-15, 100); //Using getVolume gave me an error message (as with setGain) so I was forced to use this instead :/
    
//Define base planet speed
  EarthSpeed = 0.015;
  
//Initial volume state
  Volume = Green;
  
//Initial pause state
  Pause = Green;
  
//Initial fast forward state
  FF = Red;
  
//Pause variable
  PauseToggle = 1;
  
//Fast forward variable - 1 = Off, 8 = On
  FFToggle = 1;
  
//Planet click toggles
  EarthCheck = 0;
  
} //---------------------------------------------------

void draw() { //---------------------------------------------------
  background(0);  

//Planet rotation vars - EarthSpeed for a base value, second value is their speed relative to earth, and PauseToggle so the animation can be paused
  if (PauseToggle == 1) {
    MercuryDeg = MercuryDeg + EarthSpeed * 4.2 * FFToggle;
    VenusDeg = VenusDeg + EarthSpeed * 1.6 * FFToggle;
    EarthDeg = EarthDeg + EarthSpeed * FFToggle;
    MarsDeg = MarsDeg + EarthSpeed * 0.532 * FFToggle;
    JupiterDeg = JupiterDeg + EarthSpeed * 0.084 * FFToggle;
    SaturnDeg = SaturnDeg + EarthSpeed * 0.034 * FFToggle;
    UranusDeg = UranusDeg + EarthSpeed * 0.012 * FFToggle;
    NeptuneDeg = NeptuneDeg + EarthSpeed * 0.006 * FFToggle;
  }
  
//=================================================================
//===================== Planet coord calcs for buttons ============

  //Earth
  EarthXCalc(EarthDeg);
  EarthYCalc(EarthDeg);
  
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
  VolumeButton(1250, 100);
  PauseButton(1400, 100);
  FFButton(1400, 250);
  
//=================================================================
//===================== Button textbox click checks ===============

  //Earth
  if (EarthCheck == 1 && PauseToggle == 0) {
    EarthText(EarthX + 700, EarthY + 700);
  }
  
} //---------------------------------------------------

//============================================================
//============= PLANETS + RESPECTIVE PATHS ===================

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

//=========================================================================================================
//======================= UI BUTTTONS =====================================================================

void VolumeButton(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  //Button background
  strokeWeight(3);
  stroke(230);
  fill(255);
  
  ellipse(0, 0, 100, 100);
  
  //Mute icon
  strokeWeight(8);
  stroke(Volume + 20);
  fill(Volume);
  
  line(-25, -25, 25, 25);
  line(25, -25, -25, 25);
  
  popMatrix();
}

void PauseButton(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  //Button background
  strokeWeight(3);
  stroke(230);
  fill(255);
  ellipse(0, 0, 100, 100);
  
  //Pause icon
  strokeWeight(8);
  stroke(Pause + 20);
  fill(Pause);
  line(-20, -25, -20, 25);
  line(20, -25, 20, 25);
  
  popMatrix();
}

void FFButton(int x, int y) { //Fast forward
  pushMatrix();
  translate(x, y);
  
  //Button background
  strokeWeight(3);
  stroke(230);
  fill(255);
  ellipse(0, 0, 100, 100);
  
  //FF icon
  strokeWeight(3);
  stroke(FF + 20);
  fill(FF);
  triangle(-25, -25, 0, 0, -25, 25);
  triangle(0, -25, 25, 0, 0, 25);
  
  popMatrix();
}

//==============================================================================
//===================== CALCULATE PLANET COORDS ================================

//Calculate Earths coordinates in order to make it a button
float EarthXCalc (float rad) {  
  EarthX = (float) Math.cos(rad) * 230;
  return EarthX;
}

float EarthYCalc (float rad) {
  EarthY = (float) Math.sin(rad) * 230;
  return EarthY;
}

//==============================================================================
//===================== PLANET TEXT BOXES ======================================

void EarthText(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  strokeWeight(15);
  stroke(225);
  fill(255);
  
  rect(0, 0, 400, 400, 0, 50, 50, 50);
  
  popMatrix();
}


//==============================================================================
//===================== IF STATEMENTS ON CLICK =================================

void mouseReleased() {
  
//==============================================================================
//=========================== UI STUFF =========================================
  
  //Only way I could figure out to toggle the music
  if (dist(1250, 100, mouseX, mouseY) < 50 && Volume == Green) {
    Volume = Red;
    song.shiftGain(song.getGain(),-150, 100);
  } else if (dist(1250, 100, mouseX, mouseY) < 50 && Volume == Red) {
    Volume = Green;
    song.shiftGain(song.getGain(),-40, 100);
  }
  
  //Pause and unpause
  if (dist(1400, 100, mouseX, mouseY) < 50 && Pause == Green) {
    Pause = Red;
    PauseToggle = 0;
  } else if (dist(1400, 100, mouseX, mouseY) <50 && Pause == Red) {
    Pause = Green;
    PauseToggle = 1;
  }
  
  //Toggle fast forward mode
  if (dist(1400, 250, mouseX, mouseY) < 50 && FF == Red) {
    FF = Green;
    FFToggle = 8;
  } else if (dist(1400, 250, mouseX, mouseY) < 50 && FF == Green) {
    FF = Blue;
    FFToggle = 64;
  } else if (dist(1400, 250, mouseX, mouseY) < 50 && FF == Blue) {
    FF = Red;
    FFToggle = 1;
  }
  
//==============================================================================
//========================== PLANET BUTTONS ====================================
  
  //Earth
  if (dist(EarthX, EarthY, mouseX - 700, mouseY - 700) < 50) {
    EarthCheck = 1;
  } else if (dist(EarthX, EarthY, mouseX - 700, mouseY - 700) > 50) {
    EarthCheck = 0;
  }
}
