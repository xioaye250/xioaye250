import com.hamoid.*;
VideoExport videoExport;

int MAXN = 120;
boolean debug = false;
float mutationRatio = 0.08;
float reproduceRatio = 0.0005;

ArrayList<PVector> food = new ArrayList<PVector>();
ArrayList<Vehical> vehs = new ArrayList<Vehical>();

void setup() {
    size(1600, 900);
    videoExport= new VideoExport(this);
    videoExport.startMovie();
  //veh = new Vehical(random(width), random(height));
  for (int i = 0; i < MAXN; i++) {
    food.add(new PVector(random(width), random(height)));
   
    if (i%2 == 0) {
      float[] DNA = new float[4];
      DNA[0] = random(10);
      DNA[1] = random(-1, 0);
      DNA[2] = random(10, 400);
      DNA[3] = random(30, 200);
      vehs.add(new Vehical(random(width), random(height), DNA));
    }
  }
  
}

void draw() {
  background(10,20);
  for (int i = vehs.size()-1; i >= 0; i--) {
    Vehical veh = vehs.get(i);
    veh.seek(veh.eat(food, 0.65, veh.DNA[2]), veh.DNA[0]);
    veh.update();
    veh.bound();
    veh.display();
    
    if (random(1.5) < reproduceRatio)
      veh.reproduce();
  }

  noStroke();
  for (PVector p : food) {
    fill(0, 255, 0);
    ellipse(p.x, p.y, 5, 5);
  }
  
  if (random(1) < 0.05) {
    if (food.size() < MAXN / 2)
      food.add(new PVector(random(width), random(height)));
  }

  String t = "Population: " + vehs.size();
  fill(255);
  textSize(20);
  text(t, 50, 50);
  videoExport.saveFrame();
}

void mousePressed() {
  debug = !debug;
}

void keyPressed(){
  if(key=='a')videoExport.endMovie();
  if(key=='z')saveFrame();
}
