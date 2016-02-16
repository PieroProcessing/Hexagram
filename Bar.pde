class Bar {
  float SPACE = height/24;
  int SIZE=6;

  float x;
  float lerpValue;

  Bar (float x_) {
    rectMode(CORNER);
    noStroke();
    x = x_;
    for (int y = 0; y < SIZE; y++) {      
      prevColor.append(randomizer());
    }
  }
  void sxBar() {
    for (int y = 0; y < SIZE; y++) {
      fill(255);
      rect(x, y*SPACE, 5, 3);
    }
  }
  void dxBar () {
    for (int y = 0; y < SIZE; y++) {
      fill(255);
      rect(x+10, y*SPACE, 5, 3);
    }
  }
  void setCxBar(int i) {
    for (int y = 0; y < SIZE; y++) {
      int pos = i*6+y;                    // the algoritm to find the x and the y of each hexagram
      fill(prevColor.get(pos));
      rect(x+5, y*SPACE, 5, 3);
    }
  }
  void displayCxBar(int i) {
    for (int y = 0; y < SIZE; y++) {
      int pos = i*6+y;
      
      // set the transitions of colors
      float j =lerp(prevColor.get(pos), aktColor.get(pos), transition());  
      if (check()) {
        fill(j, 0, 0);
      } else {
        fill(j);
      }
      rect(x+5, y*SPACE, 5, 3);
      prevColor.set(pos, j);
    }
  }
  void changeColor() {
    for (int y = 0; y < SIZE; y++) {      
      aktColor.append(randomizer());
    }
  }
  void meddle (int i) {
    for (int y = 0; y < SIZE; y++) {
      int pos = i*6+y;
      aktColor.set(pos, randomizer());
    }
  }
  float transition() {
    if (check()) { 
      lerpValue = 1;
    } else { 
      lerpValue = 0.02;
    }
    return lerpValue;
  }
  boolean check() {
    boolean tip = false;
    PVector mouse = new PVector (mouseX, mouseY);
    for (int y = 0; y < SIZE; y++) {
      PVector point = new PVector (x+5, y * SPACE + height/3);
      float dist = mouse.dist(point);  
      if (dist< 6) {
        tip = true;
        break;
      } else {
        tip = false;
      }
    }
    return tip;
  }
}