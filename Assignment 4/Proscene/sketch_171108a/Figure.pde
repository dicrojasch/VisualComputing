public class Figure extends InteractiveFrame{
    int speed;
    boolean dead;
    float current;
    float limits = 400;
    public InteractiveFrame figure;
    
    public Figure( Scene scene){
      super(scene);
      speed = 10;
      this.setShape(createMyShape());
      dead = false;
      current = 0;
      this.setClickBinding(LEFT,1,"play");
      translate(myRandom(), myRandom(), 0);
    }
    
    

    boolean move(){  
      current += speed;      
      translate(0,0,speed);  
      if( current > 2500 ) dead = true;
      return dead;
    }
    
    PShape createMyShape(){
      int num = int(random(1, 3));
      PShape fig = (num == 1)?createShape(BOX, 60):createShape(SPHERE, 60);
      fig.setFill(color(random(0,255), random(0,255), random(0,255)));
      fig.setStroke(255);          
      return fig;      
    }
    
    public void play(ClickEvent event) { 
       dead = true;
    }
    
    int myRandom(){
      
        int sign = (int(random(2))==0)?-1:1;
        return sign*int(random(limits)); 
    }
        

 
}  