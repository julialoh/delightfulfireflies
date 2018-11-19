class Target {
  PVector location;
  int size;
  
  Target(PVector loc, int s) {
    location = loc;
    size = s;
  }
  
  boolean contains(PVector v) {
    if (PVector.dist(v, location) < size/2) {
      return true;
    } else{
      return false; 
    }
  }
  
  void render() {
    fill(255);
    stroke(0);
    ellipse(location.x, location.y, size, size);
  }
}
