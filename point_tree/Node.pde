class Node {
  PVector node;
  PVector parent;
  private final int ROD_LENGTH = 70;
  private final int DIVERGENT_ANGLE = 15; // degrees!
  
  Node(PVector nodeParent) {
    this.parent = nodeParent;
  }
  
  Node(PVector nodeParent, int x, int y, int z) {
    this.parent = nodeParent;
    this.node = new PVector(x, y, z);
  }
  
  void setPosition() {
    int xVariance = 10;
    int yVariance = 20;
    int[] multiplier = {-1, 1}; // Randomly toggle the point to the left or right of its parent.
    float x = (ROD_LENGTH * sin(DIVERGENT_ANGLE)) + random(this.parent.x - xVariance, this.parent.x + xVariance) * multiplier[round(random(1))];
    float y = (ROD_LENGTH * cos(DIVERGENT_ANGLE)) + random(this.parent.y - yVariance, this.parent.y + yVariance);
    float z = this.parent.z + random(-10, 10);
    this.node = new PVector(x, y, z);
  }
  
  float getX() {
    return this.node.x;
  }
}


