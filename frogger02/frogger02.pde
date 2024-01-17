Frog frog;
float H_b = -2;
float grid = 50;
int d = 0;
int Size = 800;
int flame = 0;
float v = 0.2;

void setup(){
  size(1500,800,P3D);
  frog = new Frog(width / 2 - grid, height - grid, grid, grid);
  frog.Other_rect(100, 100, 200, 50);
  frog.Other_rect(600, 150, 100, 50);
  frog.Other_rect(400, 400, 200, 50);
  frog.Other_rect(100, 300, 100, 50);
  frog.Other_rect(  0, 600, 150, 50);
  frog.Other_rect(600, 500, 150, 50);
  frog.Other_rect(100, 200, 150, 50);
  frog.Other_rect(100, 700, 100, 50);
}

boolean up, down, left, right;

void keyPressed(){
    if(keyCode == UP)    up = true;
    if(keyCode == DOWN)  down = true;
    if(keyCode == LEFT)  left = true;
    if(keyCode == RIGHT) right = true;
}
void keyReleased(){
    if(keyCode == UP)    up = false;
    if(keyCode == DOWN)  down = false;
    if(keyCode == LEFT)  left = false;
    if(keyCode == RIGHT) right = false;
}

void draw(){
  flame += 1;
  background(100);
  rotateX(PI * 3/10);
  //rotateZ(PI * 1/100);
  translate(350, -height/3, -350);
  fill(30);
  stroke(30);
  beginShape(TRIANGLE_STRIP);
  vertex(0       , 0       , H_b);
  vertex(0 + Size, 0       , H_b);
  vertex(0       , 0 + Size, H_b);
  vertex(0 + Size, 0 + Size, H_b);
  endShape();
  
  if (up){
    d = 0;
    frog.move(0,-v);
  }
  if (down){
    d = 2;
    frog.move(0, v);
  }
  if (right){
    d = 1;
    frog.move(v, 0);
  }
  if (left){
    d = 3;
    frog.move(-v,0);
  }

  frog.show(d);
}
