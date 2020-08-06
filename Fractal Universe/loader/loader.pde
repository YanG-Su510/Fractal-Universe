/**
  Author:   YanG-Su510
  Version:  Build 0717
  Libararies:
    oscP5      Andreas Schlegel
    PixelFlow  Thomas Diewald
**/

import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import processing.core.PApplet;
import processing.opengl.PGraphics2D;
///////////////////////////////////////////////////////////////////////////////////
// GLOBAL VARIABLES
float   FPS = 60;
int     stage = 0;
int     bound = 220;        // color bound of picking pixels, recommend bigger than 90
float   socialDist = 10;   // keep social distance

DwPixelFlow context;
PGraphics2D parti;

// stage variables
  // stage 0
  PImage[] startup = new PImage[248];
  PImage pic;
  float fps_s1 = FPS;
  int start_index = 247;    // use 
  //stage 1
  ArrayList<pix> dots = new ArrayList<pix>();
  float choice;
  
// CHLADNI FIGURE
  float a = 0, n = 2, m = 7, b = 1;
  float aa = 0.1;

///////////////////////////////////////////////////////////////////////////////////
// MAIN
void settings() {
  size(1200, 1200, P2D);
  smooth(0);
}

void setup() {
  // main library context
  DwPixelFlow context = new DwPixelFlow(this);
  context.print();
  context.printGL();
  
  // Render
  parti = (PGraphics2D) createGraphics(width, height, P2D);
  parti.smooth(0);
  //frameRate(FPS);
  
  // oscP5
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
  
  // load frames
  imageMode(CENTER);
  //for (int i = 001; i <= 248; i++) startup[i-1] = loadImage("mand_"+ i +".png");
  pic = loadImage("mand_248.png");
}

void draw() {
  parti.beginDraw();
  parti.fill(0, 50);
  parti.rect(0,0,width,height);
  
  // stage switcher
  switch (stage) {
    
    // The stage of startup
    case 0:
      /*if (start_index >= 247) {
        image(startup[247],width/2,height/2,width,height);
        frameRate(FPS);
        scanDots();
        stage = 1;
      }
      startup(start_index);
      if (start_index < 247) start_index++;*/
      image(pic,width/2,height/2,width,height);
      scanDots();
      stage = 1;
      break;
    
    // The stage of getting non-black/grey pixels to perform
    case 1:
      for (int i = 0; i < dots.size(); i++) {
        if (mousePressed) {
          send(-1);
          if (choice < 5) {
            // touch - drag
            dots.get(i).x += (mouseX - pmouseX);
            dots.get(i).y += (mouseY - pmouseY);
            if (dots.get(i).x < 0) dots.get(i).x = 0;
            if (dots.get(i).y < 0) dots.get(i).y = 0;
            if (dots.get(i).x > width) dots.get(i).x = width;
            if (dots.get(i).y > height) dots.get(i).y = height;
          } else {
            // touch - spread
            dots.get(i).withdrawMouse(50);
          }
          dots.get(i).edgeCheck();
        } else {
          send(i);
          PVector sn = engage(dots.get(i).x, dots.get(i).y, i % width, height/2 * sin(float(i)/100 + b) + height/2);
          dots.get(i).xv = sn.x;
          dots.get(i).yv = sn.y;
          if (b <= 314) b++; else b = 1;
          dots.get(i).edgeCheck();
        }
        dots.get(i).update();
        dots.get(i).build();
      }
      break;
  }
  // end stage switcher
  parti.endDraw();
  
  // display
  blendMode(REPLACE);
  image(parti, width/2, height/2);
}

///////////////////////////////////////////////////////////////////////////////////
// EXTENSION
void mousePressed() {
  choice = random(0,10);
}

void mouseReleased() {
  for (int i = 0; i < dots.size(); i++) {
    dots.get(i).xv = random(-1,1);
    dots.get(i).yv = random(-1,1);
  }
}
