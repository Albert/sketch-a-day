var numOfRotations = 6;

function setup() {
  createCanvas(windowWidth, windowHeight);
  noStroke();
  colorMode(HSB);
  fill(255);
  stroke(0);
}

function draw() {
  background(0, 5);
  strokeWeight(10);

  stroke((millis() / 5) % 255, 255, 255);
  for (var i = 0; i < numOfRotations; i++) {
    push();
    translate(width/2, height/2);
    rotate(i * TAU/numOfRotations);
    line(mouseX - width/2, mouseY - height/2, pmouseX - width/2, pmouseY - height/2);
    pop();
  }
  if (millis() < 10000) {
    strokeWeight(1);
    textSize(40);
    text('"space": add a point', 0, height - 60);
    text('any other key: remove a point', 0, height - 20);
  }
}

function keyPressed() {
  background(255); /* this line of code turned out to be way prettier than I imagined */
  if (key == ' ') {
    numOfRotations ++;
  } else if (numOfRotations > 1) {
    numOfRotations --;
  }
}
