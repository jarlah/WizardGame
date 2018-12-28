class Camera {

  private final int windowWidth;
  private final int windowHeight;
  private final int tileHeight;
  private final int tileWidth;

  private float x, y;

  Camera(float x, float y, final int tileWidth, final int tileHeight, int windowWidth, int windowHeight) {
    this.x = x;
    this.y = y;
    this.tileWidth = tileWidth;
    this.tileHeight = tileHeight;
    this.windowWidth = windowWidth;
    this.windowHeight = windowHeight;
  }

  public void update(Entity object) {
    x += ((object.x - x) - (float) windowWidth / 2) * 0.05f;
    y += ((object.y - y) - (float) windowHeight / 2) * 0.05f;

    if (x <= 0) {
      x = 0;
    }
    if (x >= windowWidth + tileWidth) {
      x = windowWidth + tileWidth;
    }
    if (y <= 0) {
      y = 0;
    }
    if (y >= windowHeight) {
      y = windowHeight;
    }
  }
}
