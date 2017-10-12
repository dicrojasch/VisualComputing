Vertex_Vertex vv;
Face_Vertex fv;
Winged_Edge we;
int type;

void setup() {
  size(600, 600, P3D); 
  vv = new Vertex_Vertex();
  fv = new Face_Vertex();
  we = new Winged_Edge();
  type = 0; 
  frameRate(1000);
}

void draw() {
  background(0);
  text("Representation: " + (type==0?"Vertex-Vertex":(type==1?"Face-Vertex":"Winged-Edge")) + ".  Mesh mode: " + vv.mode + ". Rendering mode: " + (vv.retained || fv.retained || we.retained ? "retained" : "immediate") + ". FPS: " + frameRate, 10 ,10);
  lights();
  // draw the mesh at the canvas center
  // while performing a little animation
  translate(width/2, height/2, 0);
  rotateX(frameCount*radians(90) / 50);
  rotateY(frameCount*radians(90) / 50);
  // mesh draw method  
  switch(type) {
    case 0: 
      vv.draw();
      break;
    case 1: 
      fv.draw();
      break;
    default:        
      we.draw();
      break;
  }
  
}

void keyPressed() {
  if (key == ' '){
    vv.mode = vv.mode < 3 ? vv.mode+1 : 0;
    fv.mode = fv.mode < 3 ? fv.mode+1 : 0;
    we.mode = we.mode < 3 ? we.mode+1 : 0;
    
  }if (key == 'r'){
    vv.retained = !vv.retained;
    fv.retained = !fv.retained;
    we.retained = !we.retained;
    
  }if (key == 'b'){
    vv.boundingSphere = !vv.boundingSphere;
    fv.boundingSphere = !fv.boundingSphere;
    we.boundingSphere = !we.boundingSphere;
    
  }if (key == '0')
    type = 0;
  if (key == '1')
    type = 1;
  if (key == '2')
    type = 2;    
}