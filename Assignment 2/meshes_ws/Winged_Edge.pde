import java.util.Map;
import java.util.HashSet;
import java.util.Iterator;
class Winged_Edge {
  // radius refers to the mesh 'bounding sphere' redius.
  // see: https://en.wikipedia.org/wiki/Bounding_sphere
  float radius = 200;
  PShape shape;
  int edges = 0;
  // mesh representation
  ArrayList<PVector> vertices;
  HashMap<PVector, HashSet<Integer> > vertexList;
  ArrayList<HashSet<Integer> >  faceListAux;
  ArrayList<ArrayList<ArrayList<PVector>>>  faceList;
  HashMap<Integer, HashSet<PVector> > vertexListEdge;
  HashMap<HashSet<PVector> , Integer> edgeListVertex;
  HashMap<Integer, ArrayList<HashSet<Integer> > > edgeListFace;
  HashMap<Integer, HashSet<Integer> > edgeListEdge;

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

  Winged_Edge() {
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
    vertexList = new HashMap<PVector, HashSet<Integer> > ();    
    faceList = new ArrayList<ArrayList<ArrayList<PVector>>>();    
    vertexListEdge = new HashMap<Integer, HashSet<PVector> >();
    edgeListVertex = new HashMap<HashSet<PVector> , Integer>();
    edgeListFace = new HashMap<Integer, ArrayList<HashSet<Integer> > >();
    edgeListEdge = new HashMap<Integer, HashSet<Integer> >();
    int index = 0;
    
    ArrayList<ArrayList<PVector> > temp;
    ArrayList<PVector> pair;
    
    PVector current, neighbor, after, nextRing, nextRingBefore;
    for(float i=0; i<TWO_PI; i+=stepr){

      for(float j=0; j<TWO_PI; j+=stepR){
        centerX = R + r*cos(j);
        centerY = R + r*cos(j);            
        centerZ = r*sin(j);
        current = new PVector(centerX*cos(i),centerY*sin(i),centerZ);
        after = new PVector(centerX*cos(i+stepr),centerY*sin(i+stepr),centerZ);          
        //vertices.add(current);    

        
        addFaceList(index, current, after);   
        addVertexList(current, after);        
        centerX = R + r*cos(j+stepR); centerY = R + r*cos(j+stepR); centerZ = r*sin(j+stepR);          
        neighbor = new PVector(centerX*cos(i),centerY*sin(i),centerZ);                  // next ring   
        addFaceList(index, after, neighbor);
        addVertexList(after, neighbor);
        addFaceList(index, neighbor, current);
        addVertexList(neighbor, current);
        index++;
        
        
        addFaceList(index, current, after);     
        addVertexList(current, after);  
        centerX = R + r*cos(j-stepR); centerY = R + r*cos(j-stepR); centerZ = r*sin(j-stepR);          // back Ring 
        neighbor = new PVector(centerX*cos(i+stepr),centerY*sin(i+stepr),centerZ);     
        addFaceList(index, after, neighbor);
        addVertexList(after, neighbor);
        addFaceList(index, neighbor, current);
        addVertexList(neighbor, current);        
        index++;     
        
        
    
      }
    }
    
    for(float i=0; i<TWO_PI; i+=stepr){

      for(float j=0; j<TWO_PI; j+=stepR){
        centerX = R + r*cos(j);
        centerY = R + r*cos(j);            
        centerZ = r*sin(j);
        current = new PVector(centerX*cos(i),centerY*sin(i),centerZ);
        after = new PVector(centerX*cos(i+stepr),centerY*sin(i+stepr),centerZ);
        centerX = R + r*cos(j+stepR);
        centerY = R + r*cos(j+stepR);            
        centerZ = r*sin(j+stepR);          
        nextRing = new PVector(centerX*cos(i),centerY*sin(i),centerZ);
        nextRingBefore = new PVector(centerX*cos(i+stepr),centerY*sin(i+stepr),centerZ);   
        //vertices.add(current);    

        addEdgeListEdge(current, nextRing, nextRing, nextRingBefore );
        addEdgeListEdge(current, nextRing, current, nextRingBefore );
        addEdgeListEdge(current, nextRing, current, after );
        addEdgeListEdge(current, nextRing, after, nextRing);
      }
    }    

    shape = createShape();
    shape.beginShape(QUAD);
    for(  ArrayList<ArrayList<PVector>> a :   faceList){
       for( ArrayList<PVector> b :   a){         
           shape.vertex(b.get(0).x,b.get(0).y,b.get(0).z);                                     
       }        
    } 

    shape.endShape();

    //don't forget to compute radius too
  }
  

  
  void addFaceList(int index, PVector v1, PVector v2) {
    if( faceList.size() < index ) return;     
    if( faceList.size() == index ) faceList.add(new ArrayList<ArrayList<PVector>>());
    ArrayList<ArrayList<PVector>> temp = faceList.get(index);
    HashSet<PVector> pair = new HashSet<PVector>();
    pair.add(v1);
    pair.add(v2);
    ArrayList<PVector> pair1 = new ArrayList<PVector>();
    pair1.add(v1);
    pair1.add(v2);    
    if( !edgeListVertex.containsKey(pair) ){
      edgeListVertex.put(pair, edges);
      vertexListEdge.put(edges++, pair);
    }           
    temp.add(pair1);  
    
    edgeListFace = new HashMap<Integer, ArrayList<HashSet<Integer> > >();
    
    if( !edgeListFace.containsKey(index) )
      edgeListFace.put(index, new ArrayList<HashSet<Integer> >());      
     ArrayList<HashSet<Integer> > temp1 = edgeListFace.get(index);
     
     //temp1.add(faceList.get(index));
     
    
    
  }  
  
  void addVertexList(PVector v1, PVector v2){
    if( !vertexList.containsKey(v1) )
      vertexList.put(v1, new HashSet<Integer>());       
    HashSet<Integer> temp = vertexList.get(v1);
    HashSet<PVector> pair = new HashSet<PVector>();
    pair.add(v1);
    pair.add(v2);
    if( !edgeListVertex.containsKey(pair) ){
      edgeListVertex.put(pair, edges);
      vertexListEdge.put(edges++, pair);
    }               
    temp.add(edgeListVertex.get(pair));     
    
    if( !vertexList.containsKey(v2) )
      vertexList.put(v2, new HashSet<Integer>());  
    temp = vertexList.get(v2);    
    temp.add(edgeListVertex.get(pair));              
  }    

  
  void addEdgeListEdge(PVector v1, PVector v2, PVector addv1, PVector addv2){
    HashSet<PVector> pair = new HashSet<PVector>();
    pair.add(v1);
    pair.add(v2); 
    int index = edgeListVertex.get(pair);
   if( !edgeListEdge.containsKey(index) )
      edgeListEdge.put(index, new HashSet<Integer>());  
    HashSet<Integer> temp = edgeListEdge.get(index);    
    pair = new HashSet<PVector>();
    pair.add(addv1);
    pair.add(addv2);   
    temp.add(edgeListVertex.get(pair));   
    
  }
  
  // transfer geometry every frame
  // TODO: current implementation targets a quad.
  // Adapt me, as necessary
  void drawImmediate() {
    beginShape(TRIANGLE);      
      for(  ArrayList<ArrayList<PVector>> a :   faceList){
       for( ArrayList<PVector> b :   a){         
         vertex(b.get(0).x,b.get(0).y,b.get(0).z);              
       }        
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