float accel = radians(.03);
float zVelocity = 0;
float zRotation = 0;

void setup() {
  size(500, 800, P3D);
}

void draw() {
  if (keyPressed) {
    if (zRotation < TAU / 2) {
      zVelocity += accel;
      zRotation += zVelocity;
    } else {
      zRotation = TAU / 2;
      zVelocity = 0;
    }
  } else {
    if (zRotation > 0) {
      zVelocity -= accel;
      zRotation += zVelocity;
    } else {
      zRotation = 0;
      zVelocity = 0;
    }
  }

  background(32);
  translate(width/2, height/2);
  rotateX(radians(20));
  rotateZ(zRotation);
  translate(0, 200);
  box(200);
}
