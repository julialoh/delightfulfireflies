Population population;
int maxTimeInc = 20;
int genDraw = 2;

void setup() {
  size(800, 600);
  Consts.getTime(Consts.shape);
  Consts.width = width;
  Consts.height = height;
  frameRate(360);
  population = new Population(0.02, 100);
  background(255);
}

void draw() {
  if (Consts.time < Consts.endTime) {
    population.live();
    Consts.time++;
  } else {
    Consts.getTime(Consts.shape);
    population.fitness();
    population.selection();
    population.reproduction();
  }
  if (population.generation % genDraw == 0) {
    population.render();
      stroke(255,0,0);
      point(Consts.drawShape(Consts.shape).x,Consts.drawShape(Consts.shape).y);
  }
}