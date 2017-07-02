
void shootingStar() {
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  // i link the value of the speed variable to the mouse position.
  for ( int x=0; x<width;x++){
  speed = map(x, 0, width, 0, 20);
  }
  
  // I shift the entire composition,
  // moving its center from the top left corner to the center of the canvas.
  translate(width/2, height/2);
  // I draw each star, running the "update" method to update its position and
  // the "show" method to show it on the canvas.
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
}