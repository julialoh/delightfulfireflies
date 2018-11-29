static class Consts {
  public static int shape = 1;
  public static int time = 0;
  public static int endTime = 1;
  public static int totalTime = 0;
  public static int width = 0;
  public static int height = 0;

  public static PVector getFleurTime() {
    time = 0;
    totalTime = 320;
    return new PVector(-16, 16);
  }
  
  public static float getInsideOne( int a, int b, int c, float t) {
  float num = abs(abs(t) - a) - abs(abs(t) - b) + c;
  float top = PI * num;
  return top/4;
}

public static float getInsideTwo(float t, int a, int b) {
  return abs(abs(t) - a) - abs(abs(t)-b);
} 
  
  public static PVector drawFleur() {
    float t = (time-160)/10;
    float x = (abs(t)/t) *((2*sin(getInsideOne(0, 3, 1, t)) + (3 * getInsideTwo(t,3,4)))
    + (5*cos(getInsideOne(4,6,0,t))) + (2.5*cos(getInsideOne(6,8,0,t))) - (3*getInsideTwo(t,8,9)))
    + (1.5*cos(getInsideOne(9,11,0,t))) + (2*sin(getInsideOne(11,13,0,t))) - (2*sqrt(2) * sin(getInsideOne(13,15,-1,t)))
    + (2*cos(getInsideOne(15,16,1,t)));
    float y = (-3 * getInsideTwo(t,0,3)) - (5/4)*pow((getInsideTwo(t,3,4)-1),2) - (5*sin(getInsideOne(4,6,0,t)))
    + (2.5 * sin(getInsideOne(6,8,0,t))) - (.25*pow((getInsideTwo(t,8,9)+1),3)) - (1.5*sin(getInsideOne(9,11,0,t))) 
    - (2*cos(getInsideOne(11,13,0,t))) - (2 * sqrt(2) * cos(getInsideOne(13,15,1,t)));
    return new PVector(x,y);
  }
  
  
  public static PVector getBatmanTime() {
    time = 0;
    totalTime = 420;
    return new PVector(-21, 21);
  }
  
  public static PVector drawBatman() {
    float t = (time-210)/10;
    float tp = abs(t);
    float x = (0.25 * (4*tp - 2*abs(tp-1) - abs(tp-2) - 
    abs(tp-4))+(23/8.)*(abs(tp-8)-abs(tp-12))-(29/10.)*
    (abs(tp-16)-abs(tp-21))+(1/4.)*pow((abs(tp-12)-
    abs(tp-16)-2),2)+10*cos((PI/16)*(abs(tp-4)-abs(tp-8)-4))-10);
    
    float y = (-1*pow(((tp-abs(tp-1)+1)/2),2)+0.25*
    (6*abs(tp-1)-11*abs(tp-2)+5*abs(tp-4))-2*(abs(tp-12)-
    abs(tp-16))-(12/pow(5,5))*pow(((abs(tp-16)-abs(tp-21)+
    37)/(2))-16,5)+ 6*sin((PI/16)*(abs(tp-4)-abs(tp-8)-4)) + 10);
    
    return new PVector(x,y);
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
    new DrawAction() { public PVector getTime() {return getFleurTime(); } 
      public PVector drawShape() {return drawFleur(); } },
  };
  
  public static PVector getTime(int index) {
    return drawActions[index].getTime();
  }
  
  public static PVector drawShape(int index) {
    return drawActions[index].drawShape();
  }
}