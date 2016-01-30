float radius = 90;
int numOfSpheres = 200;
int millisPerCycle = 15000;
float[] rotations;
float[] colors;
float fullPass;
int m = 0;;

void setup() {
  size(1000, 600, P3D);
  fullPass = width + radius + 1150;
  noStroke();
  rotations = new float[numOfSpheres];
  colors = new float[numOfSpheres];
  for (int i = 0; i < numOfSpheres; i++) {
    rotations[i] = random(TAU);
    colors[i] = random(255);
  }
  colorMode(HSB, 255);
}

void draw() {
  m += 20;
  fill(0, 32);
  pushMatrix();
  translate(0, 0, -800);
  rect(-3000, -3000, 6000, 6000);
  popMatrix();
  lights();
  translate(width/2, height/2, -600);
  
  for (int i = 0; i < numOfSpheres; i++) {
    //fill(colors[i], 255, 255);
    fill(128, colors[i], 255);
    pushMatrix();
    rotateX(rotations[i]);
    float ballX = map((float(fakeMillis() + (i * millisPerCycle / numOfSpheres)) % millisPerCycle), 0, millisPerCycle, -fullPass/2, fullPass/2);
    //float ballX = map(float(i), 0, numOfSpheres, -width, width);
    float y = 0;
    //float test = sq(radius) - sq(ballX + sin(float(fakeMillis()) / 1000) * width / 4);
    float test = sq(radius) - sq(ballX);
    
    //float test = sq(radius) - sq(ballX + (float(fakeMillis()) / 6000) % 1 * fullPass - fullPass/2);
    if (test >= 0) {
      y = sqrt(test);
    }
    translate(ballX, y);
    sphere(3);
    popMatrix();
  }
  
  /*
 saveFrame("img-######.gif");
 if (fakeMillis() > millisPerCycle + 1500) {
   println("DONE");
 }
 */
 // convert -crop 1000x200+0+200  +repage -delay 2 -loop 0 @names.txt crop.gif

}

int fakeMillis() {
  return m;
}