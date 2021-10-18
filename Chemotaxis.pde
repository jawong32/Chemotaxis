Bacterium[] bacteria = new Bacterium[600];

void setup() {
  size(800, 800, P3D);
  noStroke();
  frameRate(100);
  for (int i = 0; i < 600; i++) {
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
  color rgb;
  int size;

  Bacterium() {
    this.x = Rand.num(800, 5);
    this.y = Rand.num(800, 5);
    this.z = Rand.num(40, 5);

    this.rgb = color(Rand.num(256, 0), Rand.num(256, 0), Rand.num(256, 0));

    this.size = Rand.num(10, 3);
  }

  void explode() {
    this.x += Rand.num(400, -200);
    this.y += Rand.num(400, -200);
  }

  void move() {
    int max = 15;
    int min = -5;
    if (mousePressed) {
      switch (mouseButton) {
      case LEFT:
        this.explode();
        return;
      case RIGHT:
        max = 60;
        min = -10;
      }
    }

    if (mouseX > this.x) {
      this.x += Rand.num(max, min);
    } else {
      this.x -= Rand.num(max, min);
    }

    if (mouseY > this.y) {
      this.y += Rand.num(max, min);
    } else {
      this.y -= Rand.num(max, min);
    }
  }

  void render() {
    pushMatrix();
    translate(this.x, this.y, this.z);
    sphereDetail(Rand.num(30, 1));
    fill(this.rgb);
    if (Rand.num(2, 0) > 0) {
      sphere(this.size);
    } else {
      box(this.size);
    }
    popMatrix();
  }
}    
