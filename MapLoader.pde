void loadMap(int[] pixels, int w, int h, int tw, int th, ObjectHandler handler) {
  for (int x = 0; x < w; x++) {
    for (int y = 0; y < h; y++ ) {
      int loc = x + y * w;
      float c = pixels[loc];
      if (c == 0xFFFF0000) {
        handler.addBlock(x, y, tw, th);
      }
      if (c == 0xFF0000FF) {
        handler.setPlayer(x, y, tw, th);
      }
      if (c == 0xFF00FF00) {
        handler.addEnemy(x, y, tw, th); //<>// //<>// //<>// //<>//
      }
    }
  }
}
