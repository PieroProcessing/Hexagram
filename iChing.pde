class iChing {

  Bar[][] bars = new Bar[8][8];
  Timer t;

  // ambient variable
  int a, b;
  int lengthB=8;

  iChing() {

    t= new Timer(5000);
    t.start();

    a = width/8;
    b = height/8;

    //init the 64 bar in the window
    for (int i = 0; i<lengthB; i++) {
      for (int j = 0; j<lengthB; j++) {
        bars[i][j] = new Bar(a*i, b*j);
      }
    }
    // to store the actual data in memory for the lerp algorithm
    storeColor();

    background (0);
    translate(width/64, height/100);
    for (int i = 0; i<lengthB; i++) {
      for (int j = 0; j<lengthB; j++) {
        //set the bars
        bars[i][j].sxBar();
        bars[i][j].dxBar();
      }
    }
  }
  void interaction() {
    pushMatrix();
    translate(width/64, height/100);
    for (int i = 0; i<lengthB; i++) {
      for (int j = 0; j<lengthB; j++) {
        if (bars[i][j].check()) {  // check if the mouse is over
          bars[i][j].meddle(i, j);   //reset new color for that bar and change velocity
        }
        bars[i][j].displayCxBar(i, j);
      }
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
    for (int i = 0; i<lengthB; i++) {
      for (int j = 0; j<lengthB; j++) {
        bars[i][j].changeColor();    // the way to put random value to each bar
      }
    }
  }

  void storeColor() {
    for (int i=0; i<prevColor.size(); i++) {
      aktColor.append(randomizer());
    }
  }
}