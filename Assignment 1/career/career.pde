float x;

void setup() {
  size(400, 330);
  background(255);

  smooth();
}

void draw() {
 career();
}


void career(){
  background(255);
  int anchor = 40;
  for (int i = 0; i < 30;i++) {
    noStroke();
    fill(0);
    rect(i * anchor, 0, anchor/2, height);
  }
  for (int q = 0; q < 2; q++) {
    if (q % 2 == 0) fill(0);    
    else fill(255);    
    rect(x, q * 90 + width/5, anchor, 50);
  } 
  x += anchor/40;
  x = (x > width+anchor/2)?0:x;       
}