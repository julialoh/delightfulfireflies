static class Consts {
  public static int shape = 1;
  public static int time = 0;
  public static int endTime = 1;
  public static int totalTime = 0;
  public static int width = 0;
  public static int height = 0;
  
  public static PVector getBatmanTime() {
    time = 0;
    totalTime = 420;
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
    return new PVector(cos(((float)time)/180*PI) * 200+width/2, sin(((float)time)/180*PI) * 200+height/2);
  }
  
  public static PVector getSquareTime() {
    time = 0;
    totalTime = 400;
    return new PVector(0,400);
  }
  
  public static PVector drawSquare() {
    if (0 <= time && time <= 100) {
      return new PVector(time + width/2 - 50,0);
    }
    else if (100 < time && time <=200){
      return new PVector(width/2 + 50, time + width/2 - 50);
    }
    else if (200 <= time && time <= 300) {
      return new PVector(time - width/2 + 50,0);
    }
    else {
      return new PVector(width/2 - 50, time - width/2 + 50);
    }
    
  }
  
  interface DrawAction {
    PVector getTime();
    PVector drawShape();
  }
  
  private static DrawAction[] drawActions = new DrawAction[] {
    new DrawAction() { public PVector getTime() {return getBatmanTime(); } 
      public PVector drawShape() {return drawBatman(); } },
    new DrawAction() { public PVector getTime() {return getCircleTime(); } 
      public PVector drawShape() {return drawCircle(); } },
    new DrawAction() { public PVector getTime() {return getSquareTime(); } 
      public PVector drawShape() {return drawSquare(); } },
  };
  
  public static PVector getTime(int index) {
    return drawActions[index].getTime();
  }
  
  public static PVector drawShape(int index) {
    return drawActions[index].drawShape();
  }
}