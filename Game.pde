class Game {
  InputHandler inputHandler;
  ObjectHandler objectHandler;
  Sprites sprites;
  Camera camera;

  InitScreen initScreen;
  GameScreen gameScreen;
  GameOverScreen gameOverScreen;

  int gameScreenCode = 0;

  final int width, height;

  Game(int tileSize, int width, int height) {
    this.width = width;
    this.height = height;
    sprites = new Sprites("spritesheet.png", tileSize);
    inputHandler = new InputHandler();
    objectHandler = new ObjectHandler(this.inputHandler, this.sprites);
    camera = new Camera(0, 0, this.width, this.height);

    Consumer<Integer> screenUpdater = new Consumer<Integer>() {
      void accept(Integer screen) {
        gameScreenCode = screen;
      }
    };

    initScreen = new InitScreen(screenUpdater, objectHandler, camera);
    gameScreen = new GameScreen(screenUpdater, objectHandler, camera);
    gameOverScreen = new GameOverScreen(screenUpdater, objectHandler, camera);

    PImage mapImg = loadImage("level2map.png");
    mapImg.loadPixels();
    loadMap(mapImg.pixels, mapImg.width, mapImg.height, tileSize, tileSize, this.objectHandler);
  }

  void update() {
    if (gameScreenCode == 0) {
      initScreen.update();
    }
    if (gameScreenCode == 1) {
      gameScreen.update();
    }
    if (gameScreenCode == 2) {
      gameOverScreen.update();
    }
  }

  void draw() {
    if (gameScreenCode == 0) {
      initScreen.draw();
    }
    if (gameScreenCode == 1) {
      gameScreen.draw();
    }
    if (gameScreenCode == 2) {
      gameOverScreen.draw();
    }
  }

  void mousePressed(MouseEvent event) {
    if (gameScreenCode == 0) {
      gameScreenCode = 1;
    } else if (gameScreenCode == 1) {
      gameScreen.fire(event);
    }
  }

  void keyPressed(int keyCode, char key) {
    inputHandler.keyPressed(keyCode, key);
  }

  void keyReleased(int keyCode, char key) {
    inputHandler.keyReleased(keyCode, key);
  }
}
