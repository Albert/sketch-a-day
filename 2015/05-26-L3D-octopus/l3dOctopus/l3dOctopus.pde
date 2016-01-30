import L3D.*;

L3D cube;
PVector[][][] voxels;
PVector[] ls;
PVector[] le;
int numOfLines = 8;

void setup() {
  size(displayWidth, displayHeight, P3D);
  cube=new L3D(this);
  cube.enableDrawing();
  cube.enableMulticastStreaming();
  cube.enablePoseCube();
  ls = new PVector[numOfLines];
  le = new PVector[numOfLines];
  voxels = new PVector[8][8][8];
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      for (int k = 0; k < 8; k++) {
        voxels[i][j][k] = new PVector(i, j, k);
      }
    }
  }
}

void draw() {
  float seconds = (float) millis() / 1000;
  float inOut = smoothstep(0, 8, sin(seconds) * 4 + 4);
  background(0);
  cube.background(0);
  for (int l = 0; l < numOfLines; l ++) {
    ls[l] = new PVector(inOut, 3.5, 3.5);
    le[l] = new PVector(
      8 - inOut,
      4 + 4 * cos(2 * seconds + (TAU * l / numOfLines)),
      4 + 4 * sin(2 * seconds + (TAU * l / numOfLines))
    );
  }

  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      for (int k = 0; k < 8; k++) {
        for (int l = 0; l < numOfLines; l ++) {
          float myDist = sdCapsule(voxels[i][j][k], ls[l], le[l], 0);
          float redVal = map(myDist, 0, 3, 255, 0);
          float greenVal = map(myDist, 0, 1, 255, 0);
          redVal = smoothstep(0, 255, redVal);
          greenVal = smoothstep(0, 255, greenVal);
          if (redVal != 0 && greenVal != 0) {
            cube.setVoxel(voxels[i][j][k], color(redVal, greenVal, 0));
          }
        }
      }
    }
  }
}

float sdCapsule(PVector p, PVector a, PVector b, float r) {
  PVector pa = PVector.sub(p, a);
  PVector ba = PVector.sub(b, a);
  float h = PVector.dot(pa,ba)/PVector.dot(ba,ba);
  return PVector.sub(pa, PVector.mult(ba, h)).mag() - r;
}

float smoothstep(float minV, float maxV, float variance) {
  float lin = max(0,min(1,(variance-minV)/(maxV-minV)));
  return minV + lin*lin*(3-2*lin) * (maxV - minV);
}
