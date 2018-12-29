import processing.sound.*;


float ballSize=5;
float r= 255;
float g= 255;
float b = 255;
SoundFile file;
Amplitude vol;
float smoothingFactor = 0.25;
float sum;
float max_distance;

void setup() {
  size(600, 400);
  file = new SoundFile(this, "2.mp3");
  file.play();


  vol = new Amplitude(this);
  vol.input(file);
  max_distance = dist(0, 0, width, height);

}

void draw() {float c = map(mouseX, 0, width, 0,175);
  background(random(0,100));
  float vol_scaled = sum * (height/2) * 5;
  println(vol.analyze());
  sum += (vol.analyze() - sum) * smoothingFactor;
  pushStyle();
  stroke(random(0,255),random(0,255),random(0,255));
   for(int i = 0; i <= width; i += 20) {
    for(int j = 0; j <= height; j += 20) {
      float size = dist(mouseX, mouseY, i, j);
      size = size/max_distance * 66;
      ellipse(i, j, size, size);
    }
  }
  fill(255, c, 0);
  noStroke();
  ellipse(width/2, height/2, vol_scaled/3, vol_scaled/3);
  
  popStyle();
  noFill();
  stroke(255,255,255);
  strokeWeight(20);
  ellipse(width/2, height/2, vol_scaled/2, vol_scaled/2);
  strokeWeight(2);
  ellipse(width/2, height/2, vol_scaled, vol_scaled);
  strokeWeight(1);
  ellipse(width/2, height/2, vol_scaled/1.1, vol_scaled/1.1);
 }
