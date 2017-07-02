void drawSquare() {
   translate(width/2, height/2);

  scale(r_scale); 

  // Display a rectangle in the middle of the screen
  stroke(0);
  fill(random(0,255));
  rectMode(CENTER);
  rect(0, 0, 50, 50);

  // Increase the scale variable
  r_scale += 0.2;

  // Retstart r
  if (r_scale > 20) {
    r_scale = 0;
  }
}