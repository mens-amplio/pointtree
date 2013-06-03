int canvasSize = 500;
int sphereRadius = 40;
int counter = 0;
int PERIOD_LIMIT = 50;
int LEVEL_LIMIT = 10;
int LEVEL_DENSITY = 3;
int[] ACCEPTABLE_DENSITIES = {1, 2}; // Pick a density randomly.
int last_level = 0;
ArrayList <ArrayList> allPoints = new ArrayList();
ArrayList <Node> allPointsFlat = new ArrayList();
void setup() {
  size(canvasSize, canvasSize + 300, P3D);
  // define an origin point
  Node origin = new Node(null, canvasSize / 2, (canvasSize + 300) - sphereRadius, 0);
  
  // create the 0th level
  ArrayList <Node> zeroth = new ArrayList();
  zeroth.add(origin);
  allPoints.add(zeroth);
  // add the origin to the flat list used for rendering
  allPointsFlat.add(origin);
  
  background(255);
  lights();
}

void draw() {
  int lastLevelDepth = allPoints.size() - 1;
  if (lastLevelDepth < LEVEL_LIMIT) {
    // periodically add to the list of points
    if (counter < PERIOD_LIMIT) {
      counter++;
    } else {
      // reset counter
      counter = 0;

      ArrayList <Node> lastLevel = allPoints.get(lastLevelDepth);
      ArrayList newLevel = new ArrayList();
      
      for (Node pt : lastLevel) {
        int currentAcceptedDensity;
        if (lastLevelDepth < 2) {
          currentAcceptedDensity = LEVEL_DENSITY;
        } else {
          currentAcceptedDensity = ACCEPTABLE_DENSITIES[round(random(1))];
        }
          
        for (int i = 0; i < currentAcceptedDensity; i++) {
          PVector parent = new PVector(pt.node.x, pt.node.y, pt.node.z);
          Node n = new Node(parent);
          n.setPosition();
          newLevel.add(n);
          allPointsFlat.add(n);
        }
      }
      allPoints.add(newLevel);
      
      
      // render
      for (Node pt : allPointsFlat) {
        // draw point (as sphere, for the moment)
        render_point(pt);
      }
    }
  } else {
    // Could exit here...
    // Now you have a whole tree of points, 
    // ready to be animated or dumped to a file
  }
}

void render_point(Node pt) {
  pushMatrix();
  translate(int(pt.node.x), int(pt.node.y), int(pt.node.z));
  sphere(20);
  popMatrix();
}




