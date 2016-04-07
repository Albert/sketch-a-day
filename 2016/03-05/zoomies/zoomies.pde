float lastClick = 0;
float lengthOfAnimation = 1;

void setup() {
  size(500, 500, P3D);
  lights();
  noStroke();
}

void draw() {
  background(0);
  float secondsSince = seconds() - lastClick;
  float alphaAmount = map(secondsSince, 0, lengthOfAnimation, 255, 0);
  float scaleAmount = map(secondsSince, 0, lengthOfAnimation, 1, 8);
  fill(255, alphaAmount);
  background(0);
  translate(width/2, height/2);
  scale(scaleAmount);
  rotateY(seconds() * 4);
  rotateX(seconds() * 2);
  box(30);
}

void mousePressed() {
  lastClick = seconds();
}

float seconds() {
  return (float(millis()) / 1000);
}
