class Crate extends Entity {
  int ammo = 30;
  
  Crate(float x, float y, int w, int h, ObjectHandler objectHandler, InputHandler inputHandler) {
    super(x, y, w, h, ObjectID.CRATE, objectHandler, inputHandler);
  }

  void update() {
  }

  void draw() {
    fill(242, 255, 98);
    rect(x, y, w, h);
  }

  void onCollision(Entity crate) {
  }
}
