PGraphics maskImage;
float diameter = 500;

void setup() {
  colorMode(HSB);
  size(900, 900);
  stroke(random(255), random(128, 255), random(128, 255));
  strokeWeight(30);
  fill(255);
}

void draw() {
  background(0);
  pushMatrix();
    translate(width/2, height/2);
    rotate((float)millis() / 4000);
    for (int i = 0; i < 6; i++) {
      pushMatrix();
        float centerX = diameter / 2 * cos(TAU * (float)i/6);
        float centerY = diameter / 2 * sin(TAU * (float)i/6);;
        float thisDia = diameter;
        thisDia /= 2;
        translate(centerX, centerY);
        rotate((float)millis() / 4000);
        for (int j = 0; j < 6; j++) {
          pushMatrix();
            float centerX1 = thisDia / 2 * cos(TAU * (float)j/6);
            float centerY1 = thisDia / 2 * sin(TAU * (float)j/6);;
            float another = thisDia;
            another /= 2;
            translate(centerX1, centerY1);
            ellipse(0, 0, another, another);
          popMatrix();
        }
        ellipse(0, 0, thisDia, thisDia);
      popMatrix();
    }
    ellipse(0, 0, diameter, diameter);
  popMatrix();
}
