SpaceCraft c;
Obstacle o;

int key1 = 0;
int myHeight;

boolean gameOver = false;





void setup() {
  size(800, 600, P3D);
  startGame();
}

void draw() {

  

    background(0);
    o.draw();
    c.draw();


    if ( c.limitX >= o.limitX) {
      
      if ( (c.yUp < o.yUp && c.yDown > o.yUp) || (c.yUp < o.yDown && c.yDown > o.yDown) ) {
        c.growUp = c.growUp>8 ? 1:c.growUp+1;        
        o = new Obstacle();


      }
    }
  
}

void startGame() {
  c = new SpaceCraft();
  o = new Obstacle();
}



void keyPressed() {   
  if (keyCode==UP)
    c.move(1);   
  if (keyCode==DOWN)
    c.move(2);    
  if (key==' ')
    gameOver = false;
  
}