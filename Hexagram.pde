iChing observe; //<>//

FloatList prevColor = new FloatList();
FloatList aktColor  = new FloatList();

void setup() {
  size (1292, 129);
 // frameRate(25);
  observe = new iChing();
}
void draw () {

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