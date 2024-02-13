float sp = 8; 
class Ship{
    PVector location; 
    Ship (float x0, float y0){
        PVector loc = new PVector(x0, y0, 0); 
        location = loc; 
    }

    void show(){
        translate(location.x, -location.y, location.z);
        box(25); 
        translate(-location.x, location.y,-location.z);
    }
    
    void move(boolean h, boolean j, boolean k, boolean l){
        location.x += int(l) * sp; 
        location.x -= int(h) * sp; 
        location.y -= int(j) * sp; 
        location.y += int(k) * sp; 
    }
}
