int canvasSize = 500;
int sphereRadius = 40;


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
  for (PVector pt : allPoints) {
    // draw point
    render_point(pt);
  }
}

void render_point(PVector pt) {
  print(pt.x);
  translate(int(pt.x), int(pt.y), int(pt.z));
  
  sphere(sphereRadius);
}
