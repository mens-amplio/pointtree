int canvasSize = 500;
int sphereRadius = 40;
int counter = 0;
int PERIOD_LIMIT = 50;

PVector origin;
ArrayList <PVector> allPoints;
void setup() {
  size(canvasSize, canvasSize, P3D);
  // define an origin point
  origin = new PVector(0, 0, 0);
  allPoints = new ArrayList();
  allPoints.add(origin);
  
  background(0);
  lights();
}

void draw() {
  // periodically add to the list of points
  if (counter < PERIOD_LIMIT) {
    // DO ALL THE THINGS
    counter++;
  } else {
    // reset counter
    counter = 0; 
  }
  
  // draw
  for (PVector pt : allPoints) {
    // draw point
    render_point(pt);
  }
}

void render_point(PVector pt) {
  pushMatrix();
  translate(int(pt.x), int(pt.y), int(pt.z));
  sphere(sphereRadius);
  popMatrix();
}


a node has a parent point and a distance from the parent
a node can have 1 to 2 children, unless its depth is sufficiently great



