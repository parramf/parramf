
import ddf.minim.*;
import ddf.minim.analysis.*;

//iniciar librería
Minim minim;
AudioPlayer player;
FFT fft;

int x = 0;
int y = 50;

float rad;

void setup() {
  size(900, 700);
  background(0);
//nueva instancia de minim
  minim = new Minim(this);
  //cargar archivo
  player = minim.loadFile("virtualangel.mp3", 1024);
  player.play();

  fft = new FFT(player.bufferSize(), player.sampleRate());
}

void draw() {
  //background(0); quitar para no borrar background
  
  fft.forward(player.mix);

  // Use the FFT data to get a numeric value
  float level = fft.getBand(10); // Example: get the amplitude of the 10th frequency band
    stroke(color(random(0, 50), random(100, 255), random(100, 255)));
  fill(255,10);
  
  //usar la informacion de las frecuencias de la cancion para cambiar el radio 
  rad = (level * (width / 200)); 
  line(x, y, rad, rad);
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

void drawLines(float level){

  
}




////CIRCULOS 
//void setup(){
//  size(800,800);
//  background(40);
//  noStroke();
//}

//void draw(){
//  drawTarget(width*0.15,height*0.5,30,4);
//drawTarget(width*0.25,height*0.5,200,4);
//drawTarget(width*0.30,height*0.6,300,5);
//drawTarget(width*0.50,height*0.7,400,6);
//drawTarget(width*0.75,height*0.9,400,9);

//}


//void drawTarget(float xloc, float yloc,int size, int num){
//float grayvalues= 255/4;
//float steps=size/num;

//  for (int i =0 ;i<num; i++){
//    fill(i*grayvalues);
//    ellipse(xloc,yloc,size-i*steps,size-i*steps);
//}
//}
