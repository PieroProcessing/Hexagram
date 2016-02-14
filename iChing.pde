Timer[] timer = new Timer [64];
Bar[] bars = new Bar[64];
Timer t;

void setup() {
  size (1292, 129);
  smooth();
  // noStroke();
  frameRate(5);
  t=new Timer (10, 1000, 0);
  //  t.start();
  for (int i = 0; i<bars.length; i++) {
    float a = width/64;
    a = a*i;
    bars[i] = new Bar(a+8, 255);
  }
  for ( int i = 0; i < timer.length; i++) {
    float a = width/64;
    a = a*i;
    timer [i] = new Timer (1, 50, a+11);
  }
}
void draw () {
  background (0);
  float f=random(100);
  for (int i = 0; i < timer.length; i++) {
    if ( t.isFinished()) {
      bars[i].displayBar();
      timer[i].displayTimer();
    } 
    println (timer[i].isFinished());
  }
  for (int i = 0; i < timer.length; i++) {
    if ( f >timer[i].controlloPresenza()) {
      bars[i].displayBar2 ();
      timer[i].displayTimer2();
    }
  }
}