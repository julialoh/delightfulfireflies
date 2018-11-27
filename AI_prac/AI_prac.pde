Population population;
ArrayList<Obstacle> obstacles;

void setup() {
  size(640, 480);
  Consts.getTime(Consts.shape);
  Consts.width = width;
  Consts.height = height;
  frameRate(360);
  float mutationRate = 0.002;
  population = new Population(mutationRate, 200);
  background(255);
}

void draw() {
  print(Consts.drawShape(Consts.shape).x+ " ");
  if (Consts.time < Consts.totalTime) {
    population.live();
    Consts.time++;
  } else {
    background(255);
    Consts.getTime(Consts.shape);
    population.fitness();
    population.selection();
    population.reproduction();
  }
  
  population.render();
  
  fill(0);
  //text("Generation #: " + population.getGenerations(), 10, 18);
  //text("Cycles left: " + (Consts.totalTime-Consts.time), 10, 36);
}