import com.hamoid.*;
VideoExport videoExport;

float t, r;
void setup() {
  size(720, 720);
  noStroke();
  videoExport=new VideoExport(this);
  videoExport.startMovie();
}
void draw() {
  clear();
  t+=.005;
  for (r=0; r<8; r+=PI/3)
    pic(360, 360, r, 90);
    videoExport.saveFrame();

}

void pic(float x, float y, float r, float d) {
  if (d>7) {
    circle(x+=cos(r)*d, y+=sin(r)*d, d/9);
    pic(x, y, r-d*d-t, d*.8);
    pic(x, y, r+d*d+t, d*.8);
    pic(x, y, r-d*d+t, d*.4);
    pic(x, y, r+d*d-t, d*.4);
  }
}

void keyPressed(){
  if (key=='a')saveFrame();
  if(key=='z')videoExport.endMovie();

}
