ArrayList<ArcThing> arcs = new ArrayList<ArcThing>();

void setup() {
  size(500, 500);
  noFill();
  stroke(255);
}

void draw() {
  background(0);
  if (frameCount % 60 == 0) {
    float a = random(0, TAU);
    float b = a + random(TAU / 8, TAU * 7/8);
    arcs.add(new ArcThing(a, b));
  }
  for (int i = 0; i < arcs.size(); i++) {
    ArcThing a = arcs.get(i);
    if (a.distance > 750) {
      arcs.remove(i);
    }
    a.update();
    arc(width / 2, height / 2, a.distance, a.distance, a.startAngle, a.endAngle);
  }
}

class ArcThing {
  float startAngle, endAngle, distance;
  ArcThing (float s, float e) {
    startAngle = s;
    endAngle = e;
  }
  void update() {
    distance ++;
  }
}
