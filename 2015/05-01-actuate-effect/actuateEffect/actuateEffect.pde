// Wow, I just want to have <int> but java won't let me do it... there's gotta be a better way
float decayLength = 1.25;
int numOfTracks = 10;
float[] taps = new float[numOfTracks];
int trackToAddTo = 0;

void setup() {
  size(600, 600);
}

float seconds() {
  return (float) millis() / 1000;
}

void draw() {
  for (int i = 0; i < taps.length; i ++) {
    float timeSince = seconds() - taps[i];
    if (timeSince > decayLength) {
      //taps.remove(i);
      continue;
    } else {
      float fillVal = map(timeSince, 0, decayLength, 255, 0);
      fill(fillVal);
      rect(i * width / numOfTracks, 0, width / numOfTracks, height);
    }
  }
}

void keyPressed() {
  taps[trackToAddTo] = seconds();
  trackToAddTo ++;
  if (trackToAddTo == 10) {trackToAddTo = 0;}
}
