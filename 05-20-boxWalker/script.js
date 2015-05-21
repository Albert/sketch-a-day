var x = 0;
var y = 0;
var fromDirection = -1;

function setup() {
  createCanvas(windowWidth, windowHeight);
}

function draw() {
  background(0);
  if (frameCount % 5 == 0) {
    var dir = int(random(0, 4));
    while (fromDirection == dir) {
      dir = int(random(0, 4));
    }
    if (dir == 0) {
      x++;
      fromDirection = 2;
    } else if (dir == 1) {
      y++;
      fromDirection = 3;
    } else if (dir == 2) {
      x--;
      fromDirection = 0;
    } else if (dir == 3) {
      y--;
      fromDirection = 1;
    }
    if (x < 0) {
      x = windowWidth / 40 - 1;
    } else if (x > windowWidth / 40 - 1) {
      x = 0;
    }
    if (y < 0) {
      y = windowHeight / 40 - 1;
    } else if (y > windowHeight / 40 - 1) {
      y = 0;
    }
  }
  rect(x * 40, y * 40, 20, 20);
}
