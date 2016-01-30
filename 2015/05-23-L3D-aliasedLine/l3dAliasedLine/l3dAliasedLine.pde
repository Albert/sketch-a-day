import L3D.*;

L3D cube;
float aliasAmount;
PVector[][][] voxels;
PVector sphereCenter = new PVector(3.5, 3.5, 3.5);
float sphereRadius = 3;
PVector boxDef;
PVector lp1;
PVector lp2;
float lr;

void setup() {
  boxDef = new PVector(3, 3, 3);
  size(displayWidth, displayHeight, P3D);
  cube=new L3D(this);
  cube.enableDrawing();
  cube.enableMulticastStreaming();
  cube.enablePoseCube();
  lp1 = new PVector(8, 8, 8);
  lp2 = new PVector(0, 0, 0);
  lr = .2;
  voxels = new PVector[8][8][8];
  aliasAmount = .75;
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      for (int k = 0; k < 8; k++) {
        voxels[i][j][k] = new PVector(i, j, k);
      }
    }
  }
}

void draw() {
  background(0);
  cube.background(0);

  sphereCenter.x = sin((float) millis() / 1000 * 5) * 3 + 3.5;
  sphereCenter.y = cos((float) millis() / 1000 * 7) * 3 + 3.5;
  sphereCenter.z = cos((float) millis() / 1000 * 9) * 3 + 3.5;

  boxDef.x = sin((float) millis() / 1000 * 5) * 3 + 3.5;
  boxDef.y = cos((float) millis() / 1000 * 7) * 3 + 3.5;
  boxDef.z = cos((float) millis() / 1000 * 9) * 3 + 3.5;

  lp1.x = sin((float) millis() / 1000 * 5) * 3 + 3.5;
  lp1.y = cos((float) millis() / 1000 * 7) * 3 + 3.5;
  lp1.z = cos((float) millis() / 1000 * 9) * 3 + 3.5;

  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      for (int k = 0; k < 8; k++) {
        //float myDist = sdSphere(voxels[i][j][k], sphereRadius);
        //float myDist = sdBox(voxels[i][j][k], boxDef);
        float myDist = sdCapsule(voxels[i][j][k], lp1, lp2, lr);
        float redColor;
        if (myDist < 0) {
          redColor = 255;
        } else if (myDist < aliasAmount) {
          redColor = map(myDist, 0, aliasAmount, 255, 0);
        } else {
          redColor = 0;
        }
        cube.setVoxel(voxels[i][j][k], color(redColor, 0, 0));
      }
    }
  }
}

float sdSphere(PVector p, float radius) {
  return p.dist(sphereCenter) - radius;
}

float sdBox(PVector p, PVector b) {
  PVector d = new PVector(abs(p.x) - b.x, abs(p.y) - b.y, abs(p.z) - b.z);
  PVector noNegs = new PVector(max(d.x,0.0), max(d.y,0.0), max(d.z,0.0));
  return min(max(d.x,max(d.y,d.z)),0.0) + noNegs.mag();
}

float sdCapsule(PVector p, PVector a, PVector b, float r) {
  PVector pa = PVector.sub(p, a);
  PVector ba = PVector.sub(b, a);
  float h = PVector.dot(pa,ba)/PVector.dot(ba,ba);
  return PVector.sub(pa, PVector.mult(ba, h)).mag() - r;
}
