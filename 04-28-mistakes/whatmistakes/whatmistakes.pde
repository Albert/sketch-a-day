int triangleCount = 30;

void setup() {
  size(1200, 300, P3D);
  colorMode(HSB, 100);
}

void draw() {
  fill(random(100), 100, 100);
  float a1 = random(width);
  float a2 = random(height);
  float b1 = random(width);
  float b2 = random(height);
  float c1 = random(width);
  float c2 = random(height);
  triangle(a1, a2, b1, b2, c1, c2);
}
