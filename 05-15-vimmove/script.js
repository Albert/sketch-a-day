var unitSize = 30;
var leftOffset = 5;
var topOffset = 5;
function setup() {
  createCanvas(displayWidth, displayHeight);
  noStroke();
}

function draw() {
  background(0, 10);
  rect(unitSize * leftOffset, unitSize * topOffset, unitSize, unitSize);
}

function keyTyped() {
  if (key == 'h') {
    leftOffset -= 1;
  } else if (key == 'j') {
    topOffset += 1;
  } else if (key == 'k') {
    topOffset -= 1;
  } else if (key == 'l') {
    leftOffset += 1;
  } else if (key == 'b') {
    leftOffset -= 5;
  } else if (key == 'n') {
    leftOffset += 5;
  }
}
