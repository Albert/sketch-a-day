float x;
float y;
float centerX;
float centerY;

void setup() {
  size(800, 800, P3D);
  x = 0;
  y = 0;
  centerX = width/2;
  centerY = width/2;
}

void draw() {
  background(0);
  if (mousePressed) {
    x = mouseX - centerX;
    y = mouseY - centerY;
  } else {
    x = x * .9;
    y = y * .9;
  }
  pushMatrix();
    translate(centerX, centerY);
    translate(x, y);
    sphere(100);
  popMatrix();
}
