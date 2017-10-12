import java.util.Map;
class Vertex_Vertex {
  // radius refers to the mesh 'bounding sphere' redius.
  // see: https://en.wikipedia.org/wiki/Bounding_sphere
  float radius = 200;
  PShape shape;
  // mesh representation
  ArrayList<PVector> vertices;
  HashMap<PVector, ArrayList<PVector> > vertex;

  // rendering mode
  boolean retained;

  // visual modes
  // 0. Faces and edges
  // 1. Wireframe (only edges)
  // 2. Only faces
  // 3. Only points
  int mode;

  // visual hints
  boolean boundingSphere;

  Vertex_Vertex() {
    build();
    //use processing style instead of pshape's, see https://processing.org/reference/PShape.html
    shape.disableStyle();
  }

  // compute both mesh vertices and pshape
  // TODO: implement me
  void build() {
    vertices = new ArrayList<PVector>();
    float centerX, centerY, centerZ, R, r, stepr, stepR;
    r = 50;
    stepr = TWO_PI/30;
    R = 200;
    stepR = TWO_PI/25;

    //HashMap<PVector, ArrayList<PVector> > vertex = new HashMap<PVector, ArrayList<PVector> > ();
    vertex = new HashMap<PVector, ArrayList<PVector> > ();
    ArrayList<PVector> temp;
    PVector current;
    for(float i=0; i<TWO_PI; i+=stepr){

      for(float j=0; j<TWO_PI; j+=stepR){
        centerX = R + r*cos(j);
        centerY = R + r*cos(j);            
        centerZ = r*sin(j);
        current = new PVector(centerX*cos(i),centerY*sin(i),centerZ);
        vertices.add(current);      
        temp = new ArrayList<PVector>();
        temp.add(new PVector(centerX*cos(i+stepr),centerY*sin(i+stepr),centerZ));  // point next circle N°0
        temp.add(new PVector(centerX*cos(i-stepr),centerY*sin(i-stepr),centerZ));  // point before circle  N°1
        centerX = R + r*cos(j+stepR);
        centerY = R + r*cos(j+stepR);            
        centerZ = r*sin(j+stepR);  
        temp.add(new PVector(centerX*cos(i),centerY*sin(i),centerZ));   // next ring    N°2
        //temp.add(new PVector(centerX*cos(i+stepr),centerY*sin(i+stepr),centerZ));  // point next to the circle in the next ring
        temp.add(new PVector(centerX*cos(i-stepr),centerY*sin(i-stepr),centerZ));  // point before to the circle in the next ring    N°3
        centerX = R + r*cos(j-stepR);
        centerY = R + r*cos(j-stepR);            
        centerZ = r*sin(j-stepR);  
        temp.add(new PVector(centerX*cos(i),centerY*sin(i),centerZ));   // back ring    N°4
        temp.add(new PVector(centerX*cos(i+stepr),centerY*sin(i+stepr),centerZ));  // point next to the circle in the back ring   N°5
        //temp.add(new PVector(centerX*cos(i-stepr),centerY*sin(i-stepr),centerZ));  // point before to the circle in the back ring        
        vertex.put(current, temp);
      }
    }
 
    shape = createShape();
    shape.beginShape(TRIANGLE);
    for (PVector v : vertices) {      
      temp = (ArrayList<PVector>)vertex.get(v);
      shape.vertex(v.x, v.y, v.z);      
      shape.vertex(temp.get(5).x, temp.get(5).y ,temp.get(5).z);
      shape.vertex(temp.get(0).x, temp.get(0).y ,temp.get(0).z); 
      shape.vertex(v.x, v.y, v.z);
      shape.vertex(temp.get(2).x, temp.get(2).y ,temp.get(2).z);
      shape.vertex(temp.get(0).x, temp.get(0).y ,temp.get(0).z);                                                      
    }             
    shape.endShape();

    //don't forget to compute radius too
  }

  // transfer geometry every frame
  // TODO: current implementation targets a quad.
  // Adapt me, as necessary
  void drawImmediate() {
    beginShape(TRIANGLE);
    ArrayList<PVector> temp;    
    for (PVector v : vertices) {      
      temp = (ArrayList<PVector>)vertex.get(v);
      vertex(v.x, v.y, v.z);      
      vertex(temp.get(5).x, temp.get(5).y ,temp.get(5).z);
      vertex(temp.get(0).x, temp.get(0).y ,temp.get(0).z); 
      vertex(v.x, v.y, v.z);
      vertex(temp.get(2).x, temp.get(2).y ,temp.get(2).z);
      vertex(temp.get(0).x, temp.get(0).y ,temp.get(0).z);     

    }                   
    endShape();
  }

  void draw() {
    pushStyle();

    // mesh visual attributes
    // manipuate me as you wish
    int strokeWeight = 3;
    color lineColor = color(255, retained ? 0 : 255, 0);
    color faceColor = color(0, retained ? 0 : 255, 255, 100);

    strokeWeight(strokeWeight);
    stroke(lineColor);
    fill(faceColor);
    // visual modes
    switch(mode) {
    case 1:
      noFill();
      break;
    case 2:
      noStroke();
      break;
    case 3:
      // TODO: implement me
      break;
    }

    // rendering modes
    if (retained)
      shape(shape);
    else
      drawImmediate();
    popStyle();

    // visual hint
    if (boundingSphere) {
      pushStyle();
      noStroke();
      fill(0, 255, 255, 125);
      sphere(radius);
      popStyle();
    }
  }
}