int lifetime;
int timeLow;
int lifeCounter;

Target target;

Population population;
ArrayList<Obstacle> obstacles;

void setup() {
  size(640, 480);
  lifetime = 200;
  timeLow = lifetime;
  lifeCounter = 0;

  obstacles = new ArrayList<Obstacle>();
  obstacles.add(new Obstacle(new PVector(width/2-100, height - 250), 200, 20));
  obstacles.add(new Obstacle(new PVector(width/2-100, 50), 20, 200));
  obstacles.add(new Obstacle(new PVector(width/2+80, 50), 20, 200));

  target = new Target(new PVector(width/2, 100), 60);

  float mutationRate = 0.02;
  population = new Population(mutationRate, 200);
}

void draw() {
  background(255);
  if (lifeCounter < lifetime) {
    population.live();
    lifeCounter++;
  } else {
    lifeCounter = 0;
    for (int i = 0; i < population.population.length; i++) {
      if (population.population[i].finishTime < timeLow) {
        timeLow = population.population[i].finishTime;
        //System.out.println(i);
        //System.out.println(timeLow);
      }
    }
    //System.out.println(timeLow);
    population.fitness();
    population.selection();
    population.reproduction();
  }
  
  target.render();
  for (Obstacle obs : obstacles) {
    obs.render();
  }
  population.render();
  
  fill(0);
  text("Generation #: " + population.getGenerations(), 10, 18);
  text("Cycles left: " + (lifetime-lifeCounter), 10, 36);
  text("Record cycles: " + timeLow, 10, 54);
}
