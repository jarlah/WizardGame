import java.util.List;
import java.util.ArrayList;

class ObjectHandler {

  List<Entity> blocks = new ArrayList<Entity>();
  List<Entity> enemies = new ArrayList<Entity>();
  List<Entity> bullets = new ArrayList<Entity>();

  Entity player = null;

  InputHandler inputHandler;

  ObjectHandler(InputHandler inputHandler) {
    this.inputHandler = inputHandler;
  }

  void addBlock(int x, int y, int w, int h) {
    blocks.add(new Block(x, y, w, h, this, inputHandler));
  }

  void addEnemy(int x, int y, int w, int h) {
    enemies.add(new Enemy(x, y, w, h, this, inputHandler));
  }

  void addBullet(int x, int y, int w, int h, int mouseX, int mouseY) {
    bullets.add(new Bullet(x, y, w, h, this, inputHandler, mouseX, mouseY)); //<>//
  }

  void setPlayer(int x, int y, int w, int h) {
    player = new Player(x, y, w, h, this, inputHandler);
  }

  void removeBullet(Entity bullet) {
    bullets.remove(bullet);
  }

  void update() {
    List<Entity> objects = getObjects();
    for (Entity object : objects) {
      object.update();
    }
  }

  void draw() {
    List<Entity> objects = getObjects();
    for (Entity object : objects) {
      object.draw();
    }
  }

  List<Entity> getObjects() {
    List<Entity> objects = new ArrayList<Entity>();
    objects.addAll(blocks);
    objects.addAll(enemies);
    objects.addAll(bullets);
    objects.add(player);
    return objects;
  }
}
