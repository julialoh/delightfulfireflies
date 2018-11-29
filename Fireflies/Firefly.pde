class Firefly {
  PVector location;
  PVector velocity;
  PVector acceleration;
  DNA dna;
  float distance;
  float fitness;
  float findist;
  float totalFitness;
  
  
  Firefly(){
    location = Consts.drawShape(Consts.shape); 
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0); 
    dna = new DNA();
    fitness = 0;
  }
  void applyforce(PVector force) {
    acceleration=force;
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void pointsFitness(){
    PVector shapeLoc = Consts.drawShape(Consts.shape);//the location you compare yourself to at any given moment in time Conts.time
    //location of the shape you want to compare yourself to   
    findist= PVector.dist(location, shapeLoc) + .001;
    //a distance closest to 0 should be wanted 
    fitness += findist;
}

  void calcFitness(){
    totalFitness = 1/fitness;
  } 
  
  void render(){
    stroke(153); 
    float x = location.x;
    float y = location.y; 
    point(x,y); 
  }
  
  void run() {
   //applyForce(dna.genes[Consts.time]);
   update();
   pointsFitness();
  }
  //rener function to draw them at a certain time rate
  //move itself knowing where it is
  //DNA, location, velocity, acceleration, fitness calculation, run (what happens at every iteration, movement calculations, what it does at every millisecond, where it goes next), render
  
}
