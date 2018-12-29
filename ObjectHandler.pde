import java.util.List;
import java.util.ArrayList;

class ObjectHandler {

  List<Entity> entities = new ArrayList<Entity>();
  Player player = null;

  InputHandler inputHandler;
  Sprites sprites;
  
  ObjectHandler(InputHandler inputHandler, Sprites sprites) {
    this.inputHandler = inputHandler;
    this.sprites = sprites;
  }

  void addBlock(int x, int y, int w, int h) {
    Block block = new Block(x, y, w, h, this, sprites);
    entities.add(block);
  }

  void addPotion(int x, int y, int w, int h) {
    Potion potion = new Potion(x, y, w, h, this, sprites);
    entities.add(potion);
  }

  void addEnemy(int x, int y, int w, int h) {
    Enemy enemy = new Enemy(x, y, w, h, this, sprites);
    entities.add(enemy);
  }

  void addCrate(int x, int y, int w, int h) {
    Crate enemy = new Crate(x, y, w, h, this, sprites);
    entities.add(enemy);
  }

  void addBullet(float x, float y, int w, int h, float mouseX, float mouseY) {
    Bullet bullet = new Bullet(x, y, w, h, this, sprites, mouseX, mouseY);
    entities.add(bullet);
  }

  void setPlayer(int x, int y, int w, int h) {
    player = new Player(x, y, w, h, this, inputHandler, sprites);
    entities.add(player);
  }

  void removeEntity(Entity entity) {
    entities.remove(entity);
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
