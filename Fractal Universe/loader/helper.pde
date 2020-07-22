// This file contains some helpful help functions that could be used
// several times if needed

// single index of pixel ID ==> 2-element vector with x & y coordinates
PVector pixIndex(int index) {
  PVector cood = new PVector(index % width, index / width);
  return cood;
}

// color ==> 3-element vector with RGB valure
// be replaced by red(), green(), blue() calls
PVector colorExtract(color todo) {
  int b = todo & 0xFF;
  int g = todo & 0xFF00 >> 8;
  int r = todo & 0xFF0000 >> 16;
  PVector get = new PVector( r, g, b );
  return get;
}

// Current dot x & y, target dot x & y ==> x & y velocity
PVector engage(float x, float y, float t_x, float t_y) {
  float disx = abs(t_x - x);
  float disy = abs(t_y - y);
  float vx, vy;
  if (disx > disy) {
    vx = 1;
    if (t_x < x) vx *= -1;
    vy = disy/disx;
    if (t_y < y) vy *= -1;
  } else {
    vy = 1;
    if (t_y < y) vy *= -1;
    vx = disx/disy;
    if (t_x < x) vx *= -1;
  }
  return new PVector(vx, vy);
}

PVector withdraw(float x, float y, float t_x, float t_y) {
  float disx = abs(t_x - x);
  float disy = abs(t_y - y);
  float vx, vy;
  if (disx > disy) {
    vx = -1;
    if (t_x < x) vx *= -1;
    vy = -disy/disx;
    if (t_y < y) vy *= -1;
  } else {
    vy = -1;
    if (t_y < y) vy *= -1;
    vx = -disx/disy;
    if (t_x < x) vx *= -1;
  }
  return new PVector(vx, vy);
}
