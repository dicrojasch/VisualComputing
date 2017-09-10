   //<>//
  public void setup() {   
   // The width and height parameters can be change for any value and the figure change its size 
    size(800, 600);  
    strokeWeight( 2 ); 
    
      
  }
  
  public void draw() {    
    drawCube();
  }
  
  public void drawCube(){

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