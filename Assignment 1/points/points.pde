   //<>//
  
void setup(){
  size(500,1000);
}
 
 
  
void draw(){
  points(); //<>// //<>//
}


void points(){
  background(150,150,150);
  int numberSquares = 10;
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