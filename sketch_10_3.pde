import com.hamoid.*;
VideoExport videoExport;

void setup(){
  size(600,600);
  background(#584D40);
  delay(2000);
 
  videoExport=new VideoExport(this); 
  videoExport.startMovie();
}

void draw(){
  for (int i =0;i<=600;i+=10 ){
    stroke(255,200,20);
    line(i+600,0,0,1200-i);

  }
  for (int j =600;j>=0;j-=10 ){
    stroke(255,200,20);
    line(0,-j,1200-j,600);
  }
  for (int k =0;k>=-600;k-=10 ){
    stroke(255,200,20);
    line(k,0,600,1200+k);
    
   } 
  for (int z =0;z<=600;z+=10 ){
    stroke(255,200,20);
    line(600,-z,z-600,600);
  }
  videoExport.saveFrame();
}

void keypressed(){
  if (key=='g'){
    videoExport.endMovie();
  }
}
