int Vr = 5;

class Particle{
  PVector location;
  PVector velocity;
  float hue;

  Particle (PVector loc, int R){ 
    velocity = new PVector(
                          0,
                          0,
                          0
                          );
    location = loc;
  }

  void update(int flame){
//    println("acceleration :", acceleration);
//    println("location :", location);
    hue  = 255 * noise((flame + 0.1 * L2_norm(location)) * .0006);
  }

  float L2_norm(PVector A){
    float norm = abs(A.x) * abs(A.x) + 
				 abs(A.y) * abs(A.y) +
				 abs(A.z) * abs(A.z); 
    //float norm = sqrt(A.dot(A));
    return norm;
  }

  void show(boolean DEBUG){
//    if (DEBUG) println(L2_norm(velocity));
    if (hue >= 255 - 1){
    float n = L2_norm(location) / 200;
    n %= 280;
    fill(n, 255, 255);
    //fill(0,0,0);
    translate(location.x, -location.y, location.z);
    sphere(Vr);
    translate(-location.x, location.y, -location.z);
    }
  }
}
