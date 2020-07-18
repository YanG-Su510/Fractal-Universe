// This file contains main functions for each process of stage

// stage 0
// loads mand renders in first few seconds
void startup(int index) {
  image(startup[index], 0, 0);
  //if (FPS > 30) FPS -= 0.5;
  frameRate(FPS);
}

// stage 1
// go through current screen to get pixels needed into array
void scanDots() {
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    if (colorExtract(pixels[i]).x > bound && colorExtract(pixels[i]).y > bound && colorExtract(pixels[i]).z > bound) {
      dots.add( new pix( pixIndex(i).x, pixIndex(i).y, pixels[i] ) );
    }
  }
}
