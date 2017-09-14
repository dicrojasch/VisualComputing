  
  public void setup() {   
   // The width and height parameters can be change for any value and the figure change its size 
    size(800, 600);  
    
      
  }
  
  public void draw() {    
    drawTriangle();
  }
  
public void drawTriangle(){
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
    
    
 //<>//
  }