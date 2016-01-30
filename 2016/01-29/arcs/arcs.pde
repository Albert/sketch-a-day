int numberOfCircles = 40;
int weight = 8;
int speedDivisor = 1000;
float offsetFactor = 0.2;
int fakeMilli = 0;

void setup() {
  size(600, 600, FX2D);
  noFill();
  stroke(255);
  strokeWeight(weight);
  strokeCap(0);
}

void draw() {
  fakeMilli += 20;
  println(fakeMilli);
  background(0);
  translate(width/2, height/2);
  for (int i = 0; i < numberOfCircles; i++) {
    pushMatrix();
    if (i % 2 == 0) {
      rotate((float(fakeMilli) / speedDivisor) * (1 + (float(numberOfCircles - i) * offsetFactor)));
    } else {
      rotate(-(float(fakeMilli) / speedDivisor) * (1 + (float(numberOfCircles - i) * offsetFactor)));
    }
    float radius = i * weight * 1.8;
    arc(0, 0, radius, radius, 0, TAU/4);
    arc(0, 0, radius, radius, TAU/2, 3 * TAU/4);
    popMatrix();
  }
  // saveFrame("img-######.gif");
  // run til you get to 786 frames
  // w/ imagemagick, run in terminal:
  // convert -delay 2 -loop 0 @names.txt output.gif
}