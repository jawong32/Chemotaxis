Bacterium[] bacteria = new Bacterium[(int) (Math.random() * 500) + 100];

void setup() {
  size(800, 800, P3D);
  noStroke();
  for (int i = 0; i < bacteria.length; i++) {
    bacteria[i] = new Bacterium();
  }
}   

void draw() {
  lights();
  background(0);
  for (Bacterium b : bacteria) {
    b.move();
    b.render();
  }
}  

static class Rand {
  static int num(int n, int m) {
    return (int) (Math.random() * n) + m;
  }
}

class Bacterium { 
  int x, y, z;
  int r, g, b;
  int size;

  Bacterium() {
    this.x = (int) (Math.random() * 800) + 5;
    this.y = (int) (Math.random() * 800) + 5;
    this.z = (int) (Math.random() * 40) + 5;
    this.r = Rand.num(255, 0);
    this.g = Rand.num(255, 0);
    this.b = Rand.num(255, 0);
    this.size = (int) (Math.random() * 10) + 3;
  }

  void explode() {
    this.y += Rand.num(200, -200);
    this.x += Rand.num(200, -200);
  }

  void move() {
    if (mousePressed) {
      this.explode();
      return;
    }
    
    if (mouseY > this.y) {
      this.y += (int) (Math.random() * 15) - 5;
    } else {
      this.y -= (int) (Math.random() * 15) - 5;
    }

    if (mouseX > this.x) {
      this.x += (int) (Math.random() * 15) - 5;
    } else {
      this.x -= (int) (Math.random() * 15) - 5;
    }
    
    this.z += Rand.num(10, -10);
  }

  void render() {
    pushMatrix();
    translate(this.x, this.y, this.z);
    fill(this.r, this.g, this.b);
    sphere(this.size);
    popMatrix();
  }
}    
