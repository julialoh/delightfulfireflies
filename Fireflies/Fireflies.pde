Population population;
int maxTimeInc = 20;
int genDraw = 5;
int value;
boolean lastKey = false;

void setup() {
  size(800, 600);
  Consts.getTime(Consts.shape);
  Consts.width = width;
  Consts.height = height;
  frameRate(360);
  population = new Population(0.002, 200);
  background(255);
}

void draw() {
  if (Consts.time < Consts.endTime) {
    population.live();
    Consts.time++;
  } else {
    if (population.generation % maxTimeInc == 0) {
      Consts.endTime = min(Consts.endTime+10, Consts.totalTime);
    }
    Consts.getTime(Consts.shape);
    population.fitness();
    population.selection();
    population.reproduction();
    if (population.generation % genDraw == 0) {
      background(255);
    }
  }
  if (population.generation % genDraw == 0) {
    if (value == 0){
    population.renderBest();
    }
    else {
      population.render();
    }
    stroke(255,0,0);
    point(Consts.drawShape(Consts.shape).x,Consts.drawShape(Consts.shape).y);
  }
}

void pressedKey() {  
    if (keyPressed == true && lastKey == false) value = 1;
    else if (keyPressed == true && lastKey == true) value = 0; 
    lastKey = keyPressed;
}
