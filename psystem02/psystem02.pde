CameraControl control; // カメラ操作
ArrayList<Particle> particles;
ArrayList<Bullet> bullets; 
Ship ship;

int N = 10;
int R = 80;
int EnemyR = 30;

boolean h, j, k, l, shoot;

int rand_sign(){
  if (int(random(10))%2 == 1) return 1;
  else return -1;
}

void setup(){
  size(1100, 1000, P3D);
  particles = new ArrayList<Particle>();
  bullets = new ArrayList<Bullet>(); 
  control = new CameraControl(this); // setup()の中でnewするだけ
  ship = new Ship(0, 0); 
  colorMode(HSB); 
  frameRate(60);
}

int flame = 0;
boolean DEBUG = false;
int endline = 2500; 

float euclid(float x, float y, float xx, float yy){
  return sqrt((x - xx) * (x - xx) + (y - yy) * (y - yy));
}

void draw(){
    if (flame % 100 == 0){
      for (int i = -N; i <= N; ++i){
        Particle p_elem = new Particle(
                          new PVector(
                            R * i, 
                            700,
                            0
                          ), EnemyR);
        particles.add(p_elem);
      }
    }

  background(255);
  ++flame;

  //自分が移動
  translate(0, 0, -100);

  fill(0); 
  translate( width, 0, width/3);
  textSize(55); 
  text("N : " + particles.size(), -width/3, height/2);
  translate(-width, 0, -width/3);

  translate(width/2, height/2);


  lights();
  fill(0,0,0);

  stroke(0);
  // Draw Axis
  line(-endline, 0, 0, endline, 0, 0);
  line(0, -endline, 0, 0, endline, 0);
  line(0, 0, -endline, 0, 0, endline);


/*
  for (int z=-1500; z<=1500; z+=50) {
    line( z, z, 1500, z, z, -1500);
  }
  for (int z=-1500; z<=1500; z+=50) {
    line( -1500, -1500, z, 1500, 1500, z );
  }
*/

  noStroke();
  ship.show(); 

//  if (flame % 10 == 0) DEBUG = true;
  for (int i = particles.size()-1; i >= 0; --i){
    if (particles.get(i).hue < 0){
        particles.remove(i);
    }else{
        particles.get(i).update(flame);
        particles.get(i).show(DEBUG);
    }
  }
  DEBUG = false;
  ship.move(h, j, k, l); 

  if (shoot && flame % 4 == 0){
    Bullet p_elem = new Bullet(ship.location.x, ship.location.y);
    bullets.add(p_elem);
  }
  
  for (int i = bullets.size() - 1; i >= 0; --i){
    bullets.get(i).update();
    bullets.get(i).show();
    if (bullets.get(i).location.y >= 500){
      bullets.remove(i);
    }
  }

  for (int i = bullets.size() - 1; i >= 0; --i){
    boolean rmv = false;
    for (int j = particles.size()-1; j >= 0; --j){
      if (euclid(bullets.get(i).location.x, bullets.get(i).location.y,
                 particles.get(j).location.x, particles.get(j).location.y)
                  <= bullets.get(i).r + particles.get(j).R){
          // particles.remove(j);
          particles.get(j).R -= 9;
          if (particles.get(j).R <= 0){
            particles.remove(j);
          }
          rmv = true;
          }
    }
    if (rmv){
      bullets.remove(i);
    }
  }

}
