void oscillate() {

  float x = (sin(theta) + 1) * width/2; 

  // With each cycle, increment theta
  theta += 0.05;
  // Draw the ellipse at the value produced by sine
  fill(random(255),random(255),random(255));
  stroke(255);
  strokeWeight(5);
  line(width/2, 0, x, height/2);
  ellipse(x, height/2, 200, 200);
}