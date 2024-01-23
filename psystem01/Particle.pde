int Vr = 100;

class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration = new PVector();
  float hue;
  float sc;
  float Vlim;
  float f;

  Particle (PVector loc, int R){ 
    velocity = new PVector(
                          Vr,
                          Vr,
                          0
                          );
    velocity.mult(1);
    location = loc;
    Vlim = L2_norm(loc)/5;
    hue  = L2_norm(loc)/sqrt(9)/R * 255;
    f = random(600);
  }

  void update(int flame, int black_hole){
//    println("acceleration :", acceleration);
//    println("location :", location);
    if (flame > f){ 
      acceleration.set(location);
      location.add(velocity);
      acceleration.mult(-0.01);
      velocity.add(acceleration);
    }
    sc = (max(0, 255 - abs(location.x)) + max(0, 255 - abs(location.y)) + max(0, 255 - abs(location.z)))/3;
  }

  float L2_norm(PVector A){
    //float norm = 0;
    //for (double ai : A){
    //  norm += pow(abs(ai),2);
    //}
    //pow(abs(A.x),2) + pow(abs(A.y),2) + pow(abs(A.z),2)
    float norm = sqrt(A.dot(A));
    return norm;
  }

  PVector reduce(PVector vec, float lim){
    return vec.normalize().mult(lim * 0.95);
  }

  void show(boolean DEBUG){
//    if (DEBUG) println(L2_norm(velocity));
    if (L2_norm(velocity) > Vlim){
      // println(velocity,":",L2_norm(velocity),"is over than",Vlim);
      velocity = reduce(velocity, Vlim);
    }
    fill(hue, hue, 255);
    translate(location.x, location.y, location.z);
    sphere(15);
    translate(-location.x, -location.y, -location.z);
  }
}
