int Vr = 100;

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
    hue  = 350 * noise((flame + L2_norm(location)) * .01);
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
    fill(hue, hue, 255);
    translate(location.x, -location.y, location.z);
    sphere(15);
    translate(-location.x, location.y, -location.z);
  }
}
