class Block extends Entity {
  Block(float x, float y, int w, int h, ObjectHandler objectHandler, Sprites sprites) {
    super(x, y, w, h, ObjectID.BLOCK, objectHandler, sprites);
  }

  void update() {
  }

  void draw() {
    image(sprites.getBlock(), x, y);
  }

  void onCollision(Entity crate) {
  }
}
