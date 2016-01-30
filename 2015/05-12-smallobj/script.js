function setup() {
  createCanvas(displayWidth, displayHeight);
  noStroke();
}

function draw() {
  background(0);
  translate(width/2, height/2);
  if (millis() < 6000) {
    var newScale = map(millis(), 0, 6000, 100, 2);
    scale(newScale);
  } else {
    scale(2);
  }
  ellipse(0, 0, 1, 1);
  for (var i = 0; i < 3; i++) {
    push();
    rotate((millis() / 1000) + i * (TAU / 3));
    triangle(0, -20, -20, -50, 20, -50);
    rect(-10, -100, 20, 60);
    pop();
  }
}
