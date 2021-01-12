

/* 
Code written and developed by Harjot Singh Tathgur
11/22/2020
*/

// Global Declarations before Maze is made
int WIDTH = 1400;
int HEIGHT = 900;
// Change block length to change how large the maze is
int blockLength = 20;
Point[][] mazePoints = createMazeArr(WIDTH/blockLength, HEIGHT/blockLength);
Boolean[][] horizontals = createWalls(WIDTH/blockLength, HEIGHT/blockLength-1);
Boolean[][] verticals = createWalls(WIDTH/blockLength-1, HEIGHT/blockLength);
int currentX = floor(random(WIDTH/blockLength));
int currentY = floor(random(HEIGHT/blockLength));
int firstX = currentX;
int firstY = currentY;
int visited = 0;
ArrayList<Point> stack = new ArrayList<Point>();

// Point Class
class Point {
  int x;
  int y;
  boolean visited;
  
  Point(int x, int y, boolean visited) {
    this.x = x;
    this.y = y;
    this.visited = visited;
  }
  
  void setVisited(boolean status) {
    this.visited = status;
  }
  
  int getX() {
    return this.x; 
  }
  
  int getY() {
    return this.y; 
  }
  
  boolean getVisited() {
    return this.visited; 
  }
}

// Create Maze Array
Point[][] createMazeArr(int x, int y) {
  Point[][] mazePoints = new Point[x][y];
  for (int i = 0; i < x; i++) {
    for (int j = 0; j < y; j++) {
      mazePoints[i][j] = new Point(i,j,false);
    }
  } 
  return mazePoints;
}

// Create Horizontal and Vertical Arrays
Boolean[][] createWalls(int x, int y) {
  Boolean[][] walls = new Boolean[x][y];
  for (int i = 0; i < x; i++) {
    for (int j = 0; j < y; j++) {
      walls[i][j] = true;
    }
  }
  
  return walls;
}

void updateMaze(int currX, int currY) { 
  // Return lines
  if (visited == (WIDTH/blockLength)*(HEIGHT/blockLength) && currX == firstX && currY == firstY) {
    return;
  }
  
  print(visited + "\n");
  
  // Increment Visited Counter and Update Maze Points Visited Attribute
  if (mazePoints[currX][currY].getVisited() == false) {
    mazePoints[currX][currY].setVisited(true); 
    visited++;
  }
  
  if (currX==0 && currY==0) {
    if (mazePoints[currX+1][currY].getVisited() == true &&
        mazePoints[currX][currY+1].getVisited() == true) {
          int index = stack.size()-1;
          currentX = stack.get(index).getX();
          currentY = stack.get(index).getY();
          stack.remove(index);
          return;
    }
  } else if (currX==WIDTH/blockLength-1 && currY==0) {
    if (mazePoints[currX][currY+1].getVisited() == true &&
        mazePoints[currX-1][currY].getVisited() == true) {
          int index = stack.size()-1;
          currentX = stack.get(index).getX();
          currentY = stack.get(index).getY();
          stack.remove(index);
          return;
    }
  } else if (currX==0 && currY==HEIGHT/blockLength-1) {
    if (mazePoints[currX][currY-1].getVisited() == true &&
        mazePoints[currX+1][currY].getVisited() == true) {
          int index = stack.size()-1;
          currentX = stack.get(index).getX();
          currentY = stack.get(index).getY();
          stack.remove(index);
          return;
    }
  } else if (currX==WIDTH/blockLength-1 && currY==HEIGHT/blockLength-1) {
    if (mazePoints[currX][currY-1].getVisited() == true &&
        mazePoints[currX-1][currY].getVisited() == true) {
          int index = stack.size()-1;
          currentX = stack.get(index).getX();
          currentY = stack.get(index).getY();
          stack.remove(index);
          return;
    }
  } else if (currX==0) {
    if (mazePoints[currX][currY-1].getVisited() == true &&
        mazePoints[currX+1][currY].getVisited() == true &&
        mazePoints[currX][currY+1].getVisited() == true) {
          int index = stack.size()-1;
          currentX = stack.get(index).getX();
          currentY = stack.get(index).getY();
          stack.remove(index);
          return;
    }
  } else if (currX==WIDTH/blockLength-1) {
    if (mazePoints[currX][currY-1].getVisited() == true &&
        mazePoints[currX][currY+1].getVisited() == true &&
        mazePoints[currX-1][currY].getVisited() == true) {
          int index = stack.size()-1;
          currentX = stack.get(index).getX();
          currentY = stack.get(index).getY();
          stack.remove(index);
          return;
    }
  } else if (currY-1<0) {
    if (mazePoints[currX+1][currY].getVisited() == true &&
        mazePoints[currX][currY+1].getVisited() == true &&
        mazePoints[currX-1][currY].getVisited() == true) {
          int index = stack.size()-1;
          currentX = stack.get(index).getX();
          currentY = stack.get(index).getY();
          stack.remove(index);
          return;
    }
  } else if (currY==HEIGHT/blockLength-1) {
    if (mazePoints[currX][currY-1].getVisited() == true &&
        mazePoints[currX+1][currY].getVisited() == true &&
        mazePoints[currX-1][currY].getVisited() == true) {
          int index = stack.size()-1;
          currentX = stack.get(index).getX();
          currentY = stack.get(index).getY();
          stack.remove(index);
          return;
    }
  } else {
    if (mazePoints[currX][currY-1].getVisited() == true &&
        mazePoints[currX+1][currY].getVisited() == true &&
        mazePoints[currX][currY+1].getVisited() == true &&
        mazePoints[currX-1][currY].getVisited() == true) {
          int index = stack.size()-1;
          currentX = stack.get(index).getX();
          currentY = stack.get(index).getY();
          stack.remove(index);
          return;
    }
  }
  
  stack.add(mazePoints[currX][currY]);
  
  int direction = floor(random(4));
  
  // Possible directions:
  // 0-top : 1-right : 2-down : 3-left  
  if (direction == 0) {
    if (currY == 0 || mazePoints[currX][currY-1].getVisited() == true) {
      return;
    } else {
      currentY--;
      horizontals[currX][currY-1] = false;
    }
  } else if (direction == 1) {
    if (currX == WIDTH/blockLength-1 || mazePoints[currX+1][currY].getVisited() == true) {
      return;
    } else {
      currentX++;
      verticals[currX][currY] = false;
      
    }
  } else if (direction == 2) {
    if (currY == HEIGHT/blockLength-1 || mazePoints[currX][currY+1].getVisited() == true) {
      return;
    } else {
      currentY++;
      horizontals[currX][currY] = false;
    }
  } else {
    if (currX == 0 || mazePoints[currX-1][currY].getVisited() == true) {
      return;
    } else {
      currentX--;
      verticals[currX-1][currY] = false;
    }
  }
  
  return;
}

void setup() {
  size(1400, 900);
  stroke(255);
  strokeWeight(1);
  
  frameRate(60);
  
  updateMaze(firstX, firstY);
}

void draw() { 
  background(0);
  
  updateMaze(currentX, currentY);
  
  // Draw Borders
  line(0,0,WIDTH,0);
  line(0,0,0,HEIGHT);
  line(0,HEIGHT,WIDTH,HEIGHT);
  line(WIDTH,0,WIDTH,HEIGHT);
 
  noStroke();
  fill(255,100,100);
  
  for (int i = 0; i < stack.size(); i++) {
    square(stack.get(i).getX()*blockLength, stack.get(i).getY()*blockLength, blockLength);
  }
  
  stroke(255);
  fill(255,255,255);
  
  square(currentX*blockLength, currentY*blockLength, blockLength);
  
  fill(255,255,0);
  
  // Draw Horizontal Walls
  for (int i = 0; i < WIDTH/blockLength; i++) {
    for (int j = 0; j < HEIGHT/blockLength-1; j++) {
      if (horizontals[i][j] == true) {
        line(i*blockLength,blockLength*(j+1),(i+1)*blockLength,blockLength*(j+1));
      }
    }
  } 
  
  // Draw Vertical Walls
  for (int i = 0; i < WIDTH/blockLength-1; i++) {
    for (int j = 0; j < HEIGHT/blockLength; j++) {
      if (verticals[i][j] == true) {
        line((i+1)*blockLength,blockLength*j,(i+1)*blockLength,blockLength*(j+1));
      }
    }
  }
}
