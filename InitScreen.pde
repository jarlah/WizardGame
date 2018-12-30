class InitScreen extends Screen {

  InitScreen(Consumer<Integer> changeScreen, ObjectHandler objectHandler, Camera camera) {
    super(changeScreen, objectHandler, camera);
  }

  void update() {
  }

  void draw() {
    background(0);
    fill(255);
    textAlign(CENTER);
    text("Click to start", height / 2, width / 2);
  }
}
