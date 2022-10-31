void UI() {
  cps = new ControlP5(this, createFont("微软雅黑", 12));

  int width_1 = 200;
  int height_1 = 20;

  cps.addSlider("sides", 3, 110,20, 40,40,width_1,height_1).setLabel("面数");
  cps.addSlider("topRadius", 1, 200, 40, 40,70,width_1,height_1).setLabel("topRadius   ");
  cps.addSlider("bottomRadius", 0, 200, 40, 40,100,width_1,height_1).setLabel("bottomRadius");
  cps.addSlider("tall", 0, 500, 300, 40,130,width_1,height_1).setLabel("tall");
  cps.addSlider("c", 0, 255, 100, 40,160,width_1,height_1).setLabel("color");

  cps.setAutoDraw(false);
}

void lightSettings() {
  lightSpecular(255, 255, 255);
  directionalLight(255, 255, 255, 1, 1, -1);
  specular(100, 20, 200);
  shininess(15);
}

void UIShow(){
  cam.beginHUD();
  lights();
  cps.draw();
  cam.endHUD();//固定滑块位置
  
  if (mouseX<300 && mouseY< height/2) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }//防止在用滑块进行交互时受到鼠标的影响
}
