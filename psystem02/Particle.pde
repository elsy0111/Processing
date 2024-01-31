int Vr = 5;

class Particle{
  PVector location;
  PVector velocity;
  float hue;

  Particle (PVector loc, int R){ 
    velocity = new PVector(
                          0,
                          -1,
                          0
                          );
    location = loc;
    hue = random(100,255);
  }

  void update(int flame){
//    println("acceleration :", acceleration);
//    println("location :", location);
    location.add(velocity);
    hue-=0.4;
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
    if (hue >= 0){
    fill(hue, 255, 255);
    textSize(5);
    translate(location.x, -location.y, location.z);
    text(hue, 1, 0);
    sphere(Vr);
    translate(-location.x, location.y, -location.z);
    }
  }
}
