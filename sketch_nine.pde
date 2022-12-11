import com.hamoid.*;
import controlP5.*;
VideoExport videoExport;
ControlP5 cp;

int w=800;
int h=800;
float u=w/2;
float v=h/2;
int b;
int a;
boolean YB;
boolean clear=false;
boolean export=false;

void setup() {
  size(800,800);
  background(0);
  videoExport=new VideoExport(this);
  videoExport.startMovie();
  cp=new ControlP5(this);
  cp.addSlider("a",0,10,2,20,20,100,20);
  cp.addButton("clear")
  .setPosition(20,42);
  cp.addButton("export")
  .setPosition(20,64);

}

void draw() {
  if (pmouseX<=200 && pmouseY<=70){
    YB=false;
  }else{
    YB=true;
    strokeWeight(a);
    stroke(random(140,190),random(120,180),random(145,224));
    if(mousePressed){
      for(float i=0;i<TWO_PI;i+=TWO_PI/36){
        float px=pmouseX*cos(i)-pmouseY*sin(i)-u*cos(i)+v*sin(i)+u;
        float py=pmouseX*sin(i)+pmouseY*cos(i)-u*sin(i)-v*cos(i)+v;
        float x=mouseX*cos(i)-mouseY*sin(i)-u*cos(i)+v*sin(i)+u;
        float y=mouseX*sin(i)+mouseY*cos(i)-u*sin(i)-v*cos(i)+v;
        line(x, y, px, py);
      }
    }
  }
  videoExport.saveFrame();
}

void keyPressed(){
  if(clear){
    clear();
  }
  if(key=='a'){
  videoExport.endMovie();
  }
  if(export){
  saveFrame();
  }
}
