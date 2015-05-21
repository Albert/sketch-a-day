var x = 0;
var y = 0;
var lastDirection = 2;
var rects = [];
var numOfRects = 50;

function setup() {
  createCanvas(windowWidth, windowHeight);
  colorMode(HSB);
}

function draw() {
  background(0);
  if (frameCount % 3 == 0) {
    var dir = int(random(0, 4));
    var fromDirection = (lastDirection + 2) % 4;
    while (fromDirection == dir) {
      dir = int(random(0, 4));
    }
    if (dir == 0) {
      x++;
    } else if (dir == 1) {
      y++;
    } else if (dir == 2) {
      x--;
    } else if (dir == 3) {
      y--;
    }
    lastDirection = dir;
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
    rects.push({x: x * 40, y: y * 40});
  }


  if (rects.length > numOfRects) {
    rects.shift();
  }
  for (var i = 0; i < rects.length; i++) {
    fill(i * (255 / numOfRects), 255, 255);
    rect(rects[i].x, rects[i].y, 20, 20);
  }
}
