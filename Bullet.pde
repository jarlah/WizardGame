class Bullet extends Entity { //<>//
  double speed = 10.0;

  Bullet(float x, float y, int w, int h, ObjectHandler objectHandler, InputHandler inputHandler, float mouseX, float mouseY) {
    super(x, y, w, h, ObjectID.BULLET, objectHandler, inputHandler);
    double angle = Math.atan2(mouseY - y, mouseX - x);
    xVel = (float) (speed * Math.cos(angle));
    yVel = (float) (speed * Math.sin(angle));
  }

  void update() {
    x += xVel;
    y += yVel;
    Entity entity = getCollidingEntity();
    if (entity != null) {
      if (entity instanceof Block) {
        hit();
      }
      if (entity instanceof Enemy) {
        ((Enemy)entity).hit();
        hit();
      }
    }
  }

  void draw() {
    fill(0, 0, 0);
    ellipse(x, y, 8, 8);
  }

  void hit() {
    objectHandler.removeBullet(this);
  }
}
