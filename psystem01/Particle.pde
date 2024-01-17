String [] p = new String[]{"x","y","z"};
class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration = new PVector();
  float hue;
  float sc;

  int R = 2;
  Particle (PVector loc){ 
    velocity = new PVector(random(-R,R),
                           random(-R,R),
                           random(-R,R));
    velocity.mult(1);
    location = loc;
    hue = random(255);
  }

  void update(int flame){
//    println("acceleration :", acceleration);
//    println("location :", location);
    if (flame > hue){ 
      acceleration.set(location);
      location.add(velocity);
      acceleration.mult(-0.001);
      velocity.add(acceleration);
    }
    sc = (max(0, 255 - abs(location.x)) + max(0, 255 - abs(location.y)) + max(0, 255 - abs(location.z)))/3;
  }

  float L2_norm(PVector A){
    float norm = 0;
    //for (double ai : A){
    //  norm += pow(abs(ai),2);
    //}
    //pow(abs(A.x),2) + pow(abs(A.y),2) + pow(abs(A.z),2)
    norm = sqrt(A.dot(A));
    return norm;
  }

  void show(boolean DEBUG){
    if (DEBUG) println(L2_norm(velocity));
    fill(hue, sc, 255);
    translate(location.x, location.y, location.z);
    sphere(20);
    translate(-location.x, -location.y, -location.z);
  }
}
