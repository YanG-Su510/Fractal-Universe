/**
  Author:   YanG-Su510
  Version:  Build 0717
**/
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;
///////////////////////////////////////////////////////////////////////////////////
// GLOBAL VARIABLES
float   FPS = 60;
int     stage = 0;
int     bound = 170;        // color bound of picking pixels, recommend bigger than 90
float   socialDist = 10;   // keep social distance

// stage variables
  // stage 0
  PImage[] startup = new PImage[248];
  float fps_s1 = FPS;
  int start_index = 247;    // use 
  //stage 1
  ArrayList<pix> dots = new ArrayList<pix>();
  float choice;

///////////////////////////////////////////////////////////////////////////////////
// MAIN
void setup() {
  size(1200, 1200);
  frameRate(FPS);
  oscP5 = new OscP5(this,12000);
  // load frames
  imageMode(CENTER);
  for (int i = 001; i <= 248; i++) startup[i-1] = loadImage("mand_"+ i +".png");
}

void draw() {
  fill(0, 50);
  rect(0,0,width,height);
  
  // stage switcher
  switch (stage) {
    
    // The stage of startup
    case 0:
      if (start_index >= 247) {
        image(startup[247],width/2,height/2,width,height);
        frameRate(FPS);
        scanDots();
        stage = 1;
      }
      startup(start_index);
      if (start_index < 247) start_index++;
      break;
    
    // The stage of getting non-black/grey pixels to perform
    case 1:
      frameRate(FPS);
      for (int i = 0; i < dots.size(); i++) {
        //println("UPDATING A PIXEL");
        if (mousePressed) {
          
          if (choice < 3) {
            // touch 1
            dots.get(i).goHome();
          }
          else if (choice > 3 && choice < 6) {
            // touch 2
            dots.get(i).x += (mouseX - pmouseX);
            dots.get(i).y += (mouseY - pmouseY);
            if (dots.get(i).x < 0) dots.get(i).x = 0;
            if (dots.get(i).y < 0) dots.get(i).y = 0;
            if (dots.get(i).x > width) dots.get(i).x = width;
            if (dots.get(i).y > height) dots.get(i).y = height;
          } else {
            dots.get(i).edgeCheck();
            dots.get(i).withdrawMouse(50);
          }
        
      } else {
          dots.get(i).edgeCheck();
        }
        dots.get(i).update();
        dots.get(i).build();
      }
      break;
    
  }
  // end stage switcher
  
}

///////////////////////////////////////////////////////////////////////////////////
// EXTENSION
void mousePressed() {
  /*color mouse = get(mouseX, mouseY);
  int b = mouse & 0xFF;
  int g = mouse & 0xFF00 >> 8;
  int r = mouse & 0xFF0000 >> 16;
  println(r + "\t" + g + "\t" + b);*/
  
  choice = random(0,10);
}

void mouseReleased() {
  for (int i = 0; i < dots.size(); i++) {
    dots.get(i).xv = random(-1,1);
    dots.get(i).yv = random(-1,1);
  }
}
