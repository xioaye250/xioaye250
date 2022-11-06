import com.hamoid.*;

VideoExport videoExport;

Point [] points = new Point[50];

void setup(){
  size(800,800);
  background(255);
  for( int i =0; i < points.length; i++){
    points[i] = new Point();
  }
  videoExport=new VideoExport(this);
  videoExport.startMovie();
}
void draw(){
  
  float a=random(0,256);
  float b=random(10,100);
  float c=random(0,160);
  fill(0);
  rect(0,0,800,800);
  for( int i =0; i < points.length; i++){
    points[i].update(); 
    points[i].render(a,b,c); 
  } 
  videoExport.saveFrame();
}

void keyPressed(){
  if(key=='a'){
    videoExport.endMovie();  
  }
  if(key==' '){
    saveFrame();
  }
}
