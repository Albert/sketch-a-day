void setup() {
  String sentence = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  String[] words = split(sentence, ' ');

  colorMode(HSB);

  size(800, 800);
  background(0);
  textSize(40);

  for (int i = 0; i < words.length; i++) {
    float x = random(0, 700);
    float y = random(0, 780);
    float hue = random(0, 255);
    float echoes = 5;
    float offset = 5;
    for (int j = 0; j < echoes; j++) {
      fill(hue, 255, 255, (255 * ((float) j / echoes)));
      text(words[i], x - j * offset, y - j * offset);
    }
  }

}
