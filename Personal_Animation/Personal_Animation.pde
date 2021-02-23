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


//List of things:
// - Planets orbiting
// - Mute and unmute button
// - Pause and unpause button
// - 3 speed modes
// - Ability to click on planets to see info 
// - Turns computer into heater 


//Base planet speed to keep all of the planets speeds relative (I used Earths speed as the reference)
//I used this site(https://space-facts.com/planet-orbits/) for the actual relative orbit speeds
float EarthSpeed;

// Rotation angles of planets 
float MercuryRad;
float VenusRad;
float EarthRad;
float MarsRad;
float JupiterRad;
float SaturnRad;
float UranusRad;
float NeptuneRad;

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
float MercuryX, MercuryY;
float VenusX, VenusY;
float EarthX, EarthY;
float MarsX, MarsY;
float JupiterX, JupiterY;
float SaturnX, SaturnY;
float UranusX, UranusY;
float NeptuneX, NeptuneY;

//Planet (+ sun) textbox toggles
int SunCheck;
int MercuryCheck;
int VenusCheck;
int EarthCheck;
int MarsCheck;
int JupiterCheck;
int SaturnCheck;
int UranusCheck;
int NeptuneCheck;

//Planet photos
PImage SunImg;
PImage NoImg;
PImage MercuryImg;
PImage VenusImg;
PImage EarthImg;
PImage MarsImg;
PImage JupiterImg;
PImage SaturnImg;
PImage UranusImg;
PImage NeptuneImg;

//Font
PFont Font;

//Hover mouse over planets
int SunH;
int MercuryH;
int VenusH;
int EarthH;
int MarsH;
int JupiterH;
int SaturnH;
int UranusH;
int NeptuneH;

//Hover mouse over buttons
int MuteH;
int PauseH;
int FFH;

//Flip textboxes
int SaturnXFlip;
int UranusXFlip;
int NeptuneXFlip;

void setup() {//---------------------------------------------------
  size(1500, 1400);
  
//Font
  Font = createFont("conthrax-sb.ttf", 30);
  //Font settings
  textAlign(CENTER, CENTER);
  textSize(30);
  textFont(Font);
  
//Initialize planet photos
  EarthImg = loadImage("EarthImage.jpg");
  SunImg = loadImage("SunImage.jpg");
  NoImg = loadImage("no.png");
  MercuryImg = loadImage("MercuryImage.jpg");
  VenusImg = loadImage("VenusImage.jpg");
  MarsImg = loadImage("MarsImage.jpg");
  JupiterImg = loadImage("JupiterImage.jpg");
  SaturnImg = loadImage("SaturnImage.jpg");
  UranusImg = loadImage("UranusImage.jpg");
  NeptuneImg = loadImage("NeptuneImage.jpg");
  
//Setting up minim + song
  minim = new Minim(this);
  song = minim.loadFile("Wes Montgomery Trio - Days of Wine and Roses.mp3"); //I'm assuming you can use copyrighted songs in a school project? Either way you can see the name and artist so I'm giving credit
  song.play();
  song.shiftGain(song.getGain(),-15, 100); //getVolume and setGain don't work with certain versions of Processing :/ 
    
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
  
//Init. flip vars
  SaturnXFlip = 1;
  
} //---------------------------------------------------

void draw() { //---------------------------------------------------
  background(0);  

//Planet rotation vars - EarthSpeed for a base value, second value is their speed relative to earth, and PauseToggle so the animation can be paused
  if (PauseToggle == 1) {
    MercuryRad = MercuryRad + EarthSpeed * 4.2 * FFToggle;
    VenusRad = VenusRad + EarthSpeed * 1.6 * FFToggle;
    EarthRad = EarthRad + EarthSpeed * FFToggle;
    MarsRad = MarsRad + EarthSpeed * 0.532 * FFToggle;
    JupiterRad = JupiterRad + EarthSpeed * 0.084 * FFToggle;
    SaturnRad = SaturnRad + EarthSpeed * 0.034 * FFToggle;
    UranusRad = UranusRad + EarthSpeed * 0.012 * FFToggle;
    NeptuneRad = NeptuneRad + EarthSpeed * 0.006 * FFToggle;
  }
  
//=================================================================
//===================== Planet coord calcs for buttons ============

  //Mercury
  MercuryXCalc(MercuryRad);
  MercuryYCalc(MercuryRad);
  
  //Venus
  VenusXCalc(VenusRad);
  VenusYCalc(VenusRad);

  //Earth
  EarthXCalc(EarthRad);
  EarthYCalc(EarthRad);
  
  //Mars
  MarsXCalc(MarsRad);
  MarsYCalc(MarsRad);
  
  //Jupiter
  JupiterXCalc(JupiterRad);
  JupiterYCalc(JupiterRad);
  
  //Saturn
  SaturnXCalc(SaturnRad);
  SaturnYCalc(SaturnRad);
  
  //Uranus
  UranusXCalc(UranusRad);
  UranusYCalc(UranusRad);
  
  //Neptune
  NeptuneXCalc(NeptuneRad);
  NeptuneYCalc(NeptuneRad);
  
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

  //Sun
  if (SunCheck == 1 && PauseToggle == 0) {
    SunText(700, 700);
  }

  //Mercury
  if (MercuryCheck == 1 && PauseToggle == 0) {
    MercuryText(MercuryX + 700, MercuryY + 700);
  }
  
  //Venus
  if (VenusCheck == 1 && PauseToggle == 0) {
    VenusText(VenusX + 700, VenusY + 700);
  }

  //Earth
  if (EarthCheck == 1 && PauseToggle == 0) {
    EarthText(EarthX + 700, EarthY + 700);
  }
  
  //Mars
  if (MarsCheck == 1 && PauseToggle == 0) {
    MarsText(MarsX + 700, MarsY + 700);
  }
  
  //Jupiter
  if (JupiterCheck == 1 && PauseToggle == 0) {
    JupiterText(JupiterX + 700, JupiterY + 700);
  }
  
  //Saturn
  if (SaturnCheck == 1 && PauseToggle == 0) {
    SaturnText(SaturnX + 700, SaturnY + 700);
  }
  
  //Uranus
  if (UranusCheck == 1 && PauseToggle == 0) {
    UranusText(UranusX + 700, UranusY + 700);
  }
  
  //Neptune
  if (NeptuneCheck == 1 && PauseToggle == 0) {
    NeptuneText(NeptuneX + 700, NeptuneY + 700);
  }
  
//============================================================
//============ PLANET + BUTTON HOVER =========================

  //========== BUTTONS ============

  //Mute and unmute
  if (dist(1250, 100, mouseX, mouseY) < 50) {
    MuteH = 2;
  } else if (dist(1250, 100, mouseX, mouseY) > 50) {
    MuteH = 1;
  }
  
  //Pause and unpause
  if (dist(1400, 100, mouseX, mouseY) < 50) {
    PauseH = 2;
  } else if (dist(1400, 100, mouseX, mouseY) > 50) {
    PauseH = 1;
  }
  
  //Toggle fast forward mode
  if (dist(1400, 250, mouseX, mouseY) < 50) {
    FFH = 2;
  } else if (dist(1400, 250, mouseX, mouseY) > 50) {
    FFH = 1;
  }
  //========== PLANETS ============

  //Sun
  if (dist(700, 700, mouseX, mouseY) < 75 && PauseToggle == 0) {
    SunH = 2;
  } else if (dist(700, 700, mouseX, mouseY) > 75) {
    SunH = 1;
  }

  //Mercury
  if (dist(MercuryX, MercuryY, mouseX - 700, mouseY - 700) < 17.5 && PauseToggle == 0) {
    MercuryH = 2;
  } else if (dist(MercuryX, MercuryY, mouseX - 700, mouseY - 700) > 17.5) {
    MercuryH = 1;
  }
  
  //Venus
  if (dist(VenusX, VenusY, mouseX - 700, mouseY - 700) < 25 && PauseToggle == 0) {
    VenusH = 2;
  } else if (dist(VenusX, VenusY, mouseX - 700, mouseY - 700) > 25) {
    VenusH = 1;
  }
  
  //Earth
  if (dist(EarthX, EarthY, mouseX - 700, mouseY - 700) < 27.5 && PauseToggle == 0) {
    EarthH = 2;
  } else if (dist(EarthX, EarthY, mouseX - 700, mouseY - 700) > 27.5) {
    EarthH = 1;
  }
  
  //Mars
  if (dist(MarsX, MarsY, mouseX - 700, mouseY - 700) < 28.5 && PauseToggle == 0) {
    MarsH = 2;
  } else if (dist(MarsX, MarsY, mouseX - 700, mouseY - 700) > 28.5) {
    MarsH = 1;
  }
  
  //Jupiter
  if (dist(JupiterX, JupiterY, mouseX - 700, mouseY - 700) < 55 && PauseToggle == 0) {
    JupiterH = 2;
  } else if (dist(JupiterX, JupiterY, mouseX - 700, mouseY - 700) > 55) {
    JupiterH = 1;
  }
  
  //Saturn
  if (dist(SaturnX, SaturnY, mouseX - 700, mouseY - 700) < 47.5 && PauseToggle == 0) {
    SaturnH = 2;
  } else if (dist(SaturnX, SaturnY, mouseX - 700, mouseY -700) > 47.5) {
    SaturnH = 1;
  }
  
  //Uranus
  if (dist(UranusX, UranusY, mouseX - 700, mouseY - 700) < 37.5 && PauseToggle == 0) {
    UranusH = 2;
  } else if (dist(UranusX, UranusY, mouseX - 700, mouseY - 700) > 37.5) {
    UranusH = 1;
  }
  
  //Neptune
  if (dist(NeptuneX, NeptuneY, mouseX - 700, mouseY - 700) < 35 && PauseToggle == 0) {
    NeptuneH = 2;
  } else if (dist(NeptuneX, NeptuneY, mouseX - 700, mouseY - 700) > 35) {
    NeptuneH = 1;
  }
  
//============================================================
//============= FLIP TEXTBOXES ===============================

  if (SaturnX + 700 >= 1100) {
    SaturnXFlip = -1;
  } else if (SaturnX + 700 < 1100) {
    SaturnXFlip = 1;
  }
  
  if (UranusX + 700 >= 1100) {
    UranusXFlip = -1;
  } else if (UranusX + 700 < 1100) {
    UranusXFlip = 1;
  }
  
  if (NeptuneX + 700 >= 1100) {
    NeptuneXFlip = -1;
  } else if (NeptuneX + 700 < 1100) {
    NeptuneXFlip = 1;
  }
  
} //---------------------------------------------------



//============================================================
//============= PLANETS + RESPECTIVE PATHS ===================

void Sun() {
  strokeWeight(8 * SunH);
  stroke(250, 200, 0);
  fill(250, 240, 0);
  
  ellipse(700, 700, 150, 150);
}

void Mercury(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  rotate(MercuryRad);
  
  strokeWeight(4 * MercuryH);
  stroke(165, 140, 100);
  fill(220, 190, 150);
  
  ellipse(105, 0, 35, 35);
  
  popMatrix();
}

void MercuryPath() {
  strokeWeight(1 * MercuryH);
  stroke(255);
  fill(0);
  
  ellipse(700, 700, 210, 210);
}

void Venus(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  rotate(VenusRad);
  
  strokeWeight(5 * VenusH);
  stroke(160, 150, 130);
  fill(210, 190, 160);
  
  ellipse(160, 0, 50, 50);
  
  popMatrix();
}

void VenusPath() {
  strokeWeight(1 * VenusH);
  stroke(255);
  fill(0);
  
  ellipse(700, 700, 320, 320);
}

void Earth(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  rotate(EarthRad);
  
  strokeWeight(5 * EarthH);
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
  strokeWeight(1 * EarthH);
  stroke(255);
  fill(0);
  
  ellipse(700, 700, 460, 460);
}

void Mars(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  rotate(MarsRad);
  
  strokeWeight(5 * MarsH);
  stroke(165, 50, 10);
  fill(200, 60, 10);
  
  ellipse(300, 0, 57, 57);
  
  popMatrix();
}

void MarsPath() {
  strokeWeight(1 * MarsH);
  stroke(255);
  fill(0);
  
  ellipse(700, 700, 600, 600);
}

void Jupiter(int x, int y) {
  pushMatrix();
  translate(700, 700);
  
  rotate(JupiterRad);
  
  strokeWeight(6 * JupiterH);
  stroke(180, 170, 145);
  fill(232, 219, 194);
  
  ellipse(400, 0, 110, 110);
  
  popMatrix();
}

void JupiterPath() {
  strokeWeight(1 * JupiterH);
  stroke(255);
  fill(0);
  
  ellipse(700, 700, 800, 800);
}

void Saturn(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  rotate(SaturnRad);
  
  strokeWeight(6 * SaturnH);
  stroke(155, 100, 10);
  fill(211, 139, 4);
  
  ellipse(515, 0, 95, 95);
  
  popMatrix();
}

void SaturnPath() {
  strokeWeight(1 * SaturnH);
  stroke(255);
  fill(0);
  
  ellipse(700, 700, 1030, 1030);
}

//hehe
void Uranus(int x, int y) {
  pushMatrix();
  translate(700, 700);
  
  rotate(UranusRad);
  
  strokeWeight(5 * UranusH);
  stroke(5, 135, 147);
  fill(5, 183, 201);
  
  ellipse(610, 0, 75, 75);
  
  popMatrix();
}

void UranusPath() {
  strokeWeight(1 * UranusH);
  stroke(255);
  fill(0);
  
  ellipse(700, 700, 1220, 1220);
}

void Neptune(int x, int y) {
  pushMatrix();
  translate(700, 700);
  
  rotate(NeptuneRad);
  
  strokeWeight(5 * NeptuneH);
  stroke(10, 30, 170);
  fill(10, 40, 225);
  
  ellipse(695, 0, 70, 70);
  
  popMatrix();
}

void NeptunePath() {
  strokeWeight(1* NeptuneH);
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
  strokeWeight(3 * MuteH);
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
  strokeWeight(3 * PauseH);
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
  strokeWeight(3 * FFH);
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

//Mercury
float MercuryXCalc (float rad) {
  MercuryX = (float) Math.cos(rad) * 105;
  return MercuryX;
}

float MercuryYCalc (float rad) {
  MercuryY = (float) Math.sin(rad) * 105;
  return MercuryY;
}

//Venus
float VenusXCalc (float rad) {
  VenusX = (float) Math.cos(rad) * 160;
  return VenusX;
}

float VenusYCalc (float rad) {
  VenusY = (float) Math.sin(rad) * 160;
  return VenusY;
}

//Calculate Earths coordinates in order to make it a button
float EarthXCalc (float rad) {  
  EarthX = (float) Math.cos(rad) * 230;
  return EarthX;
}

float EarthYCalc (float rad) {
  EarthY = (float) Math.sin(rad) * 230;
  return EarthY;
}

//Mars
float MarsXCalc (float rad) {
  MarsX = (float) Math.cos(rad) * 300;
  return MarsX;
}

float MarsYCalc (float rad) {
  MarsY = (float) Math.sin(rad) * 300;
  return MarsY;
}

//Jupiter
float JupiterXCalc (float rad) {
  JupiterX = (float) Math.cos(rad) * 400;
  return JupiterX;
}

float JupiterYCalc (float rad) {
  JupiterY = (float) Math.sin(rad) * 400;
  return JupiterY;
}

//Saturn
float SaturnXCalc (float rad) {
  SaturnX = (float) Math.cos(rad) * 515;
  return SaturnX;
}

float SaturnYCalc (float rad) {
  SaturnY = (float) Math.sin(rad) * 515;
  return SaturnY;
}

//Uranus
float UranusXCalc (float rad) {
  UranusX = (float) Math.cos(rad) * 610;
  return UranusX;
}

float UranusYCalc (float rad) {
  UranusY = (float) Math.sin(rad) * 610;
  return UranusY;
}

//Neptune
float NeptuneXCalc (float rad) {
  NeptuneX = (float) Math.cos(rad) * 695;
  return NeptuneX;
}

float NeptuneYCalc (float rad) {
  NeptuneY = (float) Math.sin(rad) * 695;
  return NeptuneY;
}
//==============================================================================
//===================== PLANET TEXT BOXES ======================================

//Sources:
//https://www.universetoday.com/36649/planets-in-order-of-size/
//https://solarsystem.nasa.gov/resources/681/solar-system-temperatures/
//https://www.universetoday.com/15462/how-far-are-the-planets-from-the-sun/

void SunText(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  strokeWeight(15);
  stroke(225);
  fill(255);
  
  rect(0, 0, 400, 300, 0, 50, 50, 50);
  
  rect(200, 25, 150, 150);
  
  image(SunImg, 200, 25, 150, 150);
  
  fill(0);
  text("The Sun", 100, 50);
  
  textSize(20);
  text("Size: 700k km", 100, 100);
  text("Temp: Hot", 100, 150);
  text("Distance From Sun: ???", 200, 200);
  
  image(NoImg, 50, 225, 50, 50);
  
  popMatrix();
}

void MercuryText(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  strokeWeight(15);
  stroke(225);
  fill(255);
  
  rect(0, 0, 400, 300, 0, 50, 50, 50);
  
  rect(200, 25, 150, 150);
  
  image(MercuryImg, 200, 25, 150, 150);
  
  fill(0);
  text("Mercury", 100, 50);
  
  textSize(20);
  text("Size: 2,440km", 100, 100);
  text("Temp: 125°C", 100, 150);
  text("Distance From Sun: 57mil km", 200, 200);
  
  text("~58d rotation", 200, 250);
  
  popMatrix();
}

void VenusText(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  strokeWeight(15);
  stroke(225);
  fill(255);
  
  rect(0, 0, 400, 300, 0, 50, 50, 50);
  
  rect(200, 25, 150, 150);
  
  image(VenusImg, 200, 25, 150, 150);
  
  fill(0);
  text("Venus", 100, 50);
  
  textSize(20);
  text("Size: 6,052km", 100, 100);
  text("Temp: 471°C", 100, 150);
  text("Distance From Sun: 108mil km", 200, 200);
  
  text("Neither shocking nor blue :/", 200, 250);
  
  popMatrix();
}


//======= Reference/Template ========
void EarthText(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  strokeWeight(15);
  stroke(225);
  fill(255);
  
  rect(0, 0, 400, 300, 0, 50, 50, 50);
  
  //Photo border
  rect(200, 25, 150, 150);
  
  //Photo of Earth
  image(EarthImg, 200, 25, 150, 150);
  
  //Title
  fill(0);
  text("Earth", 100, 50);
  
  //Desc.
  textSize(20);
  text("Size: 6,371km", 100, 100);
  text("Temp: 16°C", 100, 150);
  text("Distance From Sun: 150mil km", 200, 200);
  
  //Extra
  text("7.8/10 - Too much water", 200, 250);
  
  
  popMatrix();
}

void MarsText(float x, float y){
  pushMatrix();
  translate(x, y);
  
  strokeWeight(15);
  stroke(225);
  fill(255);
  
  rect(0, 0, 400, 300, 0, 50, 50, 50);
  
  rect(200, 25, 150, 150);
  
  image(MarsImg, 200, 25, 150, 150);
  
  fill(0);
  text("Mars", 100, 50);
  
  textSize(20);
  text("Size: 3,390km", 100, 100);
  text("Temp: -28°C", 100, 150);
  text("Distance From Sun: 228mil km", 200, 200);
  
  text("Population: 0", 200, 250);
  
  popMatrix();
}

void JupiterText(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  strokeWeight(15);
  stroke(225);
  fill(255);
  
  rect(0, 0, 400, 300, 0, 50, 50, 50);
  
  rect(200, 25, 150, 150);
  
  image(JupiterImg, 200, 25, 150, 150);
  
  fill(0);
  text("Jupiter", 100, 50);
  
  textSize(20);
  text("Size: 69,911km", 100, 100);
  text("Temp: -108°C", 100, 150);
  text("Distance From Sun: 779mil km", 200, 200);
  
  text("Biggest planet", 200, 250);
    
  popMatrix();
}

void SaturnText(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  strokeWeight(15);
  stroke(225);
  fill(255);
  
  if (SaturnXFlip == 1) {
    rect(0, 0, 400, 300, 0, 50, 50, 50);
  } else if (SaturnXFlip == -1) {
    rect(0, 0, -400, 300, 50, 0, 50, 50);
  }
  
  rect(200 * SaturnXFlip, 25, 150 * SaturnXFlip, 150);
  
  image(SaturnImg, 200 * SaturnXFlip, 25, 150 * SaturnXFlip, 150);
  
  fill(0);
  text("Saturn", 100 * SaturnXFlip, 50);
  
  textSize(20);
  text("Size: 58,232km", 100 * SaturnXFlip, 100);
  text("Temp: -138°C", 100 * SaturnXFlip, 150);
  text("Distance From Sun: 1.43bil km", 200 * SaturnXFlip, 200);
  
  text("Just has a nice ring to it", 200 * SaturnXFlip, 250);
  
  popMatrix();
}

void UranusText(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  strokeWeight(15);
  stroke(225);
  fill(255);
  
  if (UranusXFlip == 1) {
    rect(0, 0, 400, 300, 0, 50, 50, 50);
  } else if (UranusXFlip == -1) {
    rect(0, 0, -400, 300, 50, 0, 50, 50);
  }
  
  rect(200 * UranusXFlip, 25, 150 * UranusXFlip, 150);
  
  image(UranusImg, 200 * UranusXFlip, 25, 150 * UranusXFlip, 150);
  
  fill(0);
  text("Uranus", 100 * UranusXFlip, 50);
  
  textSize(20);
  text("Size: 25,362km", 100 * UranusXFlip, 100);
  text("Temp: -195°C", 100 * UranusXFlip, 150);
  text("Distance From Sun: 2.88bil km", 200 * UranusXFlip, 200);
  
  text("Hehehehehehehehehehe", 200 * UranusXFlip, 250);
  
  popMatrix();
}

void NeptuneText(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  strokeWeight(15);
  stroke(225);
  fill(255);
  
  if (NeptuneXFlip == 1) {
    rect(0, 0, 400, 300, 0, 50, 50, 50);
  } else if (NeptuneXFlip == -1) {
    rect(0, 0, -400, 300, 50, 0, 50, 50);
  }
  
  rect(200 * NeptuneXFlip, 25, 150 * NeptuneXFlip, 150);
  
  image(NeptuneImg, 200 * NeptuneXFlip, 25, 150 * NeptuneXFlip, 150);
  
  fill(0);
  text("Neptune", 100 * NeptuneXFlip, 50);
  
  textSize(20);
  text("Size: 24,622km", 100 * NeptuneXFlip, 100);
  text("Temp: -201°C", 100 * NeptuneXFlip, 150);
  text("Distance From Sun: 4.5bil km", 200 * NeptuneXFlip, 200);
  
  //No one cares about neptune lol
  
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

  //Sun
  if (dist(700, 700, mouseX, mouseY) < 75) {
    SunCheck = 1;
  } else if (dist(700, 700, mouseX, mouseY) > 75) {
    SunCheck = 0;
  }

  //Mercury
  if (dist(MercuryX, MercuryY, mouseX - 700, mouseY - 700) < 17.5) {
    MercuryCheck = 1;
  } else if (dist(MercuryX, MercuryY, mouseX - 700, mouseY - 700) > 17.5) {
    MercuryCheck = 0;
  }
  
  //Venus
  if (dist(VenusX, VenusY, mouseX - 700, mouseY - 700) < 25) {
    VenusCheck = 1;
  } else if (dist(VenusX, VenusY, mouseX - 700, mouseY - 700) > 25) {
    VenusCheck = 0;
  }
  
  //Earth
  if (dist(EarthX, EarthY, mouseX - 700, mouseY - 700) < 27.5) {
    EarthCheck = 1;
  } else if (dist(EarthX, EarthY, mouseX - 700, mouseY - 700) > 27.5) {
    EarthCheck = 0;
  }
  
  //Mars
  if (dist(MarsX, MarsY, mouseX - 700, mouseY - 700) < 28.5) {
    MarsCheck = 1;
  } else if (dist(MarsX, MarsY, mouseX - 700, mouseY - 700) > 28.5) {
    MarsCheck = 0;
  }
  
  //Jupiter
  if (dist(JupiterX, JupiterY, mouseX - 700, mouseY - 700) < 55) {
    JupiterCheck = 1;
  } else if (dist(JupiterX, JupiterY, mouseX - 700, mouseY - 700) > 55) {
    JupiterCheck = 0;
  }
  
  //Saturn
  if (dist(SaturnX, SaturnY, mouseX - 700, mouseY - 700) < 47.5) {
    SaturnCheck = 1;
  } else if (dist(SaturnX, SaturnY, mouseX - 700, mouseY -700) > 47.5) {
    SaturnCheck = 0;
  }
  
  //Uranus
  if (dist(UranusX, UranusY, mouseX - 700, mouseY - 700) < 37.5) {
    UranusCheck = 1;
  } else if (dist(UranusX, UranusY, mouseX - 700, mouseY - 700) > 37.5) {
    UranusCheck = 0;
  }
  
  //Neptune
  if (dist(NeptuneX, NeptuneY, mouseX - 700, mouseY - 700) < 35) {
    NeptuneCheck = 1;
  } else if (dist(NeptuneX, NeptuneY, mouseX - 700, mouseY - 700) > 35) {
    NeptuneCheck = 0;
  }
}
