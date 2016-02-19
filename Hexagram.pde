iChing observe; //<>// //<>// //<>//

FloatList prevColor = new FloatList();
FloatList aktColor  = new FloatList();

void setup() {
  size (640, 480);
 // frameRate(25);
  observe = new iChing();
}
void draw () {
/*
//  background(0);
  rectMode(CENTER);
  noFill();
  stroke(255);
  rect(width/2,height/2,width-10,height-10);
  */
  observe.cleromancy();
  observe.interaction();
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