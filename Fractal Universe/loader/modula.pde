// This file contains main functions for each process of stage

// stage 0
// loads mand renders in first few seconds
void startup(int index) {
  image(startup[index],width/2,height/2,width,height);
  //if (FPS > 30) FPS -= 0.5;
  if (frameCount > 200 && fps_s1 > 5) fps_s1--;
  frameRate(fps_s1);
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

// osc
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  println(theOscMessage.addrPattern() + theOscMessage.get(0));
}
