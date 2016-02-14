
class Timer {
  float x;
  float y;
  int maxTime;
  int minTime;
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last


  Timer (int minTime_, int maxTime_, float xpose) {
    minTime = minTime_;
    maxTime = maxTime_;
    x = xpose;
  }
  void displayTimer () {
    pushMatrix();
    for (int y = height/3; y < (int)2*height/3; y += (int)height/18) {
      rectMode(CORNER);
      noStroke();
      // fill (255);
      fill(randomizer());
      rect(x, y, 7, 5);
    }
    popMatrix();
  }
  void displayTimer2 () {
    pushMatrix();
    for (int y = height/3; y < (int)2*height/3; y += (int)height/18) {
      rectMode(CORNER);
      noStroke();
      // fill (255);
      fill(randomizer2(), 0, 0);
      rect(x, y, 7, 5);
    }
    popMatrix();
  }
  int tempoAlterno () {
    int z = int (random (minTime, maxTime));
    return z;
  }
  int isFinishing() {
    // Check how much time has passed
    int passedTime = millis()- savedTime;

    return passedTime;
  }
  boolean isFinished() {
    // Check how much time has passed
    int passedTime = millis()- savedTime;

    return true;
  }
  void fil() {
    // fill(255);

    fill(randomizer ());
  }
  float controlloPresenza() {
    //float m = dist(mouseX,mouseY,x,y);
    float m = abs (mouseX-x);
    return m;
  }
  float randomizer () {
    float c = random(-1, 1);
    if (c<0) { 
      c = 0;
    } else {
      c = 255;
    }
    return c;
  }
  float randomizer2 () {
    float c = random(-1, 1);
    if (c<0) { 
      c = 0;
    } else {
      c = 255;
    }
    return c;
  }
  void start() {
    savedTime = millis();
  }
}