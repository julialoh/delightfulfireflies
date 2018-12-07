Population population;
int maxTimeInc = 20;
int genDraw = 5;
boolean value;
boolean released = true;
Firefly best;  
MakeT mT;
boolean isDone;
int moreGens;

void setup() {
  size(800, 600);
  Consts.getTime(Consts.shape);
  Consts.width = width;
  Consts.height = height;
  frameRate(360);
  population = new Population(0.2, 200);
  best = new Firefly();
  background(255);
  mT = new MakeT();
}

void draw() {
  isDone = false;
  if (Consts.time < Consts.endTime) {
    population.live();
    Consts.time++;
    best.run();
  } else { 
    if (population.generation % maxTimeInc == 0) {
      Consts.endTime = min(Consts.endTime+10, Consts.totalTime);
    }
    Consts.getTime(Consts.shape);
    population.fitness();
    if (population.generation % maxTimeInc == 0) { // add to array list
      // WRITE TO TABLE
      //mT = new MakeT(population.leastErrorList);
      //mT.setup();
      //mT.sT();
      if (!isDone || population.generation < moreGens) { // add only if not finished
        mT.myFloatData.add(population.leastError);
      }
      if (population.generation == moreGens && isDone) {
        mT.writeToTable();
        mT.sT();
      }
    }
    if (Consts.endTime == Consts.totalTime && !isDone) { // batman finishes first time
      moreGens = population.generation * 2;
      isDone = true;
    }
    population.selection();
    if (population.generation % genDraw == 0) {
      background(255);
      best = population.population[0];
      best.location = Consts.drawShape(Consts.shape); 
      best.velocity = new PVector(0,0);
      best.acceleration = new PVector(0,0); 
      //for (int i = 0; i < population.population.length; i++) {
      //  print(population.population[i].fitness+"\n");
      //}
      //print("\n\n");
      //for (int i = 0; i < population.population[0].dna.genes.length; i++) {
      //  best.dna.genes[i] = new PVector(population.population[0].dna.genes[i].x,
      //  population.population[0].dna.genes[i].y);
      //}
    }
    population.reproduction();
  }
  if (population.generation % genDraw == 0) {
    if (!value){
      best.render();
    }
    else {
      population.render();
    }
    stroke(0,0,0);
    point(Consts.drawShape(Consts.shape).x,Consts.drawShape(Consts.shape).y);
  }
}

void keyPressed() {  
    if (keyPressed == true && released == true) {
      value = !value;
    print(value+"\n");
    }
    released = false;
}

void keyReleased() {
  released = true;
}