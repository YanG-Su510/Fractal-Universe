/**
  Author:   YanG-Su510
  Version:  Build 0812
  Libararies:
    oscP5      Andreas Schlegel
    TUIO       Martin Kaltenbrunner
      get: <http://reactivision.sourceforge.net/#files>
**/

import TUIO.*;
///////////////////////////////////////////////////////////////////////////////////
// GLOBAL VARIABLES
float   FPS = 60;
int     bound = 130;        // color bound of picking pixels, recommend bigger than 120

// LIBARARY ENTRY
TuioProcessing tuioClient;

// stage variables
  // stage 0
  PImage pic;
  //stage 1
  ArrayList<pix> dots = new ArrayList<pix>();
  ArrayList<TuioCursor> tobjList = new ArrayList<TuioCursor>();
  float choice;
  boolean touch = false;
  PVector pcursor = new PVector(width/2, height/2);
  
// MATH FIGURE
  float b = 1;

///////////////////////////////////////////////////////////////////////////////////
// MAIN
void setup() {
  size(1200, 1200, P2D);
  frameRate(60);
  smooth(0);
  
  // TUIO
  tuioClient  = new TuioProcessing(this);
  
  // oscP5
  oscP5 = new OscP5(this, 25577);
  myRemoteLocation = new NetAddress("127.0.0.1", 25577);
  
  // load frames
  imageMode(CENTER);
  pic = loadImage("mand_248.png");
  
  image(pic,width/2,height/2,width,height);
  scanDots();
}

void draw() {
  fill(0, 50);
  rect(0,0,width,height);
  
  tobjList = tuioClient.getTuioCursorList();
  
  // main calculation
  for (int i = 0; i < dots.size(); i++) {
    if (tobjList.size() > 0) {
      touch = true;
      //send(-1);
      if (tobjList.size() == 1) {
        // touch - drag
        dots.get(i).x += (tobjList.get(0).getScreenX(width) - pcursor.x);
        dots.get(i).y += (tobjList.get(0).getScreenY(height) - pcursor.y);
        if (dots.get(i).x < 0) dots.get(i).x = 0;
        if (dots.get(i).y < 0) dots.get(i).y = 0;
        if (dots.get(i).x > width) dots.get(i).x = width;
        if (dots.get(i).y > height) dots.get(i).y = height;
      } else {
        // touch - spread
        dots.get(i).withdrawMouse(50);
      }
      dots.get(i).edgeCheck();
      pcursor.x = tobjList.get(0).getScreenX(width);
      pcursor.y = tobjList.get(0).getScreenY(height);
    } else {
      touchReleased(false);
      touch = false;
      //send(i);
      PVector sn = engage(dots.get(i).x, dots.get(i).y, i % width, height/2 * sin(float(i)/100 + b) + height/2);
      dots.get(i).xv = sn.x;
      dots.get(i).yv = sn.y;
      if (b <= 314) b++; else b = 1;
      dots.get(i).edgeCheck();
    }
    dots.get(i).update();
    dots.get(i).build();
  }
}

///////////////////////////////////////////////////////////////////////////////////
// EXTENSION
void touchReleased(boolean now) {
  if (touch && !now) {
    for (int i = 0; i < dots.size(); i++) {
      dots.get(i).xv = random(-1,1);
      dots.get(i).yv = random(-1,1);
    }
  }
}
