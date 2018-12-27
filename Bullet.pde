class Bullet extends Entity {
  Bullet(int x, int y, int w, int h, ObjectHandler objectHandler, InputHandler inputHandler, int mouseX, int mouseY) {
    super(x, y, w, h, ObjectID.BULLET, objectHandler, inputHandler);
    xVel = (mouseX - x * w) / 20;
    yVel = (mouseY - y * h) / 20;  //<>//
  }

  void update() {
    x += xVel; //<>//
    y += yVel;
    if (isCollision()) {
      objectHandler.removeBullet(this);
    }
  }

  void draw() {
    fill(0, 0, 0);  //<>//
    ellipse(x, y, 8, 8);
  }
}
