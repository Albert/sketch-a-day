void setup() {
  size(700, 700);
  colorMode(3);
}

void draw() {
  background(155);
  fill((float(millis()) / 20) % 255, 255, 255);
  translate(width/2, height/2);
  float x = sin(float(millis()) / 800) * 200;
  float y = cos(float(millis()) / 800) * 200;
  float rad = noise(float(millis()) / 2000) * 500;
  ellipse(x, y, rad, rad);
  ellipse(-x, -y, 750 - rad, 750 - rad);
}