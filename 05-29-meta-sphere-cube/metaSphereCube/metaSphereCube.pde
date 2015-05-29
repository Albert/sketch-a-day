import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(1000);
  sphereDetail(15);
  noStroke();
}

void draw() {
  background(0);
  lights();
  translate(-width/4, 0);
  for (int i = 0; i < 20; i++) {
    pushMatrix();
      rotateY(TAU/20 * i);
      for (int j = 0; j < 20; j++) {
        pushMatrix();
          translate(100 * sin(TAU/2/20 * j), 100 * cos(TAU/2/20 * j));
          box(20);
        popMatrix();
      }
    popMatrix();
  }
  translate(width/2, 0);
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      for (int k = 0; k < 5; k++) {
      pushMatrix();
        translate(i * (200 / 5) - 100, j * (200 / 5) - 100, k * (200 / 5) - 100);
        sphere(20);
      popMatrix();
      }
    }
  }
}
