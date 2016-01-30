import ddf.minim.*;
Minim minim;
AudioPlayer hat;
AudioPlayer kick;
AudioPlayer openhat;
AudioPlayer snare;
int[] lastHits;

void setup()
{
  size(600, 600, P3D);
  minim = new Minim(this);
  hat = minim.loadFile("data/hat.wav");
  kick = minim.loadFile("data/kick.wav");
  openhat = minim.loadFile("data/openhat.wav");
  snare = minim.loadFile("data/snare.wav");
  lastHits = new int[4];
  for (int i = 0; i < lastHits.length; i++) {
    lastHits[i] = -99999;
  }
  colorMode(HSB);
  strokeWeight(5);
}

void draw()
{
  float sphereSize = map(millis(), lastHits[2], lastHits[2] + 300, 0, 300);
  float sphereOpacity = map(millis(), lastHits[2], lastHits[2] + 300, 255, 0);
  pushMatrix();
  translate(width/2, height/2);
  fill(255, sphereOpacity);
  //stroke(128, 255, 255, sphereOpacity);
  sphere(sphereSize);
  popMatrix();

  float bgBrightness = map(millis(), lastHits[0], lastHits[0] + 300, 255, 0);
  fill(60, 255, bgBrightness);
  rect(0, 0, width, height);

  float topOfBox = map(millis(), lastHits[1], lastHits[1] + 300, height, 0);
  fill(255);
  rect(0, topOfBox, width, 30);

  float leftOfPulse = map(millis(), lastHits[3], lastHits[3] + 300, 0, width);
  float topOfPulse = sin(map(millis(), lastHits[3], lastHits[3] + 300, 0, TAU)) * height/4 + width/2;
  ellipse(leftOfPulse, topOfPulse, 30, 30);
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    hat.rewind();
    hat.play();
    lastHits[0] = millis();
  } else if (key == 's' || key == 'S') {
    kick.rewind();
    kick.play();
    lastHits[1] = millis();
  } else if (key == 'd' || key == 'D') {
    openhat.rewind();
    openhat.play();
    lastHits[2] = millis();
  } else if (key == 'f' || key == 'F') {
    snare.rewind();
    snare.play();
    lastHits[3] = millis();
  }
}
