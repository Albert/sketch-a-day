float x;
float y;

void setup() {
  size(700, 400);
  background(0);
  x = 0;
  y = height / 2;
}

void draw() {
  if (keyPressed) {
    x += random(-60, 60);
    y += random(-60, 60);
    if (x < 0) {
      x = x + width;
    } else if (x > width) {
      x = x - width;
    }
    if (y < 0) {
      y = y + height;
    } else if (y > height) {
      y = y - height;
    }
  } else {
    float percentDone = ((float)millis() / 1250.0) % 1.0;
    x = percentDone * width;
    y = cos(percentDone * 2 * TAU) * 50 + height / 2;
  }
  fill(0, 20);
  rect(0, 0, width, height);
  fill(255);
  text("press any key to abandon instructions", 20, height - 20);

  pushMatrix();
    translate(x, y);
    fill(255, 0, 0);
    ellipse(0, 0, 30, 30);
  popMatrix();
}
