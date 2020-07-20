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
    point(x, y);
  }
  
  // update this pixel using defined velocity
  void update() {
    x += xv;
    y += yv;
  }
  
  // go through other dots checking their distance and update speed
  void speedCheck() {
    float dis, nearest = socialDist;
    for (int i = 0; i < dots.size(); i++) {
      dis = dist( dots.get(i).x, dots.get(i).y, x, y);
      // if some dot is not far from here enough
      if ( dis < nearest && dis != 0) {
        nearest = dis;
        if (x - dots.get(i).x > 0) {
          xv = 1;
        } else if (x == dots.get(i).x) {
          xv = 0;
        } else {
          xv = -1;
        }
        if (y > dots.get(i).y) {
          yv = abs(dots.get(i).y - y) / abs(dots.get(i).x - x);
        } else {
          yv = -abs(dots.get(i).y - y) / abs(dots.get(i).x - x);
        }
      }
      // if reach boundary
    }
    if (x <= 0 || x >= width) xv = -xv;
    if (y <= 0 || y >= height) yv = -yv;
  }
  
  // go back to its original position
  void goHome() {
    if (x != ox && y!= oy) {
      if (x - ox > 0) {
        xv = -1;
      } else if (x == ox) {
        xv = 0;
      } else {
        xv = 1;
      }
      if (y > oy) {
        yv = - abs(oy - y) / abs(ox - x);
      } else {
        yv = abs(oy - y) / abs(ox - x);
      }
    }
    if (x <= 0 || x >= width) xv = -xv;
    if (y <= 0 || y >= height) yv = -yv;
  }
}
