class Rocket {
  PVector location; 
  PVector velocity; 
  PVector acceleration; 
  DNA dna;
  float distance;
  float fitness; 
  Boolean hitTarget = false;
  boolean stopped = false; 
  int finishTime; 
  int genecount = 0;
  float recordDist = height;
  float recordTime; 
  float finDist; 
  float nfitness; 
  
  Rocket() {
    location = Consts.drawShape(Consts.shape); 
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0); 
    dna = new DNA();
    fitness = 0;
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);    
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void show() {
    pushMatrix();
    noStroke();
    fill (255, 150);
    translate(location.x, location.y);
    rotate(velocity.heading());
    rectMode(CENTER);
    rect(0, 0, 25, 5);
    popMatrix();
  }
  
  void intermediateFitness() {
    finDist = PVector.dist(location, Consts.drawShape(1)) + 0.0001;
    //nfitness = pow(1/(finDist),2);
    //fitness += nfitness;
    //fitness += nfitness/(Consts.time+1);
    fitness += finDist;
  }
  
  void calcFitness() {
    //print(fitness+" ");
    fitness = 1/fitness;
    print(fitness+"\n");
  }
  
  void render() {
    //fill(200);
    //PVector dir;
    //PVector perp;
    //if (velocity.mag() != 0) {
    //  dir = velocity.copy().normalize();
    //} else {
    //  dir = new PVector(0, 1);
    //}
    //perp = dir.copy().rotate(HALF_PI);
    //perp.mult(10);
    //dir.mult(30);
    
    //triangle(location.x-dir.x+perp.x, location.y-dir.y+perp.y, location.x, location.y, location.x-dir.x-perp.x, location.y-dir.y-perp.y);
    stroke(153); 
    float x = location.x;
    float y = location.y; 
    point(x,y); 
  }
  
  void run() {
    applyForce(dna.genes[genecount]);
    genecount++;
    update();
    intermediateFitness();
  }
}