int max = 1000;                                 // (used for iteration in class Complex)
PVector center = new PVector(-0.737, -0.208);  // define the center you want (default -0.737, -0.208)
float pixelSize = 0.001;                       // define mathematical size of one pixel for animation

ArrayList<Complex> cood = new ArrayList<Complex>();

void setup() {
  size(500, 500);
  noSmooth();
  frameRate(60);
  for(int col = 0; col < width; col++) {
    for(int row = 0; row < height; row++) {
      cood.add(new Complex(col, row));
    }
  }
  
  
}

void draw() {
  background(0);
  
  for(int i = 0; i < cood.size(); i++) {
    cood.get(i).mandel();
    cood.get(i).update();
    update();
  }
  
  fill(255,0,0);
  circle(width/2, height/2, 5);
  
  if (pixelSize < 2.62E-9) pixelSize = 1;
}
