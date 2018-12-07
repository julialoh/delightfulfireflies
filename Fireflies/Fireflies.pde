Population population;
int maxTimeInc = 20;
int genDraw = 20;
boolean value;
boolean drawog = true;
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
  population = new Population(0.002, 200);
  best = new Firefly();
  background(255);
  mT = new MakeT();
}

void draw() {
  isDone = false;
  if (Consts.time < Consts.endTime) {
    population.live();
    Consts.time++;
    //best.run();
  } else { 
    if (population.generation % maxTimeInc == 0) {
      Consts.endTime = min(Consts.endTime+10, Consts.totalTime-1);
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
        print("done");
      }
    }
    if (Consts.endTime == Consts.totalTime && !isDone) { // batman finishes first time
      moreGens = population.generation * 2;
      isDone = true;
    }
    population.selection();
    if (population.generation % genDraw == 0) {
      //for (int i = 0; i < population.population.length; i++) {
      //  print(population.population[i].totalFitness + " ");
      //}
      //print("\n\n");
      background(255);
      best = population.population[0];
      best.location = Consts.drawShape(Consts.shape); 
      best.velocity = new PVector(0,0);
      best.acceleration = new PVector(0,0);
      if (!value){
        best.render();
      }
      while (Consts.time < Consts.endTime) {
          if (drawog) {
            stroke(0,0,0);
            point(Consts.drawShape(Consts.shape).x,Consts.drawShape(Consts.shape).y);
          }
          if (!value){
            best.render();
          }
        best.run();
        Consts.time++;
      }
      Consts.time = 0;
    }
    population.reproduction();
  }
  if (population.generation % genDraw == 0) {
    if (value) {
      population.render();
      if (drawog) {
        stroke(0,0,0);
        point(Consts.drawShape(Consts.shape).x,Consts.drawShape(Consts.shape).y);
      }
    }
  }
}

void keyPressed() {  
    if (key == ' ' && keyPressed == true && released == true) {
      value = !value;
      print(value+"\n");
    }
    if (key == 'm' && keyPressed == true && released == true) {
      drawog = !drawog;
    }
    released = false;
}

void keyReleased() {
  released = true;
}