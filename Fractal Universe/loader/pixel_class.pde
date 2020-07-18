class pix {
  float x;
  float y;
  color co;
  float xv;
  float yv;
  
  // create this pixel with X Y and its color
  pix(float _x, float _y, color _co) {
    x = _x; y = _y; co = _co;
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
        yv = (dots.get(i).y - y) / (dots.get(i).x - x);
      }
      // if reach boundary
    }
    if (x <= 0 || x >= width) xv = -xv;
    if (y <= 0 || y >= height) yv = -yv;
  }
  
}
