 //<>//


void setup() {
  size(800,800,P2D);
  background(255);
  // First create the shape

}


void draw() {  
  
  drawOctagon();
}

void drawOctagon(){
  background(255);
  PShape octagon; //<>// //<>//
  PShape squares; 
  float sizeOct = 10;
  float sizeSquare = 7;
  octagon = createShape();
  octagon.beginShape();       
  octagon.fill(0,157,12);
  octagon.noStroke(); 
  octagon.vertex(0*sizeOct-sizeOct, 1*sizeOct-sizeOct);
  octagon.vertex(1*sizeOct-sizeOct, 0*sizeOct-sizeOct);
  octagon.vertex(3*sizeOct-sizeOct, 0*sizeOct-sizeOct);
  octagon.vertex(4*sizeOct-sizeOct, 1*sizeOct-sizeOct);
  octagon.vertex(4*sizeOct-sizeOct, 3*sizeOct-sizeOct);
  octagon.vertex(3*sizeOct-sizeOct, 4*sizeOct-sizeOct);
  octagon.vertex(1*sizeOct-sizeOct, 4*sizeOct-sizeOct);
  octagon.vertex(0*sizeOct-sizeOct, 3*sizeOct-sizeOct);
  octagon.vertex(0*sizeOct-sizeOct, 1*sizeOct-sizeOct);  
  octagon.endShape(CLOSE);              
  shape(octagon);
  int a = 1;
  for(float i = 0; i < height+ sizeOct*8; i+=sizeOct*4){
    for(float j = 0; j < width; j+=sizeOct*8){    
      octagon.beginShape();
      octagon.translate(sizeOct*8*a, 0);
      octagon.endShape(CLOSE);      
      shape(octagon);      
    }
    octagon.beginShape();
    octagon.translate(sizeOct*4*a, sizeOct*4);
    octagon.endShape(CLOSE);      
    shape(octagon);
    a = a == 1?-1:1;
  }

  
 
  squares = createShape();
  squares.beginShape();       
  squares.fill(0);
  squares.noStroke(); 
  squares.vertex(0*sizeSquare, 0*sizeSquare);
  squares.vertex(1*sizeSquare, 0*sizeSquare);
  squares.vertex(1*sizeSquare, 1*sizeSquare);
  squares.vertex(0*sizeSquare, 1*sizeSquare);
  squares.vertex(0*sizeSquare, 0*sizeSquare);
  
  squares.vertex((0+1)*sizeSquare, (1+0)*sizeSquare);
  squares.vertex((1+1)*sizeSquare, (1+0)*sizeSquare);
  squares.vertex((1+1)*sizeSquare, (1+1)*sizeSquare);
  squares.vertex((1+0)*sizeSquare, (1+1)*sizeSquare);
  squares.vertex((1+0)*sizeSquare, (1+0)*sizeSquare);
  squares.rotate(PI/4);
  squares.translate(4*sizeOct-sizeOct, 3*sizeOct-sizeOct);
  squares.endShape(CLOSE);              
  shape(squares);
  
  a = 1;
  for(float i = 0; i < height; i+=sizeOct*4){
    for(float j = -sizeOct*8; j < width; j+=sizeOct*8){    
      squares.beginShape();
      squares.translate(sizeOct*8*a, 0);
      squares.endShape(CLOSE);      
      shape(squares);      
    }
    squares.beginShape();
    squares.translate(sizeOct*4*a, sizeOct*4);
    squares.endShape(CLOSE);      
    shape(squares);
    a = a == 1?-1:1;
  }
  
  squares.resetMatrix();
  squares.rotate(3*PI/4);
  squares.translate(1*sizeOct-sizeOct, 4*sizeOct-sizeOct);      
  shape(squares);  

  a = 1;
  for(float i = 0; i < height; i+=sizeOct*4){
    for(float j = 0; j < width; j+=sizeOct*8){    
      squares.beginShape();
      squares.translate(sizeOct*8*a, 0);
      squares.endShape(CLOSE);      
      shape(squares);      
    }
    squares.beginShape();
    squares.translate(sizeOct*4*a, sizeOct*4);
    squares.endShape(CLOSE);      
    shape(squares);
    a = a == 1?-1:1;
  }  
  
  
}