import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;

Box2DProcessing box2d;

void setup() {
  size(400,300);
  smooth();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  // Create ArrayLists
  boxes = new ArrayList<Box>();
}

void draw() {
  background(255);

  if (mousePressed) {
    box2d.step();    
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }

  for (Box b: boxes) {
    b.display();
  }
}
