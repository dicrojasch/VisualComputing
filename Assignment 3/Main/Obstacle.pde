class Obstacle {
  public float myWidth;
  float xr, yr;
  float myHeight = 600;
  public float yUp, yDown, limitX, start;
  float step = 0;
  float speed = 10;
  int objects = 1;
  int selection;
  boolean gameOver = false;

  Obstacle() {
    start();
    xr = width/2;
    yr = height/2;
    selection = 0;
  }

  void start() {
    start = random(myHeight);  
    selection++;
    myWidth = 800;
    speed += speed >= 30 ? 0:1;
  }

  void draw() {

    if ( myWidth<-50 ) start();



    drawObject();

    myWidth -= speed;
    delay(100);
    pushMatrix();
    applyMatrix(1, 0, 0, myWidth, 
      0, 1, 0, start, 
      0, 0, 1, 0, 
      0, 0, 0, 1);
    popMatrix();
  }

  void drawObject() {
    switch( selection%4 ) {
    case 0:
      stair();        
      break;
    case 1:
      square();        
      break;
    case 2:
      squareRotate();        
      break;
    case 3:
      squareShearing();        
      break;      
    default:        
      break;
    }
  }

  void stair() {    
    int sides = 10, size = 20, spike = 10;
    float side = 2*PI/sides;  
    limitX = myWidth - (size + spike)/2;
    yUp = start - size - spike;
    yDown = start + size + spike;
    pushMatrix();  

    translate(myWidth, start);    
    beginShape();     
    for (float i=0; i<2*PI+1; i+=side) {        
      vertex(size*cos(i), size*sin(i));
      vertex(spike*cos(i+side/2), spike*sin(i+side/2));
    }  

    endShape(); 

    popMatrix();
  }
  
  void squareRotate(){
    int sides = 40;
    limitX = myWidth - (sides)/2;
    yUp = start - sides/2;
    yDown = start + sides/2;
    pushMatrix();      
    translateO(myWidth, start); 
    rotateO(myWidth*0.1, 0,0);
    
    beginShape();              
      vertex(0, 0);
      vertex(sides,0);
      vertex(sides, sides);
      vertex(0,sides);
      vertex(0, 0);           
    endShape(); 
    popMatrix();
    
  }
  
  void square(){
    int sides = 40;
    limitX = myWidth - (sides)/2;
    yUp = start - sides/2;
    yDown = start + sides/2;
    pushMatrix();      
    translateO(myWidth, start);         
    beginShape();              
      vertex(0, 0);
      vertex(sides,0);
      vertex(sides, sides);
      vertex(0,sides);
      vertex(0, 0);           
    endShape(); 
    popMatrix();
    
  }
  
  void squareShearing(){
    int sides = 40;
    int shear = 20;
    limitX = myWidth - (sides)/2;
    yUp = start - sides/2;
    yDown = start + sides/2;
    pushMatrix();      
    translateO(myWidth, start); 
    shearing(shear,shear);
    beginShape();              
      vertex(0, 0);
      vertex(sides,0);
      vertex(sides+shear, sides);
      vertex(shear,sides);
      vertex(0, 0);           
    endShape(); 
    popMatrix();
  }
  
  void translateO(float w, float h){
    applyMatrix(1, 0, 0, w, 
                0, 1, 0, h, 
                0, 0, 1, 0, 
                0, 0, 0, 1);          
  }
  
  void rotateO(float angle, float axisX, float axisY) {
    applyMatrix(1, 0, 0, axisX, 
      0, 1, 0, axisY, 
      0, 0, 1, 0, 
      0, 0, 0, 1);  
    applyMatrix(cos(angle), -sin(angle), 0, 0, 
      sin(angle), cos(angle), 0, 0, 
      0, 0, 1, 0, 
      0, 0, 0, 1);
    applyMatrix(1, 0, 0, -axisX, 
      0, 1, 0, -axisY, 
      0, 0, 1, 0, 
      0, 0, 0, 1);
  }
  
  void shearing(float a, float b){
     applyMatrix(
        1,  0,  0,  xr,
        0,  1,  0,  yr,
        0,  0,  1,  0,
        0,  0,  0,   1
      );
      // 2. Dz( a, b, 0 )
      applyMatrix(
        1,  0,  a,  0,
        0,  1,  b,  0,
        0,  0,  1,  0,
        0,  0,  0,  1
      );
      // 3. T( -dx, -dy, -dz )
      applyMatrix(
        1,  0,  0,  -xr,
        0,  1,  0,  -yr,
        0,  0,  1,  0,
        0,  0,  0,  1
      );    
    
    
  }
}