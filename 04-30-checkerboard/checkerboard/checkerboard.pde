float checkSize = 80;

void setup() {
  size(800, 800);
  noStroke();
}

void draw() {
  int xNum = (floor(mouseX / checkSize) % 2 == 0) ? 1 : 0;
  int yNum = (floor(mouseY / checkSize) % 2 == 0) ? 1 : 0;
  int oneOrZero = xNum + yNum;
  if (oneOrZero == 2) {oneOrZero = 0;}

//int oneOrZero = (floor((millis() / 500) % 2) == 0) ? 1: 0;
  
  int iCounter = 0;
  for (int i = 0; i < width; i += checkSize) {
    iCounter ++;
    int jCounter = 0;
    for (int j = 0; j < height; j += checkSize) {
      jCounter ++;
      if ((iCounter + jCounter) % 2 == oneOrZero) {
        fill(255);
      } else { 
        fill(0);
      }
      rect(i, j, checkSize, checkSize);
    }
  }
}
