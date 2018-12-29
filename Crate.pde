class Crate extends Entity {
  int ammo = 30;
  
  Crate(float x, float y, int w, int h, ObjectHandler objectHandler, Sprites sprites) {
    super(x, y, w, h, ObjectID.CRATE, objectHandler, sprites);
  }

  void update() {
  }

  void draw() {
    image(sprites.getCrate(), x, y);
  }

  void onCollision(Entity crate) {
  }
}
