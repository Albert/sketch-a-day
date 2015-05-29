void setup() {
  size(800, 800, P3D);
}

void draw() {
  translate(width/2, height/2);
  background(0);
  lights();
  beginShape(QUAD_STRIP); 
    for (int i = 0; i < 30; i++) {
      float x = map(i, -5, 35, -width/2, width/2);
      vertex(x, sin(float(millis()) / 500 + float(i) / 5) * 300 + i % 2 * 50, 0);
      vertex(x, sin(float(millis()) / 500 + float(i) / 5) * 300 + i % 2 * 50, 100);
    }
  endShape();
}
