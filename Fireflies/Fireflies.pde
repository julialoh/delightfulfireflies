Population population;
int maxTimeInc = 20;

void setup() {
  size(640, 480);
  Consts.getTime(Consts.shape);
  Consts.width = width;
  Consts.height = height;
  frameRate(360);
  float mutationRate = 0.02;
  population = new Population();
  background(255);
}

void draw() {
  
}