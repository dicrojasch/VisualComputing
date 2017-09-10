  
  public void setup() {   
   // The width and height parameters can be change for any value and the figure change its width 
    size(600, 400);  
    
      
  }
  
  public void draw() {    
    drawfork();
  }
  
  public void drawfork(){
    
    int[] centerx = new int[3];
    int[] centery = new int[3];
    int lengthCircle = 20;
    int lengthToCorner = int(width*0.7);
    int lengthShort = lengthToCorner -20;
    float highInside = 1.7;
    centerx[0] = 50;
    centerx[1] = 80;
    centerx[2] = 110;
    
    centery[0] = 150;
    centery[1] = 185;
    centery[2] = 220;

    
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