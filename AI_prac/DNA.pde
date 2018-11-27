class DNA {
  PVector[] genes;
  float xoff = random(1000);
  float yoff = random(1000);
  float maxForce = 1;
  
  DNA() {
    genes = new PVector[Consts.totalTime];
    for (int i = 0; i < genes.length; i ++) {
      genes[i] = new PVector(noise(xoff)-0.5, noise(yoff)-0.5);
      genes[i].mult(random(0, maxForce));
      xoff += 0.01;
      yoff += 0.01;
    }
  }
  
  Rocket crossover(Rocket partner) {
    Rocket child = new Rocket(); 
    int midpoint = int(random(genes.length));
    for (int i = 0; i < genes.length; i ++) {
      if (i > midpoint) {
        child.dna.genes[i] = genes[i]; 
      }
      else {
        child.dna.genes[i] = partner.dna.genes[i]; 
      }
    }return child;
  }
  
    void mutate(float mutationRate) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
        genes[i] = PVector.random2D();;
        genes[i].mult(random(0, maxForce));
      }
    }
   }
}