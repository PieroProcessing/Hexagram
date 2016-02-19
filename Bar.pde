class Bar {

  int SIZE=6;
  int wB = 20;
  int hB =7;
  int SPACE = hB+2;
  int x, y;
  float lerpValue;

  Bar (int x_, int y_) {
    rectMode(CORNER);
    noStroke();
    x = x_;
    y = y_;

    for (int i = 0; i < SIZE; i++) {      
      prevColor.append(randomizer());
    }
    //  println(prevColor.size());
  }
  void sxBar() {
    for (int i = 0; i < SIZE; i++) {      
      fill(255);
      rect(x, y+i*SPACE, wB, hB);
    }
  }
  void dxBar () {
    for (int i = 0; i < SIZE; i++) {      
      fill(255);
      rect(x+wB*2, y+i*SPACE, wB, hB);
    }
  }
  void displayCxBar(int a, int b) {
    for (int i = 0; i < SIZE; i++) {      
      int pos = a*6+b*48+i;            
      // set the transitions of colors
      float fillC =lerp(prevColor.get(pos), aktColor.get(pos), transition());  
      if (check()) {
        fill(fillC, 0, 0);
      } else {
        fill(fillC);
      }
      rect(x+wB, y+i*SPACE, wB, hB);
      prevColor.set(pos, fillC);
    }
  }
  void changeColor() {
    for (int i = 0; i < SIZE; i++) {      
      aktColor.append(randomizer());
    }
  }
  void meddle (int a, int b) {
    for (int i = 0; i < SIZE; i++) {      
      int pos = a*6+b*48+i;        
      aktColor.set(pos, randomizer());
    }
  }
  float transition() {
    if (check()) { 
      lerpValue = 1;
    } else { 
      lerpValue = .03;
    }
    return lerpValue;
  }
  boolean check() {
    boolean tip = false;
    PVector mouse = new PVector (mouseX, mouseY);
    for (int i = 0; i < SIZE; i++) {    
      
      PVector point1 = new PVector (x+width/64+wB/2, y+hB/2+height/100+i*SPACE);
      PVector point2 = new PVector (x+wB+width/64+wB/2, y+hB/2+height/100+i*SPACE);
      PVector point3 = new PVector (x+wB*2+width/64+wB/2, y+hB/2+height/100+i*SPACE);

      float dist1 = mouse.dist(point1);  
      float dist2= mouse.dist(point2);  
      float dist3 = mouse.dist(point3);  
      
      if (dist1< 7 || dist2<7 || dist3<7) {
        tip = true;
        break;
      } else {
        tip = false;
      }
    }
    return tip;
  }
}