class Obstacle {
  PVector location;
  float width, height; 
  
  Obstacle(PVector loc, float w, float h) {
    location = loc; 
    width = w;
    height = h; 
  }
  
  boolean contains(PVector v) {
    if (v.x > location.x && v.x < location.x + width && v.y > location.y && v.y < location.y + height) {
      return true;
    } else {
      return false;
    }
  }
  
  void render() {
    fill(0);
    rect(location.x, location.y, width, height);
  }
}
