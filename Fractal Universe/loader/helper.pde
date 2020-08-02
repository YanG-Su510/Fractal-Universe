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
  float dist = dist(x, y, t_x, t_y);
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
  return new PVector(dist/100 * vx, dist/100 * vy);
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

// Chladni Figure Check
boolean chladni(float x, float y) {
  if (a <= -10 || a >= 10) aa = -aa;
  a += aa;
  if (a * sin(PI*n*x) * sin(PI*m*y) + b * sin(PI*m*x) * sin(PI*n*y) == 0) return true;
  //if (roundZero(a * sin(PI*n*x) * sin(PI*m*y) + b * sin(PI*m*x) * sin(PI*n*y))) return true;
  return false;
}

boolean roundZero(float n) {
  float rz = 0.00000005;
  if ( n > (0-rz) && n < (rz) ) return true;
  return false;
}

// Sine Wave Check
