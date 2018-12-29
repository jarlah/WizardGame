class Game {
  InputHandler inputHandler;
  ObjectHandler objectHandler;
  Sprites sprites;
  Camera camera;
  int gameScreen = 0;

  final int width, height;

  public Game(int tileSize, int width, int height) {
    this.width = width;
    this.height = height;
    sprites = new Sprites("spritesheet.png", tileSize);
    inputHandler = new InputHandler();
    objectHandler = new ObjectHandler(this.inputHandler, this.sprites);
    PImage mapImg = loadImage("level2map.png");
    mapImg.loadPixels();
    camera = new Camera(0, 0, this.width, this.height);
    loadMap(mapImg.pixels, mapImg.width, mapImg.height, tileSize, tileSize, this.objectHandler);
  }

  void draw() {
    if (gameScreen == 0) {
      initScreen();
    }
    if (gameScreen == 1) {
      gameScreen();
    }
    if (gameScreen == 2) {
      gameOverScreen();
    }
  }

  private void initScreen() {
    background(0);
    textAlign(CENTER);
    text("Click to start", height / 2, width / 2);
  }

  private void gameScreen() {
    background(99);
    objectHandler.update();
    camera.update(objectHandler.player);
    translate(-camera.x, -camera.y);
    objectHandler.draw();
    translate(camera.x, camera.y);
    fill(208);
    rect(0, 0, 120, 32);
    fill(0);
    textSize(14);
    text("Bullets: " + objectHandler.player.ammo, 50, 18);
  }

  private void gameOverScreen() {
    background(255);
  }

  private void startGame() {
    gameScreen = 1;
  }

  public void mousePressed(MouseEvent event) {
    if (gameScreen == 0) {
      startGame();
    } else {
      objectHandler.player.fire(event.getX() + camera.x, event.getY() + camera.y);
    }
  }

  void keyPressed(int keyCode, char key) {
    inputHandler.keyPressed(keyCode, key);
  }

  void keyReleased(int keyCode, char key) {
    inputHandler.keyReleased(keyCode, key);
  }
}