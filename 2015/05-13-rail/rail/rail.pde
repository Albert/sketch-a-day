ArrayList<PVector> spots = new ArrayList<PVector>();
int stepSize = 300;
int numOfBlocks = 7;

void setup() {
  size(500, 500, P3D);
  background(0);
  spots.add(new PVector(0, height/2));
  spots.add(new PVector(width/3, height/2));
  spots.add(new PVector(width/3, 0));
  spots.add(new PVector(2 * width/3, 0));
  spots.add(new PVector(2 * width/3, height/2));
  spots.add(new PVector(width, height/2));
}

void draw() {
  background(0);
  int totalLength = spots.size() * stepSize;
  for (int i = 0; i < numOfBlocks; i ++) {
    int t = (millis() - i * 30);
    int idx = (t / stepSize) % spots.size();
    PVector current = new PVector();
    PVector s1 = spots.get(idx);
    PVector s2 = new PVector();
    if (idx == spots.size() - 1) {
      s2 = spots.get(0);
    } else {
      s2 = spots.get(idx + 1);
    }
    current.x = map(t % totalLength, idx * stepSize, (idx + 1) * stepSize, s1.x, s2.x);
    current.y = map(t % totalLength, idx * stepSize, (idx + 1) * stepSize, s1.y, s2.y);

    pushMatrix();
    translate(current.x, current.y);
    scale(1 - (i * .15), 1 - (i * .15), 4);
    box(30);
    popMatrix();
  }
}
