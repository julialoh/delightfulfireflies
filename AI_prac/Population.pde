import java.util.*;

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
  class mySort implements Comparator<Rocket> {
    @Override
    public int compare(Rocket a, Rocket b) {
      return -Float.compare(a.fitness,b.fitness);
    }
  }
  
  void selection() {
    matingPool = new ArrayList<Rocket>(); 
    float fit = 0;
    
    Arrays.sort(population, new mySort());
    for (int i = 1; i <= population.length; i++) {
      //print(population[i-1].fitness+ " ");
      if (population[i-1].fitness > fit) {fit = population[i-1].fitness;}
      for (int j = 0; j<((float)population.length*2)/pow(2,i);j++) {
        matingPool.add(population[i]);
      }
    }
    //print(fit+"\n");
    //float fit = 0;
    //for (int i = 0; i < population.length; i ++) {
    //  if (population[i].fitness > fit) {fit = population[i].fitness;}
    //  float n = pow((float)(13+Math.log10(population[i].fitness)), 4);
    //  for (int j = 0; j < n; j++) {
    //      matingPool.add(population[i]);
    //  }
    //}  
    //print(matingPool.size()+" ");
    //print(fit+" ");
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