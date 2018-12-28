class Bullet extends Entity {
  Bullet(int x, int y, int w, int h, ObjectHandler objectHandler, InputHandler inputHandler, int mouseX, int mouseY) {
    super(x, y, w, h, ObjectID.BULLET, objectHandler, inputHandler);
    xVel = (mouseX - x * w) / 20;
    yVel = (mouseY - y * h) / 20;
  }

  void update() {
    x += xVel;
    y += yVel;
    Entity entity = getCollidingEntity();
    if (entity != null) {
      if (entity instanceof Block) {
        objectHandler.removeBullet(this);
      }
      if (entity instanceof Enemy) {
        ((Enemy)entity).hit();  //<>//
        objectHandler.removeBullet(this);
      }
    }
  }

  void draw() {
    fill(0, 0, 0);
    ellipse(x, y, 8, 8);
  }
}
