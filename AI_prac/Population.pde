class Population {
  Rocket[] population; 
  float mutationRate;
  ArrayList<Rocket> matingPool;
  int maxl = 13;
  int generations;
  
  Population(float mutRate, int num) {
    mutationRate = mutRate;
    population = new Rocket[num];
    for (int i = 0; i < population.length; i++) {
      population[i] = new Rocket();
    }
  }

  // void run() {
  //  for (int i = 0; i < population.length; i ++) {
  //    population[i].update(); 
  //    population[i].show();
  //  }
  //}
  
  void selection() {
    matingPool = new ArrayList<Rocket>(); 
    float fit = 0;
    for (int i = 0; i < population.length; i ++) {
      if (population[i].fitness > fit) {fit = population[i].fitness;}
      float n = pow((float)(13+Math.log10(population[i].fitness/10000000)), 4);
      for (int j = 0; j < n; j++) {
          matingPool.add(population[i]);
      }
    }  
    print(matingPool.size()+" ");
  }
  
  void reproduction() {
    for (int i = 0; i < population.length; i ++) {
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
      Rocket parentA = matingPool.get(a);
      Rocket parentB = matingPool.get(b);
      Rocket child = parentA.dna.crossover(parentB);
      child.dna.mutate(mutationRate);
      
      population[i] = child;
    }
  }
  
  void live() {
    for (int i = 0; i < population.length; i ++) {
      population[i].run();
    }
  }
  
  void render() {
    for (int i = 0; i < population.length; i ++) {
      population[i].render();
    }
  }
  
  void fitness() {
    for (int i = 0; i < population.length; i ++) {
      population[i].calcFitness();
    }
    generations++;
  }
  int getGenerations() {
    return generations;
  }
}