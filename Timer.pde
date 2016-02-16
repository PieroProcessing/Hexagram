class Timer {

  int maxTime;
  int savedTime; // When Timer started

  Timer ( int maxTime_) {

    maxTime = maxTime_;
  }
  void start() {
    savedTime = millis();
  }
  int check() {
    int passedTime = millis()- savedTime;
    return passedTime;
  }
  boolean isFinished() {
    if ( check() > maxTime) {
      start();
      return true;
    } else {
      return false;
    }
  }
}