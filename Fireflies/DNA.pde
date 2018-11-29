class DNA {
  PVector[] genes;
  float xoff = random(1000);
  float yoff = random(1000);
  float foff = random(1000);
  int maxForce = 3;
  
  DNA(){
    genes = new PVector[Consts.totalTime];
    for (int i=0; i<genes.length; i++) {
      genes[i] = new PVector(noise(xoff)-0.5, noise(yoff)-0.5);
      genes[i].mult(random(0, noise(foff)*maxForce));
      xoff += 0.01;
      yoff += 0.01;
      foff += 0.01;
    }
  }
  
  Firefly crossover(Firefly partner) {
     Firefly larvae = new Firefly();
     int midpoint = int(random(Consts.endTime));
     for (int i=0; i<genes.length; i++){
       if(i> midpoint) {
         larvae.dna.genes[i] = genes[i];
       }
        else {
          larvae.dna.genes[i] = partner.dna.genes[i]; 
      }
    }
    return larvae;
  }
  
  void mutate(float mRate) {
    for (int i=0; i<genes.length;i++){
      if (random(1) < mRate){
        genes[i] = PVector.random2D();
        genes[i].mult(random(0, maxForce));
      }
  }
  }
  
}