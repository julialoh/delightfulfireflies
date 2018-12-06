static class Consts {
  public static int shape = 0;
  public static int time = 0;
  public static int scale = 5;
  public static int endTime = 10;
  public static int totalTime = 0;
  public static int width = 0;
  public static int height = 0;
  
  public static int getColor(){
    return (int)(360 * ((float)20 * time/totalTime))%360;
  }
  
   public static PVector getRapierTime() {
    time = 0; 
    totalTime = 200; 
    return new PVector(0, 20); 
  }
  
  public static PVector drawRapier() {
    float t = (float)(time-100)/10;    
    float x= t + (cos(16*t)/t);
    float y= t + (sin(16*t)/t);
    return new PVector(x*scale+width/2,-y*scale+height/2);
  }
  
  
  public static PVector getSupermanTime() {
    time = 0; 
    totalTime = 280; 
    return new PVector(0, 28); 
  }
  
  public static PVector drawSuperman() {
    float t = (float)(time-140)/10; 
    float tp = abs(t);    
    float x = -12*tp + 16*(abs(t-1)) + 12*abs(t-2) - 12*abs(t-3) - 16*abs(t-4) + 19/2*abs(t-5) + 15/2*abs(t-6) + 15/2*abs(t-7) - 
    2*abs(t-8) + 5/2*abs(t-9) + 17/2*abs(t-10) - 13/2*abs(t-11) + 5/2*abs(t-13) - abs(t-14) - 3/2*abs(t-15) - 3/2*abs(t-16) - 5/4*abs(t-17)
    + 11/4 * abs(t-18) + 4*abs(t-22) - 4*abs(t-23) + 2*abs(t-24) - 1/2*abs(t-25) - 2*abs(t-26) + 1/2*abs(t-27)
    + 5/4*pow((abs(t-15) - abs(t-16) - 1), 2) - 1/2*pow((abs(t-27) - abs(t-29) + 1), 2) + 19/2*cos(PI/4*((abs(t-11) - (t-13)))) + 14*cos(PI/4*((abs(t-18) - abs(t-19) + 1))) 
    - 3/4*(abs(t-18) - abs(t-19)) - 17/2*cos(PI/4*((abs(t-19) - abs(t-21)))) + 9*sin(PI/4*((abs(t-21) - abs(t-22) + 1))) - 10*(abs(t-13)/(t-13)) + 20*(abs(t-17)/(t-17)) - 6*(abs(t-25)/(t-25)) - 9;
    float y = 14*tp - 10*abs(t-1) - 4*abs(t-2) - 4*abs(t-3) - 10*abs(t-4) + 203/12*abs(t-5) - 35/12*abs(t-6) - 35/12*abs(t-7) + 35/12*abs(t-8) + 7/3*abs(t-9) - 7/3*abs(t-10) + 5/2*abs(t-13)
    - 5/2*abs(t-14) - 17/4*abs(t-15) + 6*abs(t-16) - 119/24*abs(t-17) + 77/24*abs(t-18) + 5/2*abs(t-23) - 9/2*abs(t-24) + 2*abs(t-25) + abs(t-27) - abs(t-28)
    + 1/2*pow((abs(t-6) - abs(t-7)), 2) - 21/8*pow((abs(t-8) - abs(t-9) - 1/9), 2) + 11/24*pow((abs(t-10) - abs(t-11) - 1), 2) + 1/4*pow((abs(t-26) - abs(t-27) - 2), 2)
    - 2*sin(PI/4*(abs(t-11) - abs(t-13))) + 53/12*sin(PI/4*(abs(t-13) - abs(t-19) + 1)) + 7/2*sin(PI/4*(abs(t-19) - abs(t-21))) - 6*sin(PI/4*(abs(t-21) - abs(t-22) - 1))
    + 7/3*(abs(t-5)/(t-5)) + 14/3*(abs(t-8)/(t-8)) + 7*(abs(t-13)/(t-13)) + 5/2*(abs(t-25)/(t-25)) - 1451/216;
    //if (time<140){
    //  return new PVector(x*scale+width/2,-y*scale+height/2);
    //}
    //else {
    //  return new PVector(-x*scale+width/2,-y*scale+height/2);
    //}
    return new PVector(x*scale+width/2, -y*scale+height/2);
  }

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
    float t = (float)(time-160)/10;
    float tp = abs(t);
    float restX = (2 * sin(PI * ((tp-abs(tp-3)+1)/4))) + (3*(abs(tp-3)-abs(tp-4))) + 
    (5 * cos(PI * ((abs(tp-4)-abs(tp-6))/4))) + (2.5 * cos(PI * ((abs(tp-6)-abs(tp-8))/4))) - 
    (3*(abs(tp-8)-abs(tp-9))) + (1.5 * cos(PI * ((abs(tp-9)-abs(tp-11))/4))) + 
    (2 * sin(PI * ((abs(tp-11)-abs(tp-13))/4))) - (2 * sqrt(2) * sin(PI * ((abs(tp-13)-abs(tp-15)-1)/4))) + 
    (2* cos(PI * ((abs(tp-15)-abs(tp-16)+1)/4)));
    float x = (tp/t) * restX;
    float y = (-3 * (tp-abs(tp-3))) - ((5/4) * pow((abs(tp-3)-abs(tp-4)-1),2)) - 
    (5 * sin(PI * ((abs(tp-4)-abs(tp-6))/4))) + (2.5 * sin(PI * ((abs(tp-6)-abs(tp-8))/4))) - 
    (.25 * (pow((abs(tp-8) - abs(tp-9) + 1),3))) - (1.5 * sin(PI * ((abs(tp-9)-abs(tp-11))/4))) - 
    (2 * cos(PI * ((abs(tp-11)-abs(tp-13))/4))) - (1 * sqrt(2) * cos(PI * ((abs(tp-13)-abs(tp-15)-1)/4))) - 
    (2.5 * (abs(tp-15) - abs(tp-16))) + (11/2);
    return new PVector(x*scale+width/2,-y*scale+height/2);
  }
  
  
  public static PVector getBatmanTime() {
    time = 0;
    totalTime = 420;
    return new PVector(-21, 21);
  }
  
  public static PVector drawBatman() {
    float t = (float)(time-210)/10;
    float tp = abs(t);
    float x = (0.25 * (4*tp - 2*abs(tp-1) - abs(tp-2) - 
    abs(tp-4))+(23/8.)*(abs(tp-8)-abs(tp-12))-(29/10.)*
    (abs(tp-16)-abs(tp-21))+(1/4.)*pow((abs(tp-12)-
    abs(tp-16)-2),2)+10*cos((PI/16)*(abs(tp-4)-abs(tp-8)-4))-10);
    
    float y = (-1*pow(((tp-abs(tp-1)+1)/2),2)+0.25*
    (6*abs(tp-1)-11*abs(tp-2)+5*abs(tp-4))-2*(abs(tp-12)-
    abs(tp-16))-(12/pow(5,5))*pow(((abs(tp-16)-abs(tp-21)+
    37)/(2))-16,5)+ 6*sin((PI/16)*(abs(tp-4)-abs(tp-8)-4)) + 10);
    if (time<210){
      return new PVector(x*scale+width/2,-y*scale+height/2);
    }
    else {
      return new PVector(-x*scale+width/2,-y*scale+height/2);
    }
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
    new DrawAction() { public PVector getTime() {return getSupermanTime(); }
      public PVector drawShape() {return drawSuperman(); } }, 
    new DrawAction() { public PVector getTime() {return getRapierTime(); }
      public PVector drawShape() {return drawRapier(); } }, 
  };
  
  public static PVector getTime(int index) {
    return drawActions[index].getTime();
  }
  
  public static PVector drawShape(int index) {
    return drawActions[index].drawShape();
  }
}
