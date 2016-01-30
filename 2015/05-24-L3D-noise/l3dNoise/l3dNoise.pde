import L3D.*;

L3D cube;
PVector[][][] voxels;
PVector sphereCenter = new PVector(3.5, 3.5, 3.5);
float sphereRadius = 2;

void setup() {
  size(displayWidth, displayHeight, P3D);
  cube=new L3D(this);
  cube.enableDrawing();
  cube.enableMulticastStreaming();
  cube.enablePoseCube();
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
  background(0);
  cube.background(0);

  /*
  sphereCenter.x = sin((float) millis() / 1000 * 5) * 3 + 3.5;
  sphereCenter.y = cos((float) millis() / 1000 * 7) * 3 + 3.5;
  sphereCenter.z = cos((float) millis() / 1000 * 9) * 3 + 3.5;
  */

  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      for (int k = 0; k < 8; k++) {
        float myDist = sdSphere(voxels[i][j][k], sphereRadius);
        float redVal = map(myDist, 1, 2, 255, 0);
        float greenVal = map(myDist, 0, 1, 255, 0);
        redVal = smoothstep(0, 255, redVal);
        greenVal = smoothstep(0, 255, greenVal);
        cube.setVoxel(voxels[i][j][k], color(redVal, greenVal, 0));
      }
    }
  }
}

float sdSphere(PVector p, float radius) {
  float t = - (float) millis() / 1000;
  PVector fbmSeed = PVector.mult(p, .2);
  fbmSeed.add(t, t, t);
  float noisyVal = noise(fbmSeed.x, fbmSeed.y, fbmSeed.z) * 20;
  PVector noisyVec = new PVector(noisyVal, noisyVal, noisyVal);
  PVector p2 = p.get();
  p2.add(noisyVec);
  p2.sub(10, 10, 10);
  return p2.dist(sphereCenter) - radius;
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

float smoothstep(float minV, float maxV, float variance) {
  float lin = max(0,min(1,(variance-minV)/(maxV-minV)));
  return minV + lin*lin*(3-2*lin) * (maxV - minV);
}

/*
float hash( float n ) {
  return random(0, 1);
}

float noise(PVector x) {
  PVector p = new PVector(floor(x.x), floor(x.y), floor(x.z));
  PVector f = new PVector(fract(x.x), fract(x.y), fract(x.z));
  f.mult(f);
  f.mult(new PVector(

}

float fract(float a) {
  return r;
}
*/
