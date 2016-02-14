class Bar {
  float x;
  color q;
  Bar (float x_, color q_) {
    x = x_;
    q = q_;
  }
  void displayBar() {

    for (int y = height/3; y < 2*height/3; y += height/18) {
      rectMode(CORNER);
      noStroke();
      fill(q);
      rect(x, y, 3, 5);
      rect(x+10, y, 3, 5);
    }
  }
  void displayBar2 () {

    for (int y = height/3; y < 2*height/3; y += height/18) {
      rectMode(CORNER);
      noStroke();
      fill(q, 0, 0);
      rect(x, y, 3, 5);
      rect(x+10, y, 3, 5);
    }
  }
}