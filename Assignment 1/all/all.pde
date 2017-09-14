int illusions = 7;
int current = 1;
float x;
//toggle illusion activation
boolean active = true;

void setup() {
  size(800, 600,P2D);
}

void draw() {
  background(255);
  pushStyle();
  switch(current) {
  case 1:
    points();
    break;    
  case 2:
    career();
    break;
  case 3:
    drawCube();
    break;  
  case 4:
    chessCenter();
    break; 
  case 5:
    drawfork();
    break;    
  case 6:
    drawOctagon();
    break;

  case 7:
    drawTriangle();
  }
  popStyle();
}

// switch illusion using the spacebar
void keyPressed() {
  if (key == ' ')
    current = current < illusions ? current+1 : 1;
}

void points() {
  background(150,150,150);
  int numberSquares = 12;
  int sizeSquare = width/numberSquares;
  float separation = sizeSquare*(0.1);  
  noStroke();
  for(float i = 0; i < width; i+=(sizeSquare+separation)){
    for(float j = 0; j < height; j+=(sizeSquare+separation)){ 
      fill(0);
      rect(i, j, sizeSquare, sizeSquare);
      fill(255);
      ellipse(i-separation/2, j-separation/2, separation*1.5, separation*1.5 );
    }
  }
}


void career(){
  background(255);
  int anchor = 60;
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


void drawCube(){

    float[] cornersX = new float[30];
    float[] cornersY = new float[30];    
    float angleEnds = PI/4;
       
    float largestSide = width*0.3;
    float smallestSide = width*0.2;
    float sideInside = width*0.03;
    float inclination = 0.1;
    float widthTriangle = largestSide*0.40;
    float mediumSide = largestSide+widthTriangle*3;
    
    float lenghtT = 0.2;
    angleEnds = PI/8;  
         
    cornersX[0] = width*lenghtT;
    cornersY[0] = height*0.7;
    
    cornersX[1] = cornersX[0] + cos(angleEnds)*largestSide;
    cornersY[1] = cornersY[0] + sin(angleEnds)*largestSide;     
    
    cornersX[2] = cornersX[1] + cos(angleEnds)*smallestSide;
    cornersY[2] = cornersY[1] - sin(angleEnds)*smallestSide; 
   
    cornersX[3] = cornersX[2];
    cornersY[3] = cornersY[2]-largestSide;
    
    cornersX[4] = cornersX[3] - cos(angleEnds)*largestSide;
    cornersY[4] = cornersY[3] - sin(angleEnds)*largestSide;  
    
    cornersX[5] = cornersX[4] - cos(angleEnds)*smallestSide;
    cornersY[5] = cornersY[4] + sin(angleEnds)*smallestSide;  
    
    cornersX[6] = cornersX[5];
    cornersY[6] = cornersY[5]+largestSide;
             
    for( int i = 0; i < 6; i++) line(cornersX[i], cornersY[i], cornersX[(i+1)%6], cornersY[(i+1)%6]);        
    

    cornersX[7] = (cornersX[0] + cos(angleEnds)*sideInside);
    cornersY[7] = (cornersY[0] + sin(angleEnds)*sideInside) - sideInside;       

    cornersX[8] = cornersX[7] ;
    cornersY[8] = cornersY[7] - (largestSide-sideInside*2);    

    cornersX[9] = cornersX[7] + cos(angleEnds)*(largestSide-sideInside*2);
    cornersY[9] = cornersY[7] + sin(angleEnds)*(largestSide-sideInside*2);  
    
    cornersX[10] = (cornersX[4] - cos(angleEnds)*sideInside) + cos(angleEnds)*sideInside;
    cornersY[10] = (cornersY[4] + sin(angleEnds)*sideInside) + sin(angleEnds)*sideInside;

    cornersX[11] = cornersX[10] + cos(angleEnds)*(largestSide-sideInside*2);
    cornersY[11] = cornersY[10] + sin(angleEnds)*(largestSide-sideInside*2);

    cornersX[12] = cornersX[10] - cos(angleEnds)*(smallestSide-sideInside*2);
    cornersY[12] = cornersY[10] + sin(angleEnds)*(smallestSide-sideInside*2);  
    
    cornersX[13] = (cornersX[2] - cos(angleEnds)*sideInside);
    cornersY[13] = (cornersY[2] + sin(angleEnds)*sideInside) - sideInside;       

    cornersX[14] = cornersX[13] ;
    cornersY[14] = cornersY[13] - (largestSide-sideInside*2);    

    cornersX[15] = cornersX[13] - cos(angleEnds)*(smallestSide-sideInside*2.1);
    cornersY[15] = cornersY[13] + sin(angleEnds)*(smallestSide-sideInside*2.1);      
    
    line(cornersX[8],cornersY[8], cornersX[7], cornersY[7]);
    line(cornersX[9],cornersY[9], cornersX[7], cornersY[7]);    
    line(cornersX[10],cornersY[10], cornersX[11], cornersY[11]);
    line(cornersX[10],cornersY[10], cornersX[12], cornersY[12]);
    line(cornersX[13],cornersY[13], cornersX[14], cornersY[14]);
    line(cornersX[13],cornersY[13], cornersX[15], cornersY[15]);
    

    
    cornersX[16] = cornersX[10];
    cornersY[16] = cornersY[10]+largestSide;       

    cornersX[17] = cornersX[7]  + cos(angleEnds)*(smallestSide);
    cornersY[17] = cornersY[7]  - sin(angleEnds)*(smallestSide);    

    cornersX[18] = cornersX[13] - cos(angleEnds)*(largestSide);
    cornersY[18] = cornersY[13] - sin(angleEnds)*(largestSide);   
    
    cornersX[19] = cornersX[10];
    cornersY[19] = cornersY[10]+sideInside;
    
    cornersX[20] = cornersX[11] - cos(angleEnds)*smallestSide*0.7;        
    cornersY[20] = cornersY[11]+sin(angleEnds)*smallestSide*0.7; 
    
    cornersX[21] = cornersX[14] - cos(angleEnds)*smallestSide*0.68;        
    cornersY[21] = cornersY[14] + sin(angleEnds)*smallestSide*0.68; 
    
    cornersX[22] = cornersX[12];        
    cornersY[22] = cornersY[12]+smallestSide*1.36;     
    
    
    line(cornersX[3], cornersY[3], cornersX[1], cornersY[1]-largestSide);
    line(cornersX[1], cornersY[1]-largestSide, cornersX[1], cornersY[1]-largestSide*0.61);
    
    line(cornersX[11], cornersY[11], cornersX[20], cornersY[20]);       
    
    line(cornersX[11], cornersY[11]+largestSide*0.9, cornersX[11], cornersY[11]+smallestSide*0.27);
    line(cornersX[11], cornersY[11]+largestSide*0.9, cornersX[11] - cos(angleEnds)*largestSide*0.35, (cornersY[11]+largestSide*0.9)+sin(angleEnds)*largestSide*0.35);
    
    line(cornersX[14], cornersY[14], cornersX[21], cornersY[21]);
    line(cornersX[21], cornersY[21], cornersX[21], cornersY[21]+largestSide*0.37);
   
    line(cornersX[22], cornersY[22], cornersX[12], cornersY[12]+smallestSide*0.28);
    line(cornersX[22], cornersY[22], cornersX[22] + cos(angleEnds)*smallestSide*1.05, cornersY[22]+sin(angleEnds)*smallestSide*1.05);
    line(cornersX[12], cornersY[12], cornersX[12] + cos(angleEnds)*smallestSide*0.54, cornersY[12]+sin(angleEnds)*smallestSide*0.54);
    line(cornersX[5], cornersY[5], cornersX[5] + cos(angleEnds)*smallestSide*0.85, cornersY[5]+sin(angleEnds)*smallestSide*0.85);
    line(cornersX[8], cornersY[8], cornersX[8] + cos(angleEnds)*smallestSide*0.69, cornersY[8]+sin(angleEnds)*smallestSide*0.69);
    
    //int a = 17;
    //line(cornersX[a], cornersY[a], 1000, 1000);
    
    line(cornersX[15], cornersY[15], cornersX[15], cornersY[15]-59);
    line(cornersX[1], cornersY[1], cornersX[1], cornersY[1]-104);
    
    line(cornersX[20], cornersY[20], cornersX[20]-cos(angleEnds)*smallestSide*0.35, cornersY[20]-sin(angleEnds)*smallestSide*0.35);
    
    line(cornersX[1], cornersY[1]-largestSide, cornersX[1]-cos(angleEnds)*smallestSide*0.35, cornersY[1]-largestSide-sin(angleEnds)*smallestSide*0.35);
    
    
    
    line(cornersX[10], cornersY[10], cornersX[16], cornersY[16]);    
    line(cornersX[7], cornersY[7], cornersX[17], cornersY[17]);
    line(cornersX[13], cornersY[13], cornersX[18], cornersY[18]);
    line(cornersX[18], cornersY[18], cornersX[18]-cos(angleEnds)*smallestSide*0.55, cornersY[18]+sin(angleEnds)*smallestSide*0.55);
    
    line(cornersX[16], cornersY[16], cornersX[16]+cos(angleEnds)*smallestSide, cornersY[16]+sin(angleEnds)*smallestSide);
    line(cornersX[16], cornersY[16], cornersX[16]-cos(angleEnds)*smallestSide*0.52, cornersY[16]+sin(angleEnds)*smallestSide*0.52);
    line(cornersX[17], cornersY[17], cornersX[17]+cos(angleEnds)*largestSide*0.7, cornersY[17]+sin(angleEnds)*largestSide*0.7);
    line(cornersX[19], cornersY[19], cornersX[19]+cos(angleEnds)*smallestSide, cornersY[19]+sin(angleEnds)*smallestSide);
    line(cornersX[19], cornersY[19], cornersX[19]-cos(angleEnds)*smallestSide*0.5, cornersY[19]+sin(angleEnds)*smallestSide*0.5);
    
    line(cornersX[17], cornersY[17], cornersX[17], cornersY[17]-largestSide*0.72);
    line(cornersX[18], cornersY[18], cornersX[18], cornersY[18]-largestSide*0.72);

    cornersX[22] = cornersX[9];        
    cornersY[22] = cornersY[9]-largestSide*0.8; 
     
     
    line(cornersX[9], cornersY[9], cornersX[9], cornersY[9]-largestSide*0.33);
    line(cornersX[22], cornersY[22], cornersX[22], cornersY[22]+largestSide*0.29);
    line(cornersX[22], cornersY[22], cornersX[22]-cos(angleEnds)*smallestSide*0.2, cornersY[22]-sin(angleEnds)*smallestSide*0.2);
   
    

  }
  
void chessCenter(){
    
    
    background(255);           
    float smallCircle = 20;
    float largestLine = sqrt(width*width+height*height);
    ellipse(width/2, height/2, smallCircle, smallCircle);
    
    int lines = 50;
    float before = smallCircle;
    int chess = 0;
    for(float i=smallCircle, j=0, k=0; i < largestLine; i+=+j, k++){      
      noFill();            
      chess+=1;
      for(float u = 0; u < 2*PI; u+=2*PI/lines){
        line(width/2+cos(u)*before/2, height/2+sin(u)*before/2, width/2+cos(u)*i/2, height/2+sin(u)*i/2);
        if(chess%2 == 0){
          for(float v = u; v < u+2*PI/lines; v+=2*PI/lines/200){
           line(width/2+cos(v)*before/2, height/2+sin(v)*before/2, width/2+cos(v)*i/2, height/2+sin(v)*i/2);
          }          
        }
        chess+=1;                
      }
      before = i;
      j = pow(1.1,k);
    }
}



void drawOctagon(){
  background(255);
  PShape octagon; //<>//
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

public void drawfork(){    
    int[] centerx = new int[3];
    int[] centery = new int[3];
    int lengthCircle = 20;
    int lengthToCorner = int(width*0.7);
    int lengthShort = lengthToCorner -20;
    float highInside = 1.7;
    centerx[0] = 80;
    centerx[1] = 110;
    centerx[2] = 140;
    
    centery[0] = 285;
    centery[1] = 320;
    centery[2] = 355;
    
    ellipse(centerx[0], centery[0], lengthCircle, lengthCircle+(lengthCircle*0.1));    
    line(centerx[0], centery[0]-1-lengthCircle/2, centerx[0]+lengthToCorner, centery[0]-lengthCircle*2);
    line(centerx[0], centery[0]+1+lengthCircle/2, centerx[0]+lengthShort, centery[0]-lengthCircle);        
    ellipse(centerx[1], centery[1], lengthCircle, lengthCircle+(lengthCircle*0.1));
    line(centerx[1], centery[1]-1-lengthCircle/2, centerx[0]+lengthShort, centery[0]+1.7);
    line(centerx[1], centery[1]+1+lengthCircle/2, centerx[1]+lengthShort, centery[1]-lengthCircle);        
    ellipse(centerx[2], centery[2], lengthCircle, lengthCircle+(lengthCircle*0.1));
    line(centerx[2], centery[2]-1-lengthCircle/2, centerx[2]+lengthToCorner, centery[2]-lengthCircle*2);
    line(centerx[2], centery[2]+1+lengthCircle/2, centerx[2]+lengthToCorner, centery[2]-lengthCircle);    
    line(centerx[1]+lengthShort, centery[1]-lengthCircle, centerx[0]+lengthShort, centery[0]-lengthCircle);
    line(centerx[0]+lengthShort, centery[0]-lengthCircle, centerx[0]+lengthShort, centery[0]+highInside);     
    line(centerx[0]+lengthShort, centery[0]+1.7, centerx[0]+lengthShort+(centerx[1]+lengthShort-(centerx[0]+lengthShort))/2, centery[1]-highInside - (centery[1]-highInside- (centery[0]+highInside))/2);    
    line(centerx[0]+lengthToCorner, centery[0]-lengthCircle*2, centerx[2]+lengthToCorner, centery[2]-lengthCircle*2);    
    line(centerx[2]+lengthToCorner, centery[2]-lengthCircle*2, centerx[2]+lengthToCorner, centery[2]-lengthCircle);       
  }
  
  
public void drawTriangle(){
  background(255);
    float[] cornersX = new float[20];
    float[] cornersY = new float[20];
    float smallestSide = width*0.2;        
    float inclination = 0.1;
    float widthTriangle = smallestSide*0.40;
    float mediumSide = smallestSide+widthTriangle*3;
    float largestSide = smallestSide+widthTriangle*4;
    float lenghtT = 0.4;
         
    cornersX[0] = width*lenghtT;
    cornersY[0] = height*lenghtT;
    
    cornersX[1] = cornersX[0] + cos(inclination)*smallestSide;
    cornersY[1] = cornersY[0] - sin(inclination)*smallestSide; 
    
    cornersX[2] = cornersX[1] - cos(PI/3.0+inclination)*smallestSide;
    cornersY[2] = cornersY[1] + sin(PI/3.0+inclination)*smallestSide; 
   
    cornersX[3] = cornersX[2] - cos(PI/3.0-inclination)*smallestSide;
    cornersY[3] = cornersY[2] - sin(PI/3.0-inclination)*smallestSide;    
    
    cornersX[4] = cornersX[0] + cos(inclination)*(smallestSide+widthTriangle);
    cornersY[4] = cornersY[0] - sin(inclination)*(smallestSide+widthTriangle); 
    
    cornersX[5] = cornersX[1] - cos(PI/3.0+inclination)*(smallestSide+widthTriangle);
    cornersY[5] = cornersY[1] + sin(PI/3.0+inclination)*(smallestSide+widthTriangle);  
    
    cornersX[6] = cornersX[2] - cos(PI/3.0-inclination)*(smallestSide+widthTriangle);
    cornersY[6] = cornersY[2] - sin(PI/3.0-inclination)*(smallestSide+widthTriangle); 
    
    for(int i = 0; i < 6; i++) line(cornersX[i%3], cornersY[i%3], cornersX[i+1], cornersY[i+1]);        

    cornersX[7] = cornersX[4] - cos(PI/3.0+inclination)*(mediumSide);
    cornersY[7] = cornersY[4] + sin(PI/3.0+inclination)*(mediumSide);
        
    cornersX[8] = cornersX[5] - cos(PI/3.0-inclination)*(mediumSide);
    cornersY[8] = cornersY[5] - sin(PI/3.0-inclination)*(mediumSide);    
    
    cornersX[9] = cornersX[6] + cos(inclination)*(mediumSide);
    cornersY[9] = cornersY[6] - sin(inclination)*(mediumSide);       
    
    for(int i = 7; i < 10; i++) line(cornersX[i], cornersY[i], cornersX[i-3], cornersY[i-3]);     
        
    cornersX[10] = cornersX[7] - cos(PI/3.0-inclination)*(largestSide);
    cornersY[10] = cornersY[7] - sin(PI/3.0-inclination)*(largestSide);    
    
    cornersX[11] = cornersX[8] + cos(inclination)*(largestSide);
    cornersY[11] = cornersY[8] - sin(inclination)*(largestSide);  
    
    cornersX[12] = cornersX[9] - cos(PI/3.0+inclination)*(largestSide);
    cornersY[12] = cornersY[9] + sin(PI/3.0+inclination)*(largestSide);     
    
    for(int i = 10; i < 13; i++) line(cornersX[i], cornersY[i], cornersX[i-3], cornersY[i-3]); 
            
    line(cornersX[10], cornersY[10], cornersX[8], cornersY[8]);
    line(cornersX[11], cornersY[11], cornersX[9], cornersY[9]);
    line(cornersX[12], cornersY[12], cornersX[7], cornersY[7]);
    
    

  }  