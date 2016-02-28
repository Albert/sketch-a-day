float[][] locations;
int numOfLocations = 200;
float phaseTime = 8;

void setup() {
  size(500, 500);
  stroke(255);
  background(0);
  locations = new float[numOfLocations][3];
  for (int i = 0; i < numOfLocations; i++) {
    locations[i][0] = random(width);
    locations[i][1] = random(height);
    locations[i][2] = random(1);
  }
}

void draw() {
  for (int i = 0; i < numOfLocations; i++) {
    float timeAndOffset = (seconds() + locations[i][2] * 8);
    float negOneToOne = sin((timeAndOffset % phaseTime) / phaseTime * TAU);
    float brightness = map(negOneToOne, -1, 1, 0, 255);
    stroke(brightness);
    point(locations[i][0], locations[i][1]);
  }
}

float seconds() {
  return float(millis()) / 1000;
}