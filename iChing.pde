class iChing {

  Bar[] bars = new Bar[64];
  Timer t;

  // ambient variable
  float a;

  iChing() {

    t= new Timer(1000);
    t.start();

    a = width/64;

    //init the 64 bar in the window
    for (int i = 0; i<bars.length; i++) {
      float tempV = a*i;
      bars[i] = new Bar(tempV+8);
    }
    // to store the actual data in memory for the lerp algorithm
    storeColor();

    background (0);
    translate(0, height/3);
    for (int i = 0; i<bars.length; i++) {
      //set the bars
      bars[i].sxBar();
      bars[i].dxBar();
      bars[i].setCxBar(i); // set the central bar with the index position = i
    }
  }
  void interaction() {
    pushMatrix();
    translate(0, height/3);
    for (int i = 0; i<bars.length; i++) {
      if (bars[i].check()) {  // check if the mouse is over
        bars[i].meddle(i);   //reset new color for that bar and change velocity
      }
      bars[i].displayCxBar(i); 
    }
    popMatrix();
  }
  void cleromancy() {
    if (t.isFinished()) {
      clearColor();             // clean the array
      formatColor();            // set the new value
    }
  }
  void clearColor() {
    aktColor.clear();
  }
  void formatColor () {
    for (int i = 0; i<bars.length; i++) {
      bars[i].changeColor();    // the way to put random value to each bar
    }
  }

  void storeColor() {
    for (int i=0; i<prevColor.size(); i++) {
      aktColor.append(prevColor.get(i));
    }
  }
}