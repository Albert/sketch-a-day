import L3D.*;

L3D cube;
PVector voxel=new PVector(3,3,3);  //this is the voxel that we'll blink
PVector[][][] voxels;
PVector sphereCenter = new PVector(3.5, 3.5, 3.5);
float sphereRadius = 3;


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
  sphereCenter.x = sin((float) millis() / 1000 * 5) * 3 + 3.5;
  sphereCenter.y = cos((float) millis() / 1000 * 7) * 3 + 3.5;
  sphereCenter.z = cos((float) millis() / 1000 * 9) * 3 + 3.5;
  sphereRadius = cos((float) millis() / 1000 * 2) * 3 + 3.5;
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      for (int k = 0; k < 8; k++) {
        float myDist = voxels[i][j][k].dist(sphereCenter);
        float redColor = map(myDist, sphereRadius, sphereRadius + 1, 255, 0);
        if (redColor > 255) redColor = 255;
        if (redColor < 0) redColor = 0;
        cube.setVoxel(voxels[i][j][k], color(redColor, 0, 0));
      }
    }
  }
}
