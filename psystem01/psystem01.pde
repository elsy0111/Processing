CameraControl control; // カメラ操作
ArrayList<Particle> particles;
int N = 700;

int rand_sign(){
  if (int(random(10))%2 == 1) return 1;
  else return -1;
}

void setup(){
  size(1200, 1200, P3D);
	colorMode(HSB);

  control = new CameraControl(this); // setup()の中でnewするだけ

  particles = new ArrayList<Particle>();
  int R = 200;
  for (int i = 0; i < N; ++i){
  	float A = rand_sign() * random(R/4,R); 
    Particle p_elem = new Particle(
                      new PVector(
                        //rand_sign() * random(R/4,R),
						A,  
						A, 
                        rand_sign() * random(R/4,3*R)
                      ), R);
    particles.add(p_elem);
  }

//  frameRate(60);
}

int flame = 0;
int black_hole = 45;
boolean DEBUG = false;
int endline = 2500; 

void draw(){
	background(255);
  ++flame;

/*
  camera(0,width,0,
         height,0,0,
         1,0,0);
*/

  //自分が移動
  translate(0, 0, -100);

  fill(0); 
  translate(width/2, 0, 0);
  textSize(55); 
  text("N : " + N, width/5, height/2);
  translate(-width/2, 0, 0);

  /*
  textSize(15); 
  text("[UP],[DOWN] : Tilt up/down", 10, 20);
  text("[LEFT],[RIGHT] : Pan left/right", 10, 35);
  text("[w],[s] : Move forward/backward", 10, 50);
  text("[a],[d] : Move left/right", 10, 65 );
  text("[e],[c] : Move up/down", 10, 80 );
  */
  translate(width/2, height/2);


  lights();
  fill(0,0,0);
  sphere(black_hole);

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

//  if (flame % 10 == 0) DEBUG = true;
  for (int i = particles.size()-1; i >= 0; --i){
    particles.get(i).update(flame, black_hole);
    particles.get(i).show(DEBUG);
  }
  DEBUG = false;
}

