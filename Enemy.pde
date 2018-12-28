import java.util.Random;

class Enemy extends Entity {
  Random random = new Random();

  Enemy(int x, int y, int w, int h, ObjectHandler objectHandler, InputHandler inputHandler) {
    super(x, y, w, h, ObjectID.ENEMY, objectHandler, inputHandler);
  }

  void update() {
    tryAdvance();
    
    int choose = random.nextInt(10);
    if (choose == 0) {
      xVel = (random.nextInt(8) - 4);
      yVel = (random.nextInt(8) - 4);
    }
  }

  void draw() {
    fill(18, 233, 23);
    rect(x, y, w, h);
  }
}
