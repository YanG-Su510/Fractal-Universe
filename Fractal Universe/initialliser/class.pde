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
    while (a*a + b*b <= 4 && iteration <= max+1) {
      float a_new = a*a - b*b + re;
      b = 2*a*b + im;
      a = a_new;
      iteration++;
    }
    //stroke(iteration, iteration, 0);
    mandColor(iteration);
    //if (iteration < max) point(x, y);
    point(x, y);
  }
  
  void update() {
    //float randomLevel = 10;
    re = (float)( center.x + (x - width/2) * pixelSize );// + random(-randomLevel*pixelSize, randomLevel*pixelSize);
    im = (float)( center.y + (y - height/2) * pixelSize );// + random(-randomLevel*pixelSize, randomLevel*pixelSize);
  }
}

void update() {
    float zoomSpeed = 0.9999999;  // shoud be < 1
    if (pixelSize > 1.04E-5) pixelSize *= zoomSpeed;
    if (mousePressed) println("pixelSize = " + pixelSize);
}

void mandColor(int iter) {
  if (iter > 0 && iter <= 5) {
    stroke(map(iter, 0, 5, 0, 60));
  } else if (iter > 5 && iter <= 10) {
    stroke(map(iter, 5, 10, 60, 100));
  } else if (iter > 10 && iter <= 15) {
    stroke(120);
  } else if (iter > 15 && iter <= 20) {
    stroke(140);
  } else if (iter > 20 && iter <= 25) {
    stroke(160);
  } else if (iter > 25 && iter <= 30) {
    stroke(180);
  } else if (iter > 30 && iter <= 35) {
    stroke(200);
  } else if (iter > 35 && iter <= 40) {
    stroke(210);
  } else if (iter > 40 && iter <= 45) {
    stroke(220);
  } else if (iter > 45 && iter <= 50) {
    stroke(230);
  
  } else if (iter > max) {
    stroke(0, random(0, 255), map(iter, 0, max, 0, 128));
  } else {
    stroke(map(iter, 50, max, 10, 255));
  }
}
