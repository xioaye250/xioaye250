import com.hamoid.*;
VideoExport videoExport;


void setup() {
  size(800, 800);
  
  strokeWeight(10);
  fill(255);
  rect(10,10,780,780);
  delay(1000);
  fill(255);
  rect(30,10,20,590);
  rect(590,10,20,590);
  drawline();
  videoExport=new VideoExport(this);
  videoExport.startMovie();
}

void drawline(){
  stroke(0); 
  strokeWeight(10);
  line(10,40,790,40);
  line(10,580,790,580); 
  line(10,600,790,600);
  line(50,280,790,280);
  line(50,310,790,310);
  line(420,490,590,490);
  line(50,340,210,340);
  line(210,10,210,790);
  line(230,10,230,790);
  line(420,10,420,790);
  line(360,10,360,790);
  line(10,10,10,600);
  line(790,10,790,600);
}

void draw(){
  delay(2000);
  fill(255,0,0);
  rect(210,10,150,30);
  rect(50,40,160,240);
  rect(230,580,130,20);
  rect(360,580,60,20);
  rect(610,280,180,30);
  rect(510,280,80,30);
  rect(10,230,20,210);
  rect(670,600,120,190);
  fill(0,0,255);
  rect(10,580,20,20);
  rect(230,390,130,100);
  rect(420,10,170,30);
  rect(50,390,160,100);
  rect(590,420,20,130);
  rect(610,40,180,50);
  rect(500,580,70,210);
  fill(255,255,0);
  rect(360,10,60,30);
  rect(360,40,60,260);
  rect(360,280,60,30);
  rect(210,580,20,20);
  rect(610,480,20,100);
  rect(420,480,170,100);
  rect(100,600,180,190);
  videoExport.saveFrame();
}

void keypressed(){
  if(key=='q'){
    videoExport.endMovie();
  }
}
