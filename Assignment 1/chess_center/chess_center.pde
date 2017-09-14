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
    float before = smallCircle;
    int chess = 0;
    for(float i=smallCircle, j=0, k=0; i < largestLine; i+=+j, k++){
      System.out.println(i+"  "+j);
      noFill();            
      chess+=1;
      for(float u = 0; u < 2*PI; u+=2*PI/lines){
        line(width/2+cos(u)*before/2, height/2+sin(u)*before/2, width/2+cos(u)*i/2, width/2+sin(u)*i/2);
        if(chess%2 == 0){
          for(float v = u; v < u+2*PI/lines; v+=2*PI/lines/200){
           line(width/2+cos(v)*before/2, height/2+sin(v)*before/2, width/2+cos(v)*i/2, width/2+sin(v)*i/2);
          }          
        }
        chess+=1;                
      }
      before = i;
      j = pow(1.1,k);
    }
}