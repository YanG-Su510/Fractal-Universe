// This file contains main functions for each process of stage

// go through current screen to get pixels needed into array
void scanDots() {
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    if (colorExtract(pixels[i]).x > bound && colorExtract(pixels[i]).y > bound && colorExtract(pixels[i]).z > bound) {
      dots.add( new pix( pixIndex(i).x, pixIndex(i).y, pixels[i] ) );
    }
  }
}

// osc
void oscEvent(OscMessage theOscMessage) {
  // osc core
}
