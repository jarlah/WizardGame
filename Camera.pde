class Camera {

  final int windowWidth;
  final int windowHeight;

  float x;
  float y;

  Camera(float x, float y, int windowWidth, int windowHeight) {
    this.x = x;
    this.y = y;
    this.windowWidth = windowWidth;
    this.windowHeight = windowHeight;
  }

  void update(Entity object) {
    x += ((object.x - x) - windowWidth / 2) * 0.05f;
    y += ((object.y - y) - windowHeight / 2) * 0.05f;

    if (x <= 0) {
      x = 0;
    }

    if (y <= 0) {
      y = 0;
    }
  }
}
