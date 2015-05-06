int num = 20;
float delt = 20;
float boxSize = 10;

void setup() {
  size(800, 800, P3D);
  fill(255, 255, 0);
}

void draw() {
  background(0);
  boxSize = (sin(TAU * ((float)millis() / 1000) / 10) * .5 + 1) * 10;
  delt = (cos(TAU * ((float)millis() / 1000) / 5) * .5 + 1) * 30;

  translate(width / 2, height / 2);
  rotateY(TAU * (float)millis() / 1000 / 6);
  rotateX(TAU * (float)millis() / 1000 / 100);
  for (int i = -num / 2; i < num / 2; i++) {
    for (int j = -num / 2; j < num / 2; j++) {
      for (int k = -num / 2; k < num / 2; k++) {
        pushMatrix();
        translate(delt * i, delt * j, delt * k);
        box(boxSize);
        popMatrix();
      }
    }
  }
}
