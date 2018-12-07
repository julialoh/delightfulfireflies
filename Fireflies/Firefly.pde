class Firefly {
  PVector location;
  PVector velocity;
  PVector acceleration;
  DNA dna;
  float distance;
  float fitness;
  float findist;
  public float totalFitness;
  float error;
  
  
  Firefly(){
    location = Consts.drawShape(Consts.shape); 
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0); 
    dna = new DNA();
    fitness = 0;
    error = 0;
  }
  void applyforce(PVector force) {
    acceleration.add(force);
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
    this.error = fitness;
  } 
  
  void render(){
    strokeWeight(4);
    colorMode(HSB,360,100,100);
    stroke(Consts.getColor(), 100, 100); 
    colorMode(RGB,255,255,255);
    float x = location.x;
    float y = location.y; 
    point(x,y); 
  }
  
  void run() {
   applyforce(dna.genes[Consts.time]);
   update();
   pointsFitness();
  }
  //rener function to draw them at a certain time rate
  //move itself knowing where it is
  //DNA, location, velocity, acceleration, fitness calculation, run (what happens at every iteration, movement calculations, what it does at every millisecond, where it goes next), render
  
}