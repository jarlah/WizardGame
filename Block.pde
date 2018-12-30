class Block extends Entity {
  int health = 100;

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

  void hit() {
    health -= 1;
    if (health <= 0) { //<>//
      objectHandler.removeEntity(this);
    }
  }
}
