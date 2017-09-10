 //<>//
void setup() {
    size (600,600);

}

void draw() {
    background(255);
    
    
    
    float smallCircle = 20;
    float largestLine = sqrt(width*width+height*height);
    ellipse(width/2, height/2, smallCircle, smallCircle);
    
    int lines = 50;
    int innerCircles = 40;
    int side = max(width, height);
    /*for(float i = largestLine, j = 1; i > smallCircle; i-=largestLine/innerCircles){
      System.out.println(i+"  "+j);
      ellipse(width/2, height/2, i*j, i*j);
    }*/

    for(float i=smallCircle, j=0, k=0; i < largestLine; i+=+j, k++){
      System.out.println(i+"  "+j);
      noFill();
      ellipse(width/2, height/2, i, i);
      j = pow(1.2,k);
    }
    for(float i = 0; i < 2*PI; i+=2*PI/lines) line(width/2+cos(i)*smallCircle/2, height/2+sin(i)*smallCircle/2, width/2+cos(i)*largestLine, width/2+sin(i)*largestLine);
    
    
    

    
    
    
    
}