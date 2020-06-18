int x, y;
boolean endRound = true;

void setup() {
  size(500, 500);
  frameRate(120);
  background(255);
}

void draw() {
  if (endRound) {
    
    x = (int)random(0, width);
    y = (int)random(0, height);
  }
  
  stroke(0);
  
  if ( !ifEdge(x, y) && aroundPixelAva(x, y) )
    point(x, y);
  PVector next = findNext(x, y);
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
  } else if ( readPixel(x-1, y) == white ) {
    out = true;
  } else if ( readPixel(x+1, y) == white ) {
    out = true;
  } else if ( readPixel(x, y-1) == white ) {
    out = true;
  } else if ( readPixel(x, y+1) == white ) {
    out = true;
  }
  println("AaroundPixelAva:" + out);
  return out;
}

boolean ifEdge(int x, int y) {
  boolean out = false;
  if (x == 0 || x == width-1 || y == 0 || y == height-1)
    out = true;
  return out;
}

PVector findNext(int x, int y) {
  PVector out = new PVector(-1, -1);
  int dice = round(random(0.5, 4.5));
  switch (dice) {
    case 1:
      if ( !ifEdge(x-1, y) && aroundPixelAva(x-1, y) ) {
        out.x = x-1.0;
        out.y = y;
      }
      break;
    case 2:
      if ( !ifEdge(x+1, y) && aroundPixelAva(x+1, y) ) {
        out.x = x+1.0;
        out.y = y;
      }
      break;
    case 3:
      if ( !ifEdge(x, y-1) && aroundPixelAva(x, y-1) ) {
        out.x = x;
        out.y = y-1.0;
      }
      break;
    case 4:
      if ( !ifEdge(x, y+1) && aroundPixelAva(x, y+1) ) {
        out.x = x;
        out.y = y+1.0;
      }
  }
  println("next: " + x + "\t" + y);
  return out;
}
