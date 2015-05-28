import L3D.*;

L3D cube;
float aliasAmount;
PVector[][][] voxels;
PVector boxDef;
PMatrix3D mat;

void setup() {
  boxDef = new PVector(2, 2, 2);
  size(displayWidth, displayHeight, P3D);
  cube=new L3D(this);
  cube.enableDrawing();
  cube.enableMulticastStreaming();
  cube.enablePoseCube();
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
  mat = new PMatrix3D();
  mat.rotateX((float) millis() / 750);
  mat.rotateY((float) millis() / 500);
  mat.rotateZ((float) millis() / 1000);

  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      for (int k = 0; k < 8; k++) {
        PVector thisLocation = voxels[i][j][k].get();
        thisLocation.sub(3.5, 3.5, 3.5); // normalized so 0 is the center
        PVector multiplied = mat.mult(thisLocation, new PVector());
        float myDist = sdBox(multiplied, boxDef);
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

float sdBox(PVector p, PVector b) {
  PVector d = new PVector(abs(p.x) - b.x, abs(p.y) - b.y, abs(p.z) - b.z);
  PVector noNegs = new PVector(max(d.x,0.0), max(d.y,0.0), max(d.z,0.0));
  return min(max(d.x,max(d.y,d.z)),0.0) + noNegs.mag();
}
