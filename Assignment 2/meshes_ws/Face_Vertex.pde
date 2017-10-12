import java.util.Map;
import java.util.HashSet;
class Face_Vertex {
  // radius refers to the mesh 'bounding sphere' redius.
  // see: https://en.wikipedia.org/wiki/Bounding_sphere
  float radius = 200;
  PShape shape;
  // mesh representation
  ArrayList<PVector> vertices;
  HashMap<PVector, HashSet<Integer> > vertex;
  ArrayList<ArrayList<PVector> > face;

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

  Face_Vertex() {
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
    face = new ArrayList<ArrayList<PVector> >();
    vertex = new HashMap<PVector, HashSet<Integer> > ();
    ArrayList<PVector> temp;
    PVector current, neighbor, after;
    for(float i=0; i<TWO_PI; i+=stepr){

      for(float j=0; j<TWO_PI; j+=stepR){
        centerX = R + r*cos(j);
        centerY = R + r*cos(j);            
        centerZ = r*sin(j);
        current = new PVector(centerX*cos(i),centerY*sin(i),centerZ);
        after = new PVector(centerX*cos(i+stepr),centerY*sin(i+stepr),centerZ);          
        //vertices.add(current);    

        temp = new ArrayList<PVector>();
        temp.add(current);
        addFace(current, face.size() );                                                // add to vertex "current" the current face           
        temp.add(after);                                                              // point next circle         
        addFace(after, face.size() );         // add to vertex "neighbor" the current face
        centerX = R + r*cos(j+stepR); centerY = R + r*cos(j+stepR); centerZ = r*sin(j+stepR);          
        neighbor = new PVector(centerX*cos(i),centerY*sin(i),centerZ);                  // next ring    N°2     
        temp.add(neighbor);                                                             // point next circle         
        addFace(neighbor, face.size() );                                               // add to vertex "neighbor" the current face  
        face.add(temp);                                                                // add the current face                   
        
        temp = new ArrayList<PVector>();
        temp.add(current); 
        addFace(current, face.size() );   
        temp.add(after);  // point next circle         
        addFace(after, face.size() );                                                  // add to vertex "neighbor" the current face
        centerX = R + r*cos(j-stepR); centerY = R + r*cos(j-stepR); centerZ = r*sin(j-stepR);          
        neighbor = new PVector(centerX*cos(i+stepr),centerY*sin(i+stepr),centerZ);     // Back ring    
        temp.add(neighbor);          
        addFace(neighbor, face.size() );                                               // add to vertex "neighbor" the current face  
        face.add(temp);
      }
    }

    shape = createShape();
    shape.beginShape(TRIANGLE);
    PVector first;
    for (ArrayList<PVector> faces : face) {  
      first = faces.get(0);
      for(int i=0; i<faces.size(); i++)   
        shape.vertex(faces.get(i).x, faces.get(i).y, faces.get(i).z);                      
    } 
    shape.endShape();

    //don't forget to compute radius too
  }
  
  void addFace(PVector v, int face) {
    if( !vertex.containsKey(v) )
      vertex.put(v, new HashSet<Integer>());
    HashSet<Integer> temp = vertex.get(v);    
    temp.add(face);      
  }

  // transfer geometry every frame
  // TODO: current implementation targets a quad.
  // Adapt me, as necessary
  void drawImmediate() {
    beginShape(TRIANGLE);
    PVector first;
    for (ArrayList<PVector> faces : face) {  
      first = faces.get(0);
      for(int i=0; i<faces.size(); i++)        
        vertex(faces.get(i).x, faces.get(i).y, faces.get(i).z);              
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