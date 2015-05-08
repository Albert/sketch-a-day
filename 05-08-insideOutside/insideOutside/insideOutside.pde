int counter = 0;

void setup() {
  size(300, 300, P3D);
  frameRate(10);
  colorMode(HSB);
}

void draw() {
  background(0);
  fill(random(0, 255), 255, 255);
  //float scaleAmount = .5 + (noise((float)counter / 50.0));
  float scaleAmount = .8;
  if (counter == 0) {
    PImage img = loadImage("data/init.png");
    pushMatrix();
      scale(scaleAmount);
      image(img, 35, 35);
    popMatrix();
    pushMatrix();
      translate(mouseX, mouseY);
      box(20);
    popMatrix();
    saveFrame("data/0.png");
  } else if (counter % 2 == 1) {
    PImage img = loadImage("data/0.png");
    pushMatrix();
      scale(scaleAmount);
      image(img, 35, 35);
    popMatrix();
    pushMatrix();
      translate(mouseX, mouseY);
      box(20);
    popMatrix();
    saveFrame("data/1.png");
  } else {
    PImage img = loadImage("data/1.png");
    pushMatrix();
      scale(scaleAmount);
      image(img, 35, 35);
    popMatrix();
    pushMatrix();
      translate(mouseX, mouseY);
      box(20);
    popMatrix();
    saveFrame("data/0.png");
  }
  counter ++;
}
