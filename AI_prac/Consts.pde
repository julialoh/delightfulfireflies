static class Consts {
  public static int time = 0;
  public static int totalTime = 0;
  
  public static PVector getBatmanTime() {
    time = 0;
    totalTime = 42;
    return new PVector(-21, 21);
  }
  
  public static PVector drawBatman() {
    return new PVector();
    
  }
  
  public static PVector getCircleTime() {
    time = 0;
    totalTime = 360;
    return new PVector(0,360);
  }
  
  public static PVector drawCircle() {
    return new PVector(cos(time) * 200, sin(time) * 200);
  }
}
