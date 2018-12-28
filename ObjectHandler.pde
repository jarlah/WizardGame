import java.util.List; //<>// //<>//
import java.util.ArrayList;

class ObjectHandler {

  List<Entity> entities = new ArrayList<Entity>();
  List<Entity> blocks = new ArrayList<Entity>();
  List<Entity> enemies = new ArrayList<Entity>();
  List<Entity> bullets = new ArrayList<Entity>();
  List<Entity> crates = new ArrayList<Entity>();
  Player player = null;

  InputHandler inputHandler;

  ObjectHandler(InputHandler inputHandler) {
    this.inputHandler = inputHandler;
  }

  void addBlock(int x, int y, int w, int h) {
    Block block = new Block(x, y, w, h, this, inputHandler);
    blocks.add(block);
    entities.add(block);
  }

  void addEnemy(int x, int y, int w, int h) {
    Enemy enemy = new Enemy(x, y, w, h, this, inputHandler);
    enemies.add(enemy);
    entities.add(enemy);
  }

  void addCrate(int x, int y, int w, int h) {
    Crate enemy = new Crate(x, y, w, h, this, inputHandler);
    crates.add(enemy);
    entities.add(enemy);
  }

  void addBullet(float x, float y, int w, int h, float mouseX, float mouseY) {
    Bullet bullet = new Bullet(x, y, w, h, this, inputHandler, mouseX, mouseY);
    bullets.add(bullet);
    entities.add(bullet);
  }

  void setPlayer(int x, int y, int w, int h) {
    player = new Player(x, y, w, h, this, inputHandler);
    entities.add(player);
  }

  void removeBullet(Entity bullet) {
    bullets.remove(bullet);
    entities.remove(bullet);
  }

  void removeEnemy(Entity enemy) {
    enemies.remove(enemy);
    entities.remove(enemy);
  }

  void removeCrate(Entity crate) {
    crates.remove(crate);
    entities.remove(crate);
  }

  void update() {
    List<Entity> objects = entities;
    for (int i = 0; i < objects.size(); i++) {
      if (i >= objects.size()) {
        break;
      }
      objects.get(i).update();
    }
  }

  void draw() {
    List<Entity> objects = entities;
    for (int i = 0; i < objects.size(); i++) {
      if (i >= objects.size()) {
        break;
      }
      objects.get(i).draw();
    }
  }
}
