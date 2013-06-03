class Node {
  PVector node;
  PVector parent;
  private final int ROD_LENGTH = 50;
  private final int DIVERGENT_ANGLE = 15; // degrees!
  
  Node(PVector nodeParent) {
    this.parent = nodeParent;
  }
  
  Node(PVector nodeParent, int x, int y, int z) {
    this.parent = nodeParent;
    this.node = new PVector(x, y, z);
  }
  
  void setPosition() {
    float x = this.parent.x + 50;
    float y = (ROD_LENGTH * cos(DIVERGENT_ANGLE)) + this.parent.y;
    float z = (ROD_LENGTH * sin(DIVERGENT_ANGLE)) + this.parent.z;
    this.node = new PVector(x, y, z);
  }
  
  float getX() {
    return this.node.x;
  }
}


