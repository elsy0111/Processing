CameraControl control; // カメラ操作
ArrayList<Particle> particles;
int N = 5;

int rand_sign(){
  if (int(random(10))%2 == 1) return 1;
  else return -1;
}

void setup(){
  size(1200, 1200, P3D);
  colorMode(HSB); 

  control = new CameraControl(this); // setup()の中でnewするだけ

  particles = new ArrayList<Particle>();
  int R = 75;
  for (int i = -N; i <= N; ++i){
	  for (int j = -N; j <= N; ++j){
		  for (int k = -N; k <= N; ++k){
			Particle p_elem = new Particle(
							  new PVector(
								R * i, 
								R * j, 
								R * k
							  ), R);
			particles.add(p_elem);
		  }
	  }
  }

  frameRate(60);
}

int flame = 0;
boolean DEBUG = false;
int endline = 2500; 

void draw(){
  background(255);
  ++flame;

  //自分が移動
  translate(0, 0, -100);

  fill(0); 
  translate( width, 0, width/3);
  textSize(55); 
  text("N : " + N + "^3 = " + (N * N * N) , -width/3, height/2);
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

//  if (flame % 10 == 0) DEBUG = true;
  for (int i = particles.size()-1; i >= 0; --i){
    particles.get(i).update(flame);
    particles.get(i).show(DEBUG);
  }
  DEBUG = false;
}

