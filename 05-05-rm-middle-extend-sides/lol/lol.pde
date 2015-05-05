int windowWidth = 300;
int windowHeight = 300;

void setup() {
  size(windowWidth, windowHeight);
  frame.setResizable(true);
}

void draw() {
  windowWidth += 2;
  windowHeight -= 2;
  frame.setSize(windowWidth, windowHeight);
  frame.setLocation((displayWidth - windowWidth) / 2, (displayHeight - windowHeight) / 2);
  background(0);
}
