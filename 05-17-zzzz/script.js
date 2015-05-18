function setup() {
  createCanvas(windowWidth, windowHeight);
  noStroke();
  fill(255);
}

function draw() {
  background(0);
  var phase = 3;  // in seconds
  for (var i = 0; i < 2; i++) {
    var secSince = ((millis() / 1000) + i * phase / 2) % phase;
    var tSize = map(secSince, 0, phase, 40, 2);
    var xOffset = map(secSince, 0, phase, 0, 100);
    var yOffset = map(secSince, 0, phase, 0, -200);
    textSize(tSize);
    text("Z", width/2 + xOffset, height/2 + yOffset);
  }
}
