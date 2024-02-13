float sp_bullet = 24;
class Bullet{
    float r; 
    PVector location; 
    Bullet (float x0, float y0){
        PVector loc = new PVector(x0, y0, 0); 
        location = loc; 
        r = 10;
    }

    void show(){
        fill(0);
        translate(location.x, -location.y, location.z);
        sphere(r);
        translate(-location.x, location.y,-location.z);
    }
    
    void update(){
        location.y += sp_bullet; 
    }
}
