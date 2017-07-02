
void setTeam(){
  
  spots = new ArrayList<PVector>();
  img = loadImage("purpledagger.png");
  img.loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int index = x + y * img.width;
      
      color c = img.pixels[index];
      float b = brightness(c);
      if (b > 1) {
        spots.add(new PVector(x,y));
      }
      
    } 
  }
  circles2 = new ArrayList<Circle2>();
}


void showTeam(){

  int total = 10;
  int count = 0;
  int attempts = 0;

  while (count <  total) {
    Circle2 newC = newCircle2();
    if (newC != null) {
      circles2.add(newC);
      count++;
    }
    attempts++;
    if (attempts > 1000) {
      noLoop();
      println("FINISHED");
      break;
    } 
  }


  for (Circle2 c : circles2) {
    if (c.growing) {
      if (c.edges()) {
        c.growing = false;
      } else {
        for (Circle2 other : circles2) {
          if (c != other) {
            float d = dist(c.x, c.y, other.x, other.y);
            if (d - 2 < c.r + other.r) {
              c.growing = false;
              break;
            }
          }
        }
      }
    }
    c.show();
    c.grow();
  }
}

Circle2 newCircle2() {
  
  int r = int(random(0,spots.size()));
  PVector spot = spots.get(r);
  float x = spot.x;
  float y = spot.y;

  boolean valid = true;
  for (Circle2 c : circles2) {
    float d = dist(x, y, c.x, c.y);
    if (d < c.r) {
      valid = false;
      break;
    }
  }

  if (valid) {
    return new Circle2(x, y);
  } else {
    return null;
  }
}


class Circle2 {
  float x;
  float y;
  float r;

  boolean growing = true;

  Circle2(float x_, float y_) {
    x = x_;
    y = y_;
    r = 1;
  }

  void grow() {
    if (growing) {
      r = r + 0.5;
    }
  }
  
  boolean edges() {
    return (x + r > width || x -  r < 0 || y + r > height || y -r < 0);
  }

  void show() {
    stroke(255);
    strokeWeight(2);
    noFill();
    ellipse(x, y, r*2, r*2);
  }
}