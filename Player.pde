class Player extends Entity {

  int ammo = 100;

  Player(float x, float y, int w, int h, ObjectHandler objectHandler, InputHandler inputHandler) {
    super(x, y, w, h, ObjectID.PLAYER, objectHandler, inputHandler);
  }

  void update() {    
    tryAdvance();

    if (inputHandler.up) yVel = -5;
    else if (!inputHandler.down) yVel = 0;

    if (inputHandler.down) yVel = 5;
    else if (!inputHandler.up) yVel = 0;

    if (inputHandler.right) xVel = 5;
    else if (!inputHandler.left) xVel = 0;

    if (inputHandler.left) xVel = -5;
    else if (!inputHandler.right) xVel = 0;
  }

  void draw() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }

  void onCollision(Entity crate) {
    if (crate.objectId == ObjectID.CRATE) {
      ammo += ((Crate) crate).ammo;
      objectHandler.removeCrate(crate);
    }
  }

  void fire(float mouseX, float mouseY) {
    if (ammo > 0) {
      float bulletXPosition = x + w / 2;
      float bulletYPosition = y + h / 2;
      float targetXPosition = mouseX;
      float targetYPosition = mouseY;
      objectHandler.addBullet(bulletXPosition, bulletYPosition, 8, 8, targetXPosition, targetYPosition);
      ammo--;
    }
  }
}
