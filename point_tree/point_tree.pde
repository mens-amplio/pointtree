import unlekker.util.*;
import unlekker.modelbuilder.*;
import ec.util.*;

int canvasSize = 500;
int sphereRadius = 40;
int counter = 0;
int PERIOD_LIMIT = 50;
int LEVEL_LIMIT = 2;
int LEVEL_DENSITY = 3;
int last_level = 0;
ArrayList <ArrayList> allPoints = new ArrayList();
ArrayList <Node> allPointsFlat = new ArrayList();

void setup() {
  size(canvasSize, canvasSize, P3D);
  // define an origin point
  Node origin = new Node(null, 0, 0, 0);
  
  // create the 0th level
  ArrayList <Node> zeroth = new ArrayList();
  zeroth.add(origin);
  allPoints.add(zeroth);
  // add the origin to the flat list used for rendering
  allPointsFlat.add(origin);
  
  background(0);
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
        for (int i = 0; i < LEVEL_DENSITY; i++) {
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
  }
}

void render_point(Node pt) {
  translate(int(pt.node.x), abs(int(pt.node.y)), int(pt.node.z));
  sphere(20);

  println(pt.node.x + " " + pt.node.y + " " + pt.node.z);
}




