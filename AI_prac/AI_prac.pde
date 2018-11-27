Population population;
ArrayList<Obstacle> obstacles;

void setup() {
  size(640, 480);
  Consts.getTime(Consts.shape);

  float mutationRate = 0.02;
  population = new Population(mutationRate, 200);
}

void draw() {
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