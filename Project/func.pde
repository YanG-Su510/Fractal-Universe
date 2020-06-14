void generate(float size, float x, float y) {
  
  float ratio = 15.5;
  int particle = round(random(0,500));
  
  float distance = dist(x*size-size/2,y*size-size/2,mouseX,mouseY);
  
  pushMatrix();
  
    translate(x*size, y*size);
    noStroke();
    //stroke(255);
    //fill(noise(x,y,phase)*150, noise(x,y,phase)*50, noise(x+20,y+20,phase)*50);
    fill(noise((float)x/ratio+phase,(float)y/ratio+phase,phase)*150, noise((float)x/ratio+phase,(float)y/ratio+phase,phase)*150, noise((float)x/ratio+phase,(float)y/ratio+phase,phase)*150);
    square(0, 0, size);
    
    if (distance < 200 && distance > 60 && particle == 1) {    // Drawing Particles
      fill(255,255,0,50);
      square(0, 0, size);
    } else if (distance < 20) {
      fill(200-2*distance,200-2*distance,0,200);               // Drawing Central Circle
      square(0, 0, size);
    }
      
    
  popMatrix();
}
