class Target {
  PVector location;
  int size;
  int startTime;
  int endTime;
  
  Target() {
    PVector mytime = Consts.getTime(1);
    startTime = (int) mytime.x;
    endTime = (int) mytime.y;
    Consts.height = height;
    Consts.width = width;
  }
  
  boolean contains(PVector v) {
    if (PVector.dist(v, location) < size/10) {
      return true;
    } else{
      return false; 
    }
  }
  
  void render() {
    fill(255, 255,0);
    stroke(0);
    ellipse(Consts.getCircleTime().x, Consts.getCircleTime().y, size, size);
  }
}