class Point {
  PVector Position, speed, accelerate; 
  Point(){
  Position = new PVector(random(10,width), random(10,height));
  speed= new PVector();
  accelerate= new PVector();
  }
  
  void render(float H,float S,float B){
  //colorMode(HSB);
  fill(H,S,B);
  noStroke();
  ellipse(Position.x,Position.y,12,12);
  }
  
  void update(){
  accelerate = new PVector(mouseX-Position.x, mouseY -Position.y); 
  accelerate.limit(1);
  speed.add(accelerate);
  speed.limit(20);
  Position.add(speed);
  }
}
