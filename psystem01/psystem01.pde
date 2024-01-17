CameraControl control; // カメラ操作
ArrayList<Particle> particles;
int N = 10;

void setup(){
  size(1000, 1000, P3D);
	colorMode(HSB);

  control = new CameraControl(this); // setup()の中でnewするだけ

  particles = new ArrayList<Particle>();
  int R = 60;
  for (int i = 0; i < N; ++i){
    Particle p_elem = new Particle(
                      new PVector(
                        random(-R,R),
                        random(-R,R),
                        random(-R,R)
                      ));
    particles.add(p_elem);
  }

  frameRate(60);
}

int cnt = 0;
void draw(){
	background(255);
  ++cnt;

/*
  camera(0,width,0,
         height,0,0,
         1,0,0);
*/

  stroke(0);
  hint(DISABLE_DEPTH_TEST);
  text("[UP],[DOWN] : Tilt up/down", 10, 20);
  text("[LEFT],[RIGHT] : Pan left/right", 10, 35);
  text("[w],[s] : Move forward/backward", 10, 50);
  text("[a],[d] : Move left/right", 10, 65 );
  text("[e],[c] : Move up/down", 10, 80 );
  hint(ENABLE_DEPTH_TEST);
	translate(width/2, height/2);

  lights();
  sphere(50);

  for (int x=-1500; x<=1500; x+=50) {
    line( x, 100, -1500, x, 100, 1500 );
  }
  for (int z=-1500; z<=1500; z+=50) {
    line( -1500, 100, z, 1500, 100, z );
  }

  noStroke();

  for (Particle p : particles){
    p.show();
    p.update();
  }

}



