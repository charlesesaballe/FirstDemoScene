  void solar_system() {
  


  // Translate to center of window to draw the sun.
  translate(width/2, height/2);
  noStroke();
  fill(255, 200, 50);
  ellipse(0, 0, 300, 300);

  // The earth rotates around the sun
  pushMatrix();
  rotate(theta);
  translate(300, 200);
  fill(50, 200, 255);
  ellipse(0, 0, 100, 100);

  // Moon #1 rotates around the earth
  // pushMatrix() is called to save the transformation state before drawing moon #1. 
  // This way we can pop and return to earth before drawing moon #2. 
  // Both moons rotate around the earth (which itself is rotating around the sun).
  pushMatrix(); 
  rotate(-theta*4);
  translate(100, 50);
  fill(50, 255, 200);
  ellipse(0, 0, 50, 50);
  popMatrix();

  // Moon #2 also rotates around the earth
  pushMatrix();
  rotate(theta*2);
  translate(150, 30);
  fill(50, 255, 200);
  ellipse(0, 0, 20, 20);
  popMatrix();

  popMatrix();

  theta += 0.01;
}