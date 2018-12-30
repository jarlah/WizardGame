class Potion extends Entity {
  int health = 20;

  Potion(float x, float y, int w, int h, ObjectHandler objectHandler, Sprites sprites) {
    super(x, y, w, h, ObjectID.POTION, objectHandler, sprites);
  }

  void update() {
  }

  void draw() {
    image(sprites.getPotion(), x, y);
  }

  void onCollision(Entity crate) {
  }
}
