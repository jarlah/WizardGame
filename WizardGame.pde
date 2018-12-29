int gameScreen = 0; //<>// //<>//

ObjectHandler objectHandler;

InputHandler inputHandler;

Camera camera;

PImage[][] sprites;

static final int TILE_SIZE = 32;

void setup() {
  fullScreen(P2D);
  camera = new Camera(0, 0, TILE_SIZE, width, height);
  sprites = loadSprites();
  inputHandler = new InputHandler();
  objectHandler = new ObjectHandler(inputHandler);
  PImage mapImg = loadImage("level2map.png");
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

public PImage[][] loadSprites() {

  int spw = 32;
  int sph = 32;

  PImage spriteBlock = loadImage("spritesheet.png");
  PImage[][] sprites = new PImage[spriteBlock.width / spw][spriteBlock.height / sph];
  for (int x=0; x < spriteBlock.width / spw; x++) {
    for (int y=0; y < spriteBlock.height / sph; y++) {
      sprites[x][y] = spriteBlock.get(spw * (int)x, sph * (int)y, spw, sph);
    }
  }
  
  return sprites;
}

void gameOverScreen() {
  background(255);
}

public void mousePressed(MouseEvent event) {
  if (gameScreen == 0) {
    startGame();
  } else {
    float targetXPosition = event.getX() + camera.x;
    float targetYPosition = event.getY() + camera.y;
    objectHandler.player.fire(targetXPosition, targetYPosition);
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
