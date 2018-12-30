class Game {
  InputHandler inputHandler;
  ObjectHandler objectHandler;
  Sprites sprites;
  Camera camera;
  ScreenHandler screenHandler;

  final int width, height;

  Game(int tileSize, int width, int height) {
    this.width = width;
    this.height = height;
    sprites = new Sprites("spritesheet.png", tileSize);
    inputHandler = new InputHandler();
    objectHandler = new ObjectHandler(this.inputHandler, this.sprites);
    camera = new Camera(0, 0, this.width, this.height);
    screenHandler = new ScreenHandler(objectHandler, camera);
    PImage mapImg = loadImage("level2map.png");
    mapImg.loadPixels();
    loadMap(mapImg.pixels, mapImg.width, mapImg.height, tileSize, tileSize, this.objectHandler);
  }

  void update() {
    screenHandler.update();
  }

  void draw() {
    screenHandler.draw();
  }

  void mousePressed(MouseEvent event) {
    if (screenHandler.currentScreen instanceof InitScreen) {
      screenHandler.updater.accept(1);
    } else if (screenHandler.currentScreen instanceof GameScreen) {
      ((GameScreen)screenHandler.currentScreen).fire(event);
    }
  }

  void keyPressed(int keyCode, char key) {
    inputHandler.keyPressed(keyCode, key);
  }

  void keyReleased(int keyCode, char key) {
    inputHandler.keyReleased(keyCode, key);
  }
}
