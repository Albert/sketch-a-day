float dia = 2;
int iCount;
int jCount;
float hexOffset = sqrt(3)/2;

void setup() {
  size(400, 400, FX2D);
  iCount = int(float(width) / dia + 1);
  jCount = int(float(height) / dia / hexOffset + 1);
  noStroke();
  colorMode(HSB, 255);
}

void draw() {
  background(128);
  translate(width/2, height/2);
  for (int i = 0; i < iCount; i++) {
    for (int j = 0; j < jCount; j++) {
      pushMatrix();
      float x, y;
      y = j * dia * hexOffset;
      if (j % 2 == 0) {
        x = i * dia;
      } else {
        x = i * dia + dia/2;
      }
      x = x - (width / 2);
      y = y - (height / 2);
      float distance = dist(x, y, 0, 0);
      float hue = map(distance, 0, sqrt(2) * width/2, 0, 255);
      fill(hue, 255, 255);
      translate((mouseX - width/2), (mouseY - height/2));
      rotate((sqrt(2) * width / 2 - distance) / float(width) * 20 * sin(seconds() / 2));
      translate(-(mouseX - width/2), -(mouseY - height/2));
      ellipse(x, y, dia, dia);
      popMatrix();
    }
  }
}

float seconds() {
  return float(millis()) / 1000;
}