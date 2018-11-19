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
  
  Rocket() {
    location = new PVector(width/2, height); 
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0); 
    dna = new DNA();
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
  
  void calcFitness() {
    //float d = PVector.dist(location,target);
    //fitness = pow(1/d,2);
    //System.out.println(recordDist);
    finDist = PVector.dist(location, target.location);
    fitness = pow(1/((finishTime+recordTime*0.05)*(recordDist+finDist*0.15)), 2);
    //System.out.print(Math.log10(fitness) + " ");
    if (stopped) fitness *= 0.1;
    if (hitTarget) fitness += 2;
    //System.out.println(Math.log10(fitness));
  }
  
    void render() {
    fill(200);
    PVector dir;
    PVector perp;
    if (velocity.mag() != 0) {
      dir = velocity.copy().normalize();
    } else {
      dir = new PVector(0, 1);
    }
    perp = dir.copy().rotate(HALF_PI);
    perp.mult(10);
    dir.mult(30);
    
    triangle(location.x-dir.x+perp.x, location.y-dir.y+perp.y, location.x, location.y, location.x-dir.x-perp.x, location.y-dir.y-perp.y);
  }
  
  void run() {
    if (!hitTarget && !stopped) {
      applyForce(dna.genes[genecount]);
      genecount++;
      update();
    }
    if (!hitTarget) finishTime++;
    if (target.contains(location)) {
      hitTarget = true; 
    }
    }
    
    void obstacles() {
    for (Obstacle obs : obstacles) {
      if (obs.contains(location)) {
        stopped = true;
      }
    }
  }
  
    void checkTarget() {
    float d = dist(location.x, location.y, target.location.x, target.location.y);
    if (d < recordDist) {
      recordDist = d;
      recordTime = finishTime;
    }
  }
  }
