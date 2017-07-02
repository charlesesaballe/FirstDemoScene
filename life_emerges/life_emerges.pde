import moonlander.library.*;
import ddf.minim.*;
Moonlander moonlander;

int dim;
Drop[] drops = new Drop[200];
Star[] stars = new Star[600];
float speed;

void setup() {
  size(1920, 1080); //setting screen size
  moonlander = Moonlander.initWithSoundtrack(this, "planet.mp3", 120, 6);
  moonlander.start();
  setGraffathon();
  setTeam();
  dim = width/2;
  
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
  
}


float r_scale = 0.0;

float branch_direction;
int x = 200;
int y = 0;
float theta = 0.0;


ArrayList<Circle> circles;
ArrayList<Circle2> circles2;
ArrayList<PVector> spots;  
PImage img;


float a = 1;
float b = 1;
float supershape(float theta, float m, float n1, float n2, float n3) {
  float t1 = abs((1/a)*cos(m * theta / 4));
  t1 = pow(t1, n2);
  float t2 = abs((1/b)*sin(m * theta/4));
  t2 = pow(t2, n3);
  float t3 = t1 + t2;
  float r = pow(t3, - 1 / n1);
  return r;
}



void draw() {
  moonlander.update();
  frameRate(30); 
  stroke(255);


  double show_value = moonlander.getValue("show_value");

  if (show_value == 1) {
    background(0);
    strokeWeight(2);

    //Earth appears
    double circle_r= moonlander.getValue("circle_r");
    float rad = (float) circle_r;
    float circle_x = width/2;
    float circle_y = height;
    trippy_circle(circle_x, circle_y, rad);

    //tree trunk emerges
    double tree_trunk= moonlander.getValue("tree_trunk");
    float trunk = (float) tree_trunk;
    tree_trunk(trunk);

    //tree branches appear
    double tree_branch= moonlander.getValue("tree_branch");

    // Picking an angle
    float a = ((float) tree_branch / (float) width) * 90f;
    // Convert it to radians
    branch_direction = radians(a);
    // Start the recursive branching!
    branch(200);
  } else if (show_value == 2) {
    translate(0, 0);
    starrynight();
    comet(x, y);
    x = x + 2;
    y = y + 2;
  } else if (show_value == 3) {
    background(39, 15, 70);
    showTeam();
  } else if (show_value == 4) {
    //background(0);
    starrynight();
  } else if (show_value == 5) {
    //background(0);
    starrynight();
    solar_system();
  } else if (show_value == 6) {
    background(39, 15, 70);
    showGraffathon();
  } else if (show_value == 7) {
    background(0);
    //colorMode(HSB, 360, 100, 100);
    noStroke();
    ellipseMode(RADIUS);
    frameRate(2);

    for (int x = 0; x <= width; x+=dim) {
      drawGradient(x, height/2);
    }
  } else if (show_value == 8) {
      background(0);
      drawSquare();
  } else if (show_value == 9) {
      fill(random(250),random(4),random(4));
      drawCircle();
  } else if (show_value == 10) {  
      background(0);
      redRain();
  } else if (show_value == 11) {
    background(0);
      shootingStar();
  } else if (show_value == 12) {
    background(0);
      oscillate();
  }
}


void tree_trunk(float trunk) {
  // Start the tree from the bottom of the screen
  translate(width/6, height);
  // Draw the trunk
  line(0, 0, 0, -trunk);
  // Move to the end of that line
  translate(0, -trunk);
}


void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.70;

  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(branch_direction);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-branch_direction);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}


void trippy_circle(float x, float y, float r) {
  ellipse(x, y, 2*r, .2*r);
}