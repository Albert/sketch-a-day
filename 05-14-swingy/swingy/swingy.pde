float hitMagnitude = .5;

void setup() {
  size(800, 800, P3D);
  noStroke();
}

float seconds() {
  return (float) millis() / 1000;
}

void draw() {
  if (hitMagnitude > 0) {
    hitMagnitude -= .005;
  }
  background(0);
  pushMatrix();
  translate(width/2, height/4);
  directionalLight(126, 126, 126, 1, 1, -1);
  ambientLight(102, 102, 102);
  rotateZ(sin(seconds() * TAU) * hitMagnitude);
  translate(0, height/2);
  rotateY(seconds() * 2);
  box(200);
  popMatrix();
}

void keyPressed() {
  hitMagnitude += .1; 
}
