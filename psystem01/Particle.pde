class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration = new PVector();
  float hue;
  float life = 255;

  int R = 3;
  Particle (PVector loc){ 
    velocity = new PVector(random(-R,R),
                           random(-R,R),
                           random(-R,R));
    velocity.mult(1);
    location = loc;
    hue = random(255);
  }

  void update(){
//    println("acceleration :", acceleration);
//    println("location :", location);
    acceleration.set(location);
    acceleration.mult(-0.001);
    velocity.add(acceleration);
    location.add(velocity);
    life = (max(0, 255 - abs(location.x)) + max(0, 255 - abs(location.y)) + max(0, 255 - abs(location.z)))/3;
  }

  boolean isDead(){
    if (life <= 0) return true;
    else return false;
  }

  void show(){
    fill(hue, life, 255);
    translate(location.x, location.y, location.z);
    sphere(20);
  }
}
