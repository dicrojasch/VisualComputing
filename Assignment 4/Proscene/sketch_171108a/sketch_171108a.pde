
import remixlab.proscene.*;
import remixlab.dandelion.core.*;
import remixlab.dandelion.geom.*;
import remixlab.bias.event.*;

PShader shader;
Scene scene;
boolean kick;
public Figure models;
InteractiveFrame iFrame;


void setup() {
  size(900, 900, P3D);
  
  
  kick = false;
  scene = new Scene(this);
  
  models = new Figure(scene); 
  iFrame = new InteractiveFrame(scene);  
  scene.eyeFrame().removeBindings();
  scene.camera().setPosition(new Vec(0, 0, 1000)); // move the camera
  scene.camera().lookAt(new Vec(0, 0, 0)); // make the camera look at the center of the board));
  scene.eyeFrame().setMotionBinding(MouseAgent.NO_BUTTON, "lookAround");
  
  scene.setRadius(1000);
  scene.showAll();
  frameRate(1000);
  scene.setAxesVisualHint(false); // hide axis
  scene.setGridVisualHint(false); // hide grid  
}

void draw() {
  background(0);  
  if( models.move() ) models = new Figure(scene);  
  scene.drawFrames();
}



  