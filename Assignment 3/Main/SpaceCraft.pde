class SpaceCraft {
  public int myHeight;
  public float yUp, yDown, limitX, xr, yr; 
  int step = 10;
  public float growUp = 1;
  public int x, y, large, tail, window, arrow;

  SpaceCraft() {
    myHeight = 600/2;  
    xr = 0;
    yr = 0;
  
  }

  void draw() {    
    x = 0; y = 0; large = 50; tail = 15; window = 10;
    limitX = large*2; yUp = myHeight - large/2; yDown = myHeight + large/2;
    
    pushMatrix();
    
    
    move(0);
    
    rotateo(-PI/4, 0, 0);
    grow(growUp, growUp);
    
    beginShape();    
    
      vertex(x, y);
      vertex(x+large, y);
      vertex(x+large, y+large);
      vertex(x, y+large);
      vertex(x, y-tail);
      
      vertex(x-tail, y);
      vertex(x, y);
      
      vertex(x+large/2, y);
      vertex(x+large/2, y-large/3);
      vertex(x+large/2-large/3, y-large/3);
      vertex(x+large/2-large/3, y);
      vertex(x, y);
            
      vertex(x, y+large/2);   
      vertex(x-large/3, y+large/2);
      vertex(x-large/3, y+large/2-large/3);
      vertex(x, y+large/2-large/3);
      vertex(x, y);     
    endShape();
    
    beginShape();    
      vertex(x+large-window, y+window);
      vertex(x+large-window, y+large-window);
      vertex(x+window, y+large-window);
      vertex(x+large-window, y+window);       
    endShape();
    

    popMatrix();
    
  }
  
  void move(int key1){        
    if( key1 == 1 ) myHeight -= step;
    if( key1 == 2 ) myHeight += step;   
    
    applyMatrix(1, 0, 0, 15, 
                0, 1, 0, myHeight, 
                0, 0, 1, 0, 
                0, 0, 0, 1);                
  }
  

  void rotateo(float angle, float axisX, float axisY){
    applyMatrix(1, 0, 0, axisX, 
                0, 1, 0, axisY, 
                0, 0, 1, 0, 
                0, 0, 0, 1);  
    applyMatrix(cos(angle), -sin(angle), 0, 0, 
                sin(angle), cos(angle),  0, 0, 
                0,         0,          1, 0, 
                0,         0,          0, 1);
    applyMatrix(1, 0, 0, -axisX, 
                0, 1, 0, -axisY, 
                0, 0, 1, 0, 
                0, 0, 0, 1);                 
    
  }
  
  void grow(float sx, float sy){
    
    limitX = large*2*growUp; yUp = myHeight - large/2*growUp; yDown = myHeight + large/2*growUp;
    applyMatrix(
       1,  0,  0,  xr,
       0,  1,  0,  yr,
       0,  0,  1,  0,
       0,  0,  0,   1
    );    
    applyMatrix(
      sx,  0,  0,  0,
       0, sy,  0,  0,
       0,  0, 1,  0,
       0,  0,  0,  1
    );
    
    applyMatrix(
       1,  0,  0,  -xr,
       0,  1,  0,  -yr,
       0,  0,  1,  0,
       0,  0,  0,  1
    );
    
    
  
    
    
    
   
  }
  
  
  
}