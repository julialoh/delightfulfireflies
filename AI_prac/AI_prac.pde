Population population;
ArrayList<Obstacle> obstacles;
int maxTimeInc = 20;

void setup() {
  size(640, 480);
  Consts.getTime(Consts.shape);
  Consts.width = width;
  Consts.height = height;
  frameRate(360);
  float mutationRate = 0.02;
  population = new Population(mutationRate, 200);
  background(255);
}

void draw() {
  //print(Consts.drawShape(Consts.shape).x+ " ");
  //print("YAAAAA ");
  for (int i = 0; i<10; i++) {
    if (population.generations % maxTimeInc == 0) {
      Consts.endTime = min(Consts.endTime+1, Consts.totalTime);
    }
    for (int j = 0; j < Consts.endTime; j++) {
      population.live();
    }
    Consts.getTime(Consts.shape);
    population.fitness();
    population.selection();
    population.reproduction();
  }
  background(255);
  for (int j = 0; j < Consts.endTime+1; j++) {
    
    if (Consts.time < Consts.endTime) {
      population.live();
      Consts.time++;
      stroke(255,0,0);
      point(Consts.drawShape(1).x,Consts.drawShape(1).y);
    } else {
      Consts.getTime(Consts.shape);
      population.fitness();
      population.selection();
      population.reproduction();
      if (population.generations % maxTimeInc == 0) {
        Consts.endTime = min(Consts.endTime+1, Consts.totalTime);
      }
    }
    
    population.render();
    
    fill(0);
  }
  //text("Generation #: " + population.getGenerations(), 10, 18);
  //text("Cycles left: " + (Consts.totalTime-Consts.time), 10, 36);
}