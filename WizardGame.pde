int gameScreen = 0;

ObjectHandler objectHandler;

InputHandler inputHandler;

Camera camera;

static final int TILE_SIZE = 32;

void setup() {
  size(640, 480, P2D);
  camera = new Camera(0, 0, TILE_SIZE, width, height);
  inputHandler = new InputHandler();
  objectHandler = new ObjectHandler(inputHandler);
  PImage mapImg = loadImage("level1map.png");
  mapImg.loadPixels();
  loadMap(mapImg.pixels, mapImg.width, mapImg.height, TILE_SIZE, TILE_SIZE, objectHandler);
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

void initScreen() {
  background(0);
  textAlign(CENTER);
  text("Click to start", height / 2, width / 2);
}

void gameScreen() {
  background(255);
  objectHandler.update();
  camera.update(objectHandler.player);
  translate(-camera.x, -camera.y);
  objectHandler.draw();
  translate(camera.x, camera.y);
}

void gameOverScreen() {
  background(255);
}

public void mousePressed(MouseEvent event) {
  if (gameScreen == 0) {
    startGame();
  } else {
    Entity player = objectHandler.player;
    float bulletXPosition = player.x + player.w / 2;
    float bulletYPosition = player.y + player.h / 2;
    float targetXPosition = event.getX() + camera.x;
    float targetYPosition = event.getY() + camera.y;
    objectHandler.addBullet(bulletXPosition, bulletYPosition, TILE_SIZE, TILE_SIZE, targetXPosition, targetYPosition);
  }
}

void startGame() {
  gameScreen = 1;
}

void keyPressed() {
  inputHandler.keyPressed(keyCode, key);
}

void keyReleased() {
  inputHandler.keyReleased(keyCode, key);
}
