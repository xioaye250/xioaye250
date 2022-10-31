import nervoussystem.obj.*;
import com.hamoid.*;
import peasy.*;
import controlP5.*;

ControlP5 cps;
PeasyCam cam;
VideoExport videoExport;

int sides,tall,topRadius,bottomRadius;

color c;
boolean record;

void setup(){
  size(800,800,P3D);
  cam=new PeasyCam(this,800);
  videoExport=new VideoExport(this);
  videoExport.startMovie();
  UI();
}

void draw(){
  background(122);
  lights();  
  pushMatrix();

  fill(c,20,100);
  translate(-width/2,-height/2);
  popMatrix();  
  
  if(record){
     beginRecord("nervoussystem.obj.OBJExport", "10.31.obj");
  }
  drawPicture();
  if(record){
    endRecord();
    record=false;
  }
  UIShow();
  videoExport.saveFrame();
}


void drawPicture(){
  float angle = 2;
  float angleIncrement   = TWO_PI / sides;
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    for(int j=0;j<sides+1;j++){
    vertex(topRadius * cos(angle), 0, 0.5*topRadius *sin(angle));
    vertex(bottomRadius * sin(angle)*j*0.1, tall,j*0.1* bottomRadius * cos(angle));
    angle += angleIncrement;
  }
  }
  
  endShape();
  
    beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    vertex(topRadius * cos(angle)*0.5, 0, topRadius *sin(angle));
    vertex(bottomRadius * sin(angle)*0.5, tall/2, bottomRadius * cos(angle));
    angle += angleIncrement;
  }
  endShape();
  
     beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    vertex(topRadius * cos(angle), 0, topRadius *sin(angle)*0.5);
    vertex(bottomRadius * sin(angle), tall/2, bottomRadius * cos(angle)*0.5);
    angle += angleIncrement;
  }
  endShape();
  
      beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    vertex(topRadius * cos(angle)*0.5, tall, topRadius *sin(angle));
    vertex(bottomRadius * sin(angle)*0.5, tall/2, bottomRadius * cos(angle));
    angle += angleIncrement;
  }
  endShape();
  
      beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    vertex(topRadius * cos(angle), tall, topRadius *sin(angle)*0.5);
    vertex(bottomRadius * sin(angle), tall/2, bottomRadius * cos(angle)*0.5);
    angle += angleIncrement;
  }
  endShape();
  
  if (topRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle)*0.5, 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
  
   if (topRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle)*0.5);
      angle += angleIncrement;
    }
    endShape();
  }
  
  if (bottomRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    vertex(0, tall, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(bottomRadius * cos(i), tall, 0.5*bottomRadius * sin(i));
      angle += angleIncrement;
    }
    endShape();
  }
  
  if (bottomRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    vertex(0, tall, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(bottomRadius * cos(i)*0.5, tall, bottomRadius * sin(i));
      angle += angleIncrement;
    }
    endShape();
  }
  
} 

void keyPressed(){
  if(key=='q'){
    videoExport.endMovie();
  }
  if(key=='a'){
  record=true;
  }
}
  
