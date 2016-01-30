ArrayList<PVector> locations = new ArrayList<PVector>();
ArrayList<PVector> velocities = new ArrayList<PVector>();

void setup() {
  size(800, 800, P3D);
  noStroke();
  textSize(30);
}

void draw() {
  background(0);
  directionalLight(255, 255, 255, 0, 0, -1);
  if (frameCount % 3 == 0) {
    locations.add(new PVector(0, height/2, 0));
    velocities.add(new PVector(random(4, 5), random(-1.5, 1.5), random(-1, 1)));
  }
  for (int i = 0; i < locations.size(); i++) {
    PVector l = locations.get(i);
    PVector v = velocities.get(i);
    v.y += .02;
    if (l.x > width / 2 && l.x < (width / 2) + 5 && v.x > 0) {
      boolean easement = (random(1) < .005);
      if (!easement) {
        v.x *= -.3;
      }
    }
    l.x += v.x;
    l.y += v.y;
    l.z += v.z;
    pushMatrix();
      translate(l.x, l.y, l.z);
      if (l.x > width / 2 + 5) {
        text("<- Easement", 20, 8);
      }
      sphere(10);
    popMatrix();
    if (l.y > height) {
      locations.remove(i);
      velocities.remove(i);
    }
  }
}
