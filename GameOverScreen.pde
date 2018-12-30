class GameOverScreen extends Screen {

  GameOverScreen(Consumer<Integer> changeScreen, ObjectHandler objectHandler, Camera camera) {
    super(changeScreen, objectHandler, camera);
  }

  void update() {
  }

  void draw() {
    background(255);
    textAlign(CENTER);
    text("Game over", height / 2, width / 2);
  }
}
