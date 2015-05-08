int numOfCircles = 80;
int[] x;
int[] y;
int[] dx;
int[] dy;
int[] xVel;
int[] yVel;
int velocity = 3;
boolean resistChange;

void setup() {
  size(500, 500);
  x = new int[numOfCircles];
  y = new int[numOfCircles];
  dx = new int[numOfCircles];
  dy = new int[numOfCircles];
  xVel = new int[numOfCircles];
  yVel = new int[numOfCircles];
  for (int i = 0; i < numOfCircles; i++) {
    x[i] = (int) random(0, width);
    y[i] = (int) random(0, height);
    xVel[i] = (int) random(0, 2);
    yVel[i] = (int) random(0, 2);
    if (xVel[i] == 0) xVel[i] = -1;
    if (yVel[i] == 0) yVel[i] = -1;
    xVel[i] *= velocity;
    yVel[i] *= velocity;
  }
  resistChange = false;
}

void draw() {
  background(0);
  if (keyPressed) {
    resistChange = true;
  } else {
    resistChange = false;
  }
  for (int i = 0; i < numOfCircles; i++) {
    if (x[i] < 0 || x[i] > width) {
      xVel[i] *= -1;
    }
    if (y[i] < 0 || y[i] > width) {
      yVel[i] *= -1;
    }
    if (resistChange == true) {
      if ((dx[i] - width/2) * (x[i] - width/2) <= 0) {
        stroke(255);
        line(width/2, 0, width/2, height);
        xVel[i] *= -1;
      } else {
        dx[i] = x[i];
        dy[i] = y[i];
      }
    } else {
      dx[i] = x[i];
      dy[i] = y[i];
    }
    x[i] += xVel[i];
    y[i] += yVel[i];
    ellipse(x[i], y[i], 10, 10);
  }

  text("Press any key to resist change", 20, height - 20);
}

