class Complex {
  float x, y;
  float re, im;
  
  Complex(float _x, float _y) {
    x = _x;
    y = _y;
    re = (float)( center.x + (x - width/2) * pixelSize );
    im = (float)( center.y + (y - height/2) * pixelSize );
  }
  
  // This function is a widely used one for 
  // calculating if a complex number is within Mandelbrot
  void mandel() {
    float a = 0, b = 0;
    int iteration = 0;
    while (a*a + b*b <= 4 && iteration < max) {
      float a_new = a*a - b*b + re;
      b = 2*a*b + im;
      a = a_new;
      iteration++;
    }
    stroke(iteration, iteration, 0);
    if (iteration < max) point(x, y);
  }
  
  void update() {
    float randomLevel = 10;
    re = (float)( center.x + (x - width/2) * pixelSize ) + random(-randomLevel*pixelSize, randomLevel*pixelSize);
    im = (float)( center.y + (y - height/2) * pixelSize ) + random(-randomLevel*pixelSize, randomLevel*pixelSize);
  }
}

void update() {
    float zoomSpeed = 0.9999999;  // shoud be < 1
    pixelSize *= zoomSpeed;
    if (mousePressed) println("pixelSize = " + pixelSize);
}
