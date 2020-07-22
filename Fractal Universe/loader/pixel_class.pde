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
    xv = 1;
    yv = 1;
  }
  
  // draw this pixel
  void build() {
    stroke(co);
    fill(co);
    circle(x, y, 2);
    //point(x, y);
  }
  
  // update this pixel using defined velocity
  void update() {
    x += xv;
    y += yv;
  }
  
  // go through other dots checking their distance and update speed
  void speedCheck(int curr_index) {
    float dis, nearest = socialDist;
    for (int i = 0; i < dots.size(); i++) {
      dis = dist( dots.get(i).x, dots.get(i).y, x, y);
      // if some dot is not far from here enough
      if ( dis < nearest && i != curr_index) {
        nearest = dis;
        PVector velo = withdraw(x, y, dots.get(i).x, dots.get(i).y);
        xv = velo.x;
        yv = velo.y;
      }
    }
    if (x <= 0 || x >= width) xv = -xv;
    if (y <= 0 || y >= height) yv = -yv;
  }
  
  // go back to its original position
  void goHome() {
    PVector velo = engage(x, y, ox, oy);
    xv = velo.x;
    yv = velo.y;
    if (x <= 0 || x >= width) xv = -xv;
    if (y <= 0 || y >= height) yv = -yv;
  }
}
