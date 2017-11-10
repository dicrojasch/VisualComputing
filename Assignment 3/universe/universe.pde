float x, y, z, sizeSystem, declination, nodex, nodey;
int before = -1, level = 0;
float axisX = 0, axisY = 0;
float near = 0;

PGraphics pg;

Planet sun;
Planet mercury;
Planet venus;
Planet earth;
Planet mars;
Planet jupiter;
Planet moon;


void setup() {

  size(800, 600, P3D);
  pg = createGraphics(400, 200);
  sizeSystem = 2;
  declination = 50;
  background(0);
  noStroke();
  sun = new Planet(color(255, 255, 0), 20*sizeSystem, 0, 0, 0);
  mercury = new Planet(color(163, 122, 60), 3*sizeSystem, 0, 0, 0);
  venus = new Planet(color(110, 71, 32), 5*sizeSystem, 0, 0, 0);
  earth = new Planet(color(0, 0, 255), 6*sizeSystem, 0, 0, 0);
  mars = new Planet(color(255, 0, 0), 4*sizeSystem, 0, 0, 0);
  jupiter = new Planet(color(215, 172, 119), 12*sizeSystem, 0, 0, 0);
  moon = new Planet(color(255, 255, 255), 1*sizeSystem, 10, 10, 0) ;
}

void draw() {

  pg.beginDraw();
  pg.background(51);
  pg.noFill();
  pg.stroke(255);  
  pg.translate(pg.width/3, 20);
  nodex = pg.width/3; 
  nodey = 20;
  pg.fill(0);
  pg.ellipse(0, 0, 40, 30); 
  pg.fill(255);  
  pg.text("World", -18, 5);


  background(0);
  before = 1;
  level = 0;
  operation(1, "Sun");  

  scale(near, near, near);
  translate(axisX, axisY, 0);

  rotateX(PI/4);
  translate(0, 0, -100);

  translate(width/2, height/2, 0);  
  rotate(PI/1000*frameCount);
  sun.display();  // node sun  
  rotate(PI/4);
  operation(1, "Mer");  

  translate(0, declination, 0);  
  rotate(PI/100*frameCount);
  mercury.display();  // Child of sun  
  operation(0, "Sun");  // come back to sun

  rotate(PI/4);

  operation(1, "Ven");
  translate(0, declination*2, 0);  
  rotate(PI/100*frameCount);
  venus.display();  // Child of sun
  operation(0, "Sun");

  rotate(PI);

  operation(1, "Ear");
  translate(0, declination*3, 0);  
  rotate(PI/100*frameCount);  
  earth.display();  // Child of sun  

  operation(1, "Moo");
  rotate(PI/1000*frameCount);
  translate(0, 10, 0);      
  moon.display();  // Child of earth 
  operation(0, "Ear");

  operation(0, "Sun");  

  rotate(PI/4);

  operation(1, "Mar");
  translate(0, declination*4, 0);  
  rotate(PI/100*frameCount);   
  mars.display();  // Child of sun
  operation(0, "Sun");

  rotate(-PI);

  operation(1, "Jup");
  translate(0, declination*4, 0); 
  rotate(PI/100*frameCount);       
  jupiter.display();  // Child of sun
  operation(0, "Sun");
  
  
  
  
  operation(0, "World");
  eye("eye");
  
  
  
  






  pg.endDraw();  





  image(pg, 0, 0);
    
}



class Planet { 
  color c;
  float xpos;
  float ypos;
  float zpos;
  float csize;
  float oradius;

  Planet(color tempC, float tempsize, float x, float y, float z) { 
    c = tempC;        
    xpos = x;
    ypos = y;
    zpos = z;
    csize = tempsize;
  }

  void display() {    
    pushMatrix();
    noStroke();
    fill(c);
    translate(xpos, ypos, zpos);
    lights();
    sphere(csize);
    popMatrix();
  }
}


void operation(int op, String node) {

  if ( op==1 && before==1 ) {

    pushMatrix();    
    pg.pushMatrix();
    pg.translate(-40, 50);
    pg.fill(0);
    pg.ellipse(0, 0, 40, 30); 
    pg.line(0, 0-15, 40, -50+15);
    pg.fill(255);
    pg.text(node, -10, 7);
  } else if ( op==1 && before==0 ) {
    level++;
    pushMatrix();    
    pg.pushMatrix();
    pg.translate(70*level, 50);   
    pg.fill(0);
    pg.ellipse(0, 0, 40, 30);
    pg.line(0, 0-15, -70*level, -50+15);
    pg.fill(255);    
    pg.text(node, -10, 7);     

    // bajar
  } else if (op==0) {
    popMatrix();    
    pg.popMatrix();
  }


  before = op;
}

void eye(String node){
  pg.pushMatrix();
  pg.translate(40, 50);
 pg.fill(0);
  pg.ellipse(0, 0, 40, 30); 
  pg.line(0, 0-15, -40, -50+15);
  pg.fill(255);
  pg.text(node, -10, 7);
  pg.popMatrix();
  
}

void keyPressed() {   
  if (keyCode==UP)
    axisY += 10;
  if (keyCode==DOWN)
    axisY -= 10;
  if (keyCode==RIGHT)
    axisX -= 10;
  if (keyCode==LEFT)
    axisX += 10;
  if (key=='-')
    near -= 0.5;
  if (key=='+')
    near += 0.5;    
  
}