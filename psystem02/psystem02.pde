CameraControl control; // カメラ操作
ArrayList<Particle> particles;
ArrayList<Bullet> bullets; 
Ship ship;

int N = 5;
int R = 100;

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

void draw(){
    if (flame % 200 == 0){
      for (int i = -N; i <= N; ++i){
        Particle p_elem = new Particle(
                          new PVector(
                            R * i, 
                            300,
                            0
                          ), R);
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
}
