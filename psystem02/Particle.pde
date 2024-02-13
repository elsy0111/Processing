class Particle{
  PVector location;
  float hue;
  float R;

  Particle (PVector loc, float R0){ 
    location = loc;
    hue = random(200,255);
    R = R0;
  }

  void update(int flame){
//    println("acceleration :", acceleration);
//    println("location :", location);
    location.y -= 5 * noise(L2_norm(location) * 0.0001);
    location.x += 8 * noise(L2_norm(location) * 0.0001) - 4;
    if (location.y < -500) hue = -1; 
//    hue-=1;
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
    sphere(R);
    translate(-location.x, location.y, -location.z);
    }
  }
}
