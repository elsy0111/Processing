class Walker{
    float sp = 0.1;
    float x, y;
    int d = 0;
    int delay;
    Walker(int i, int j){
        y = i;
        x = j;
        delay = int(random(256));
    }
    void update(int flame){
        if (x % 1 == 0 && y % 1 == 0){
            d = int(random(4));
            println(x,y);
        }
        if (d == 0){
            x+=sp;
        }
        if (d == 1){
            x-=sp;
        }
        if (d == 2){
            y+=sp;
        }
        if (d == 3){
            y-=sp;
        }
        x = (x + GRID) % GRID;
        y = (y + GRID) % GRID;
    }
    void show(){
        fill(delay,delay,255);
        ellipse(x * w + w/2.0, y * w + w/2.0, w, w);
    }
}