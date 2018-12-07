import java.util.*;

class Population {
  
  int generation;
  float mutationRate;
  Firefly[] population;
  ArrayList<Firefly> matingPool;
  ArrayList<Float> errorlist; 
  float leastError; 
  //MakeT mT;
  
  Population(float mutRate, int size) {
    generation = 0;
    mutationRate = mutRate;
    population = new Firefly[size];
    for (int i = 0; i < size; i++) {
      population[i] = new Firefly();
    }
    errorlist = new ArrayList<Float>();
    //mT = new MakeT(errorlist);
  }
  
  class mySort implements Comparator<Firefly> {
    @Override
    public int compare(Firefly a, Firefly b) {
      return -Float.compare(a.totalFitness,b.totalFitness);
    }
  }
  
  void fitness() {
    errorlist = new ArrayList<Float>();
    for (int i = 0; i < population.length; i ++) {
      population[i].calcFitness();
    }
    for (int i = 0; i < population.length; i ++) {
      errorlist.add(population[i].error);
    }
    Collections.sort(errorlist);
    //print("\n");
    leastError = errorlist.get(0);
    //print(leastError + "%");
    //print("\n\n");
    generation++;
  }
  
  void selection() {
    matingPool = new ArrayList<Firefly>(); 
    float fit = 0;
    Arrays.sort(population, new mySort());
    for (int i = 1; i <= population.length; i++) {
      //print(population[i-1].fitness+ " ");
      if (population[i-1].fitness > fit) {fit = population[i-1].fitness;}
      for (int j = 0; j<((float)population.length*2)/pow(2,i);j++) {
        matingPool.add(population[i-1]);
      }
    }
  }
  
  void reproduction() {
    for (int i = 0; i < population.length; i ++) {
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
      Firefly parentA = matingPool.get(a);
      Firefly parentB = matingPool.get(b);
      Firefly child = parentA.dna.crossover(parentB);
      child.dna.mutate(mutationRate);
      population[i] = child;
    }
  }
  
  void live() {
    for (int i = 0; i < population.length; i ++) {
      population[i].run();
    }
  }
  
  public void render() {
    for (int i = 0; i < population.length; i++) {
      population[i].render();
    }
  }
  
  public void renderBest() {
    int highest = 0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].fitness < population[highest].fitness) {
        highest = i;
      }
    }
      population[highest].render();
  }
  
}