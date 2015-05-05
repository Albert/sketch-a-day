int maskHeight;
int maskWidth = 2;
float scaleFactor;

void setup() {
  size(400, 400);
  frame.setResizable(true);
  scaleFactor = 0;
}

void draw() {
  background(0);
  translate(width / 2, height / 2);

  fill(255);

  pushMatrix();
    float scaleAmount = 1.00;
    for (int i = 0; i < 20; i++) {
      scaleAmount += scaleFactor;
      scale(scaleAmount, 1);
      fill(255, 5);
      rect(-100, -100, 200, 200);
    }
  popMatrix();

  if (maskHeight < 200) {
    maskHeight += 4;
  } else if (maskWidth < 70) {
    maskWidth += 4;
  } else if (scaleFactor < .005) {
    scaleFactor += .00005;
  } else if (scaleFactor < .01) {
    scaleFactor += .00005;
    frame.setSize(800, 300);
  }
  frame.setLocation((displayWidth - width) / 2, (displayHeight - height) / 2);
  fill(0);
  rect(-maskWidth / 2, -100, maskWidth, maskHeight);



}
