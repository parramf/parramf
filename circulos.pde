import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
FFT fft;

int x = 0;
int y = 50;

float rad;

void setup() {
  size(900, 700);
  background(0);

  minim = new Minim(this);
  player = minim.loadFile("madpix.mp3", 1024);
  player.play();

  fft = new FFT(player.bufferSize(), player.sampleRate());
}

void draw() {
  //background(0);
  
  fft.forward(player.mix);

  // Use the FFT data to get a numeric value
  float level = fft.getBand(10); // Example: get the amplitude of the 10th frequency band

  stroke(color(random(0, 100), random(100, 255), random(200, 255)));
  fill(255, 10);
  rad = (level * (width / 100));
  ellipse(x, y, rad, rad);
  fill(random(255), 10);

  x += 2;

  if (x > width) {
    x = 0;
    y += 80;
  }

  if (y > height) {
    y = 0;
    background(0);
  }
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}
