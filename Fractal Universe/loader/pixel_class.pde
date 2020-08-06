class pix {
  // current position
  float x;
  float y;
  // original position
  float ox;
  float oy;
  // color
  color co;
  // speed
  float xv;
  float yv;
  
  // create this pixel with X Y and its color
  pix(float _x, float _y, color _co) {
    x = _x; y = _y; co = _co;
    ox = _x; oy = _y;
    xv = random(-1,1);
    yv = random(-1,1);
  }
  
  // draw this pixel
  void build() {
    parti.stroke(co);
    parti.fill(co);
    parti.circle(x, y, 2);
  }
  
  // update this pixel using defined velocity
  void update() {
    x += xv;
    y += yv;
  }
  
  void edgeCheck() {
    if (x <= 0 || x >= width) {
      if (random(100) < 10) co = color(frameCount % 255,(frameCount/FPS)%255,0);
      else if (random(100) < 10) co = color(255);
      xv = -xv;
    }
    if (y <= 0 || y >= height) {
      send(-2);
      if (random(100) < 10) co = color(frameCount % 255,(frameCount/FPS)%255,0);
      else if (random(100) < 10) co = color(255);
      yv = -yv;
    }
  }
  
  // go back to its original position
  void goHome() {
    PVector velo = engage(x, y, ox, oy);
    xv = velo.x;
    yv = velo.y;
  }
  
  // go away from mouse click
  void withdrawMouse(float dis) {
    if ( dist(x, y, mouseX, mouseY) < dis ) {
      PVector velo = withdraw(x, y, mouseX, mouseY);
      xv = velo.x;
      yv = velo.y;
    }
  }
}
