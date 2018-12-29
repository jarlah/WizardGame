class InputHandler {
  boolean up, down, left, right;

  void keyPressed(int keyCode, char key) {
    input(keyCode, key, true);
  }

  void keyReleased(int keyCode, char key) {
    input(keyCode, key, false);
  }

  void input(int keyCode, char key, boolean enable) {
    if (keyCode == UP || key == 'w') {
      up = enable;
    }
    if (keyCode == DOWN || key == 's') {
      down = enable;
    }
    if (keyCode == LEFT || key == 'a') {
      left = enable;
    }
    if (keyCode == RIGHT || key == 'd') {
      right = enable;
    }
  }
}
