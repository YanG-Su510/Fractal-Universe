/**
  Author:   YanG-Su510
  Version:  Build 0717
**/

///////////////////////////////////////////////////////////////////////////////////
// GLOBAL VARIABLES
float   FPS = 60;
int     stage = 0;
int     bound = 100;        // color bound of picking pixels, recommend bigger than 90
float   socialDist = 10;   // keep social distance

// stage variables
  // stage 0
  PImage[] startup = new PImage[248];
  int start_index = 0;
  //stage 1
  ArrayList<pix> dots = new ArrayList<pix>();

///////////////////////////////////////////////////////////////////////////////////
// MAIN
void setup() {
  size(500, 500);
  frameRate(FPS);
  // load frames
  for (int i = 001; i <= 248; i++) startup[i-1] = loadImage("mand_"+ i +".png");
}

void draw() {
  background(0, 50);
  
  // stage switcher
  switch (stage) {
    
    // The stage of startup
    case 0:
      if (start_index >= 247) {
        image(startup[247],0,0);
        scanDots();
        stage = 1;
      }
      startup(start_index);
      if (start_index < 247) start_index++;
      break;
    
    // The stage of getting non-black/grey pixels to perform
    case 1:
      for (int i = 0; i < dots.size(); i++) {
        //println("UPDATING A PIXEL");
        dots.get(i).speedCheck();
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
  color mouse = get(mouseX, mouseY);
  int b = mouse & 0xFF;
  int g = mouse & 0xFF00 >> 8;
  int r = mouse & 0xFF0000 >> 16;
  println(r + "\t" + g + "\t" + b);
}
