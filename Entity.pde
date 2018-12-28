abstract class Entity {
  int x, y, w, h, xVel, yVel;
  ObjectID objectId;
  ObjectHandler objectHandler;
  InputHandler inputHandler;

  Entity(int x, int y, int w, int h, ObjectID objectId, ObjectHandler objectHandler, InputHandler inputHandler) {
    this.x = x * w;
    this.y = y * h;
    this.w = w;
    this.h = h;
    this.objectId = objectId;
    this.objectHandler = objectHandler;
    this.inputHandler = inputHandler;
  }

  abstract void update();

  abstract void draw();

  public boolean intersects(Entity other) {
    return other.w > 0 && other.h > 0 && w > 0 && h > 0
      && other.x < x + w && other.x + other.w > x
      && other.y < y + h && other.y + other.h > y;
  }

  Entity getCollidingEntity() {
    List<Entity> objects = this.objectHandler.entities;
    for (int i = 0; i < objects.size(); i++) {
      Entity gameObject = objects.get(i);
      if (!gameObject.equals(this) && intersects(gameObject)) {
        return gameObject;
      }
    }
    return null;
  }

  boolean isCollision() {
    return getCollidingEntity() != null;
  }
  
  void tryAdvance() {
    int oldX = x;
    x += xVel;
    if (isCollision()) {
      x = oldX;
    } 
    
    int oldY = y;
    y += yVel;
    if (isCollision()) {
      y = oldY;
    } 
  }
}
