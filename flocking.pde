Flock flock;

void setup() {
  size(1000, 800);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 90; i++) {
    flock.addBoid(new Boid(width/2,height/2));
  }
}

void draw() {
  background(50);
  flock.run();
      PVector mousePos = new PVector(mouseX, mouseY);
  flock.applyForce(mousePos);
}

// Add a new boid into the System
void mousePressed() {
  

    
  flock.addBoid(new Boid(mouseX,mouseY));
}


// The Flock (a list of Boid objects)

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }
  
  void applyForce(PVector value){    
     for (Boid b : boids) {
       float multi = 6;
       PVector mousePos = new PVector(mouseX, mouseY);
       PVector diff = new PVector(b.location.x, b.location.y);
       float dist = PVector.dist(diff, mousePos );
       diff.sub(mousePos);
       diff.normalize();
       diff.mult(1.2);
       line(b.location.x, b.location.y, mousePos.x, mousePos.y);

      // b.applyForce(diff); 
    }
  }

}





