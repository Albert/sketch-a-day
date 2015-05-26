import L3D.*;

L3D cube;
PVector[][][] voxels;

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

  for (int i = 0; i < 8; i++) {
    for (int k = 0; k < 8; k++) {
      PVector birdsEyeCoord = new PVector(i, k);
      float dist = birdsEyeCoord.mag();
      float h = (sin(dist / 2 + (float) millis() / 500) + 1) * 2;
      for (int j = 0; j < 8; j++) {
        float closeness = abs(j - h);
        float brightness = map(closeness, 0, 1, 255, 0);
        cube.setVoxel(voxels[i][j][k], color(brightness));
      }
    }
  }
}
