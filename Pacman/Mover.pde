class Mover{
    float sp = 0.05;
    float x, y;
    int d = 0;
    int delay;
    Mover(int i, int j){
        y = i;
        x = j;
        d = int(random(4));
        // delay = int(random(256));
        delay = 0;
    }
    int regard(float n, float eps){
        if ((n % 1) <= eps) return int(n);
        else return -1; 
    }
    void update(int flame){
        if (regard(x, 0.07) != -1 && regard(y, 0.07) != -1){
            if (int(random(3)) < 1){
                d = int(random(4));
            }
            x = regard(x, 0.1);
            y = regard(y, 0.1);
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
    void show(int flame){
        fill(delay,delay,255);
        ellipse(x * w + w/2.0 + 2, y * w + w/2.0 + 2, w - 4, w - 4);
    }
}