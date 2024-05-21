int cellSize = 40;  // Taille des cellules du labyrinthe
int cols, rows;     // Nombre de colonnes et de lignes
Player player;
ArrayList<Ball> balls;
ArrayList<Hole> holes;
int score = 0;
boolean gameOver = false;
int holeTimer = 0;
int holeInterval = 5; // Intervalle pour l'apparition des trous

void setup() {
  size(800, 800);
  cols = width / cellSize;
  rows = height / cellSize;
  player = new Player(1, 1);
  balls = new ArrayList<Ball>();
  holes = new ArrayList<Hole>();
  generateBalls();
}

void draw() {
  background(255);
  
  if (!gameOver) {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        stroke(0);
        noFill();
        rect(i * cellSize, j * cellSize, cellSize, cellSize);
      }
    }
    
    for (Ball ball : balls) {
      ball.display();
    }
    
    for (Hole hole : holes) {
      hole.display();
    }
    
    player.display();
    checkCollisions();
    
    if (frameCount % holeInterval == 0) {
      generateRandomHole();
    }
  } else {
    textSize(32);
    fill(0);
    textAlign(CENTER, CENTER);
    text("Game Over! Score: " + score, width / 2, height / 2);
  }
}

void generateBalls() {
  // Générer des boules
  for (int i = 0; i < 600; i++) {
    int x = int(random(1, cols));
    int y = int(random(1, rows));
    balls.add(new Ball(x, y));
  }
}

void generateRandomHole() {
  int x = int(random(1, cols));
  int y = int(random(1, rows));
  holes.add(new Hole(x, y));
}

void checkCollisions() {
  for (int i = balls.size() - 1; i >= 0; i--) {
    Ball ball = balls.get(i);
    if (player.x == ball.x && player.y == ball.y) {
      balls.remove(i);
      score++;
    }
  }
  
  for (Hole hole : holes) {
    if (player.x == hole.x && player.y == hole.y) {
      gameOver = true;
    }
  }
}

void keyPressed() {
  if (keyCode == UP) {
    player.move(0, -1);
  } else if (keyCode == DOWN) {
    player.move(0, 1);
  } else if (keyCode == LEFT) {
    player.move(-1, 0);
  } else if (keyCode == RIGHT) {
    player.move(1, 0);
  }
}

class Player {
  int x, y;
  
  Player(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void move(int dx, int dy) {
    int newX = x + dx;
    int newY = y + dy;
    
    if (newX >= 1 && newX < cols && newY >= 1 && newY < rows) {
      x = newX;
      y = newY;
    }
  }
  
  void display() {
    fill(0, 0, 255);
    noStroke();
    rect(x * cellSize, y * cellSize, cellSize, cellSize);
  }
}

class Ball {
  int x, y;
  
  Ball(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    fill(0, 255, 0);
    noStroke();
    ellipse(x * cellSize + cellSize / 2, y * cellSize + cellSize / 2, cellSize / 2, cellSize / 2);
  }
}

class Hole {
  int x, y;
  
  Hole(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    fill(255, 0, 0);
    noStroke();
    ellipse(x * cellSize + cellSize / 2, y * cellSize + cellSize / 2, cellSize / 2, cellSize / 2);
  }
}
