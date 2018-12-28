class Player extends Entity {
  Player(float x, float y, int w, int h, ObjectHandler objectHandler, InputHandler inputHandler) {
    super(x, y, w, h, ObjectID.PLAYER, objectHandler, inputHandler);
  }

  void update() {    
    tryAdvance();

    if (inputHandler.up) yVel = -5;
    else if (!inputHandler.down) yVel = 0;

    if (inputHandler.down) yVel = 5;
    else if (!inputHandler.up) yVel = 0;

    if (inputHandler.right) xVel = 5;
    else if (!inputHandler.left) xVel = 0;

    if (inputHandler.left) xVel = -5;
    else if (!inputHandler.right) xVel = 0;
  }

  void draw() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
}
