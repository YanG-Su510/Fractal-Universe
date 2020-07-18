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
