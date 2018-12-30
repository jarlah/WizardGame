import java.util.function.Consumer;

class ScreenHandler {
  Screen currentScreen;
  ObjectHandler objectHandler;
  Camera camera;
  ScreenUpdater updater;

  ScreenHandler(ObjectHandler objectHandler, Camera camera) {
    this.objectHandler = objectHandler;
    this.camera = camera;
    this.updater = new ScreenUpdater();
    this.currentScreen = new InitScreen(updater, objectHandler, camera);
  }

  void update() {
    this.currentScreen.update();
  }

  void draw() {
    this.currentScreen.draw();
  }

  class ScreenUpdater implements Consumer<Integer> {
    void accept(Integer screen) {
      if (screen == 0) {
        currentScreen = new InitScreen(this, objectHandler, camera);
      }
      if (screen == 1) {
        currentScreen = new GameScreen(this, objectHandler, camera);
      }
      if (screen == 2) {
        currentScreen = new GameOverScreen(this, objectHandler, camera);
      }
    }
  }
}
