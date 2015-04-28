void setup() {
  size(500, 500);
  colorMode(HSB, 100);
  //noStroke();
}

void draw() {
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);
  stroke((millis() / 5) % 100, 100, 100);
  strokeWeight(30);
  strokeCap(ROUND);
  line(pmouseX, pmouseY, mouseX, mouseY);
}
