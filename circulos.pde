// All credits of original example to Joanne Martin
// Adapted by Andrés Pinilla
// Universidad de los Andes, 2024

int x = 0;
int y = 50;

float rad;

void setup() {
  size(900, 700);
  background(0);
  //frameRate(10);
}

void draw() {
  // Simulate the audio signal with random values
  float level = random(0, 1);

  stroke(color(random(0, 100), random(100, 255), random(200, 255)));
  fill(255, 10);
  // Draw ellipse in the middle of canvas
  // Use value of level for the width and height of ellipse
  rad = (level * width / random(2, 6));
  ellipse(x, y, rad, rad);
  fill(random(255), 10);
  //triangle(random(100), random(100), rad, rad, y+(rad*2), y+(rad/2));

  x += 2;

  if (x > width) {
    x = 0;
    y += 80;
  }

  if (y > height) {
    y = 0;
  }
}
