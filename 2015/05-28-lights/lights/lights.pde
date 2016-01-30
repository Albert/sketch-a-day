float[][] locations;
float[][] scales;
float[][] rotations;
int numOfBoxes;

void setup() {
  numOfBoxes = 100;
  size(800, 800, P3D);
  locations = new float[numOfBoxes][3];
  scales    = new float[numOfBoxes][3];
  rotations = new float[numOfBoxes][3];

  for (int i = 0; i < numOfBoxes; i++) {
    for (int j = 0; j < 3; j++) {
      locations[i][j] = random(-300, 300);
      scales[i][j]    = random(.1, 1);
      rotations[i][j] = random(0, TAU);
    }
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  pushMatrix();
    pushMatrix();
      rotateX(-float(millis()) / 200);
      rotateZ(float(millis()) / 300);
      lights();
    popMatrix();

    for (int i = 0; i < numOfBoxes; i++) {
      pushMatrix();
        translate(locations[i][0], locations[i][1], locations[i][2]);
        rotateX(rotations[i][0]);
        rotateY(rotations[i][1]);
        rotateZ(rotations[i][2]);
        scale(scales[i][0], scales[i][1], scales[i][2]);
        box(50);
      popMatrix();
    }
  popMatrix();
}
