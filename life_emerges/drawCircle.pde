void drawCircle() {
   translate(width/2, height/2);

  scale(r_scale); 
  stroke(0);
  ellipse(0, 0, 50, 50);

  // Increase the scale variable
  r_scale += 0.2;

  // Retstart r
  if (r_scale > 20) {
    r_scale = 0;
  }
}