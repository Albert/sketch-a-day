void setup() {
  colorMode(HSB);
  size(700, 500);
  noStroke();
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255, 255, 255);
  for (int i = 200; i > -100; i = i - 3) {
    fill(255, 255 - (200 - i), 255);
    ellipse(width / 2, height / 2, width + i, height + i);
  }
  fill(0);
  float s = (sin((float)millis() / 2500) + 2) * 20.0;
  textSize(s);
  text("Happy\nMothers Day!", width/2, height/2);
}
