class Block extends Entity {
  Block(float x, float y, int w, int h, ObjectHandler objectHandler, InputHandler inputHandler) {
    super(x, y, w, h, ObjectID.BLOCK, objectHandler, inputHandler);
  }

  void update() {
  }

  void draw() {
    image(sprites[4][7], x, y);
  }

  void onCollision(Entity crate) {
  }
}
