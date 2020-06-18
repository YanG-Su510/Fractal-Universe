int x, y, direct = 1;
boolean endRound = true;

void setup() {
  size(500, 500);
  frameRate(512);
  background(255);
}

void draw() {
  if (endRound) {
    direct = 1;
    x = (int)random(0, width);
    y = (int)random(0, height);
  }
  
  stroke(0);
  
  if ( !ifEdge(x, y) && aroundPixelAva(x, y) )
    point(x, y);
  PVector next = findNext(x, y, direct);
  if (next.x != -1) {
    x = (int)next.x;
    y = (int)next.y;
    endRound = false;
  } else {
    endRound = true;
  }
  
  println(x + "\t" + y + "\t" + endRound);
  
}

// *********** Functions ***********
color readPixel(int x, int y) {
  loadPixels();
  return pixels[y*width + x];
}

boolean aroundPixelAva (int x, int y) {
  boolean out = false;
  color white = color(255,255,255);
  if ( readPixel(x, y) == white ) {
    out = true;
  } /* else if ( readPixel(x-1, y) == white ) {
    out = true;
  } else if ( readPixel(x+1, y) == white ) {
    out = true;
  } else if ( readPixel(x, y-1) == white ) {
    out = true;
  } else if ( readPixel(x, y+1) == white ) {
    out = true;
  }
  */
  println("AaroundPixelAva:" + out);
  return out;
}

boolean ifEdge(int x, int y) {
  boolean out = false;
  if (x == 0 || x == width-1 || y == 0 || y == height-1)
    out = true;
  return out;
}

PVector findNext(int x, int y, int dir) {
  PVector out = new PVector(-1, -1);
  println("Dir: " + dir);
  if ( dir == 1 && !ifEdge(x-1, y) && aroundPixelAva(x-1, y) ) {
    out.x = x-1.0;
    out.y = y;
    return out;
  } else if ( dir == 2 && !ifEdge(x, y-1) && aroundPixelAva(x, y-1) ) {
    out.x = x;
    out.y = y-1.0;
    return out;
  } else if ( dir == 3 && !ifEdge(x+1, y) && aroundPixelAva(x+1, y) ) {
    out.x = x+1.0;
    out.y = y;
    return out;
  } else if ( dir == 4 && !ifEdge(x, y+1) && aroundPixelAva(x, y+1) ) {
    out.x = x;
    out.y = y+1.0;
    return out;
  } else if (dir > 4) {
    return out; 
  }
  println("next: " + x + "\t" + y);
  return findNext(x, y, ++direct);
}
