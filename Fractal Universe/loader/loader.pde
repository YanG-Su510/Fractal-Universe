float FPS = 30;
int stage = 0;

// stage variables
  // stage 0
  PImage[] startup = new PImage[248];
  int start_index = 0;
  //stage 1

void setup() {
  size(500, 500);
  frameRate(FPS);
  // load frames
  for (int i = 001; i <= 248; i++) startup[i-1] = loadImage("mand_"+ i +".png");
}

void draw() {
  background(0);
  
  switch (stage) {
    case 0:
      // The stage of startup
      startup(start_index);
      if (start_index < 247) start_index++;
      break;
    case 1:
      break;
  }
  
}
