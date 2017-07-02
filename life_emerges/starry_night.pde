void starrynight (){
  fill(0,10);
  rect(0,0,width, height);
  fill(255);
  ellipse(random(width), random(height), 20, 20);
  
}

void comet(float x,float y){
  ellipse(x, y, random(30,50), random(30,50));
  ellipse(x/2, y/2, random(30,50), random(30,50));
  ellipse(x+100, y-200, random(60,90), random(60,90));
}