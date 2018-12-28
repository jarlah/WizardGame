class Block extends Entity {
  Block(float x, float y, int w, int h, ObjectHandler objectHandler, InputHandler inputHandler) {
    super(x, y, w, h, ObjectID.BLOCK, objectHandler, inputHandler);
  }

  void update() {
  }

  void draw() {
    fill(125, 108, 108);
    rect(x, y, w, h);
  }
}
