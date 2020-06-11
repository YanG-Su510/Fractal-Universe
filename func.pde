void generate(int size, int x, int y) {
  
  noStroke();
  //stroke(255);
  fill(noise(x,y,phase)*150, noise(x+10,y+10,phase+1)*50, noise(x+20,y+20,phase+2)*50);
  
  pushMatrix();
    translate(x*size, y*size);
    square(0, 0, size);
  popMatrix();
}
