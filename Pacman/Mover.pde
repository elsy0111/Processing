int id = 0;
class Mover{
    float sp = 0.045;
    float x, y;
    int d = 0;
    String dir;
    int delay;
    boolean c = false;
    Pos pos;
    int ID;

    Mover(int i, int j){
        y = i;
        x = j;
        d = int(random(4));
        pos = new Pos(i, j);
        id += 1;
        ID = id;
        delay = (ID + 1) * int(255.0/N + 1);
    }

    int regard(float n, float eps){
        if (n - int(n) >= 0 && n - int(n) <= eps) return int(n);
        else if (int(n + 1.0) - n <= eps) return int(n + 1);
        else return -1; 
    }

    void reg_pos (float I, float J){
        pos.i1 = int(I + 1/2.0);
        pos.j1 = int(J + 1/2.0);
        pos.i2 = pos.i1;
        pos.j2 = pos.j1;
        if (d == 0 && pos.i1 < I) pos.i2 = pos.i1 + 1; 
        if (d == 1 && pos.j1 < J) pos.j2 = pos.j1 + 1; 
        if (d == 2 && pos.i1 > I) pos.i2 = pos.i1 - 1; 
        if (d == 3 && pos.j1 > J) pos.j2 = pos.j1 - 1; 
        pos.i1 = (pos.i1 + GRID) % GRID;
        pos.j1 = (pos.j1 + GRID) % GRID;
        pos.i2 = (pos.i2 + GRID) % GRID;
        pos.j2 = (pos.j2 + GRID) % GRID;
    }
    
    float EPS = sp - 0.015;
    void update(int flame){
        reg_pos(x, y);
        cell.Cell_cnt[pos.i1][pos.j1] = delay;
        cell.Cell_cnt[pos.i2][pos.j2] = delay;
        // cell.exist[i][j] = true;

        if (regard(x, EPS) != -1 && 
            regard(y, EPS) != -1){
            c = true;
            if (random(3) <= 1){
                d = int(random(4));
            }
            x = regard(x, EPS);
            y = regard(y, EPS);
        }else{
            c = false;
        }

        if (d == 0) x+=sp;
        if (d == 1) y+=sp;
        if (d == 2) x-=sp;
        if (d == 3) y-=sp;

        x = (x + GRID) % GRID;
        y = (y + GRID) % GRID;
    }
    void show(int flame){
        strokeWeight(1);
        fill(delay,delay,255);
        // if (c) fill(delay,delay,255);
        // else fill(delay,255,255);
        ellipse(x * w + w/2.0, y * w + w/2.0, w - 4, w - 4);
        textSize(45);
        if (d == 0) dir = "→";
        if (d == 1) dir = "↓";
        if (d == 2) dir = "←";
        if (d == 3) dir = "↑";
        fill(230);
        ellipse(pos.i1 * w + w/2.0, pos.j1 * w + w/2.0, w/4, w/4);
        ellipse(pos.i2 * w + w/2.0, pos.j2 * w + w/2.0, w/4, w/4);
        strokeWeight(3);
        if (abs(pos.i1 - pos.i2) <= 1 && abs(pos.j1 - pos.j2) <= 1){
            line(pos.i1 * w + w/2.0, pos.j1 * w + w/2.0,
                 pos.i2 * w + w/2.0, pos.j2 * w + w/2.0);
        }else{
            if (abs(pos.i1 - pos.i2) != 1){
                if (pos.i1 < pos.i2){
                    // (i1, j1 = j2) -> (0, j1 = j2)
                    line(pos.i1 * w + w/2.0, pos.j1 * w + w/2.0,
                         0,              pos.j1 * w + w/2.0);
                    // (i2, j1 = j2) -> (G, j1 = j2)
                    line(pos.i2 * w + w/2.0,  pos.j1 * w + w/2.0,
                         GRID * w + w/2.0,pos.j1 * w + w/2.0);
                }
                if (pos.i1 > pos.i2){
                    // (i2, j1 = j2) -> (0, j1 = j2)
                    line(pos.i2 * w + w/2.0, pos.j1 * w + w/2.0,
                         0,              pos.j1 * w + w/2.0);
                    // (i1, j1 = j2) -> (G, j1 = j2)
                    line(pos.i1 * w + w/2.0,  pos.j1 * w + w/2.0,
                         GRID * w + w/2.0,pos.j1 * w + w/2.0);
                }
            }
            if (abs(pos.j1 - pos.j2) != 1){
                if (pos.j1 < pos.j2){
                    // (i1 = i2, j2) -> (i1 = i2, G)
                    line(pos.i1 * w + w/2.0,   GRID * w + w/2.0,
                         pos.i1 * w + w/2.0, pos.j2 * w + w/2.0);
                    // (i1 = i2,  0) -> (i1 = i2, j1)
                    line(pos.i1 * w + w/2.0, pos.j1 * w + w/2.0,
                         pos.i1 * w + w/2.0, 0                 );
                }
                if (pos.j1 > pos.j2){
                    // (i1 = i2,  G) -> (i1 = i2, j1)
                    line(pos.i1 * w + w/2.0,   GRID * w + w/2.0,
                         pos.i1 * w + w/2.0, pos.j1 * w + w/2.0);
                    // (i1 = i2, j2) -> (i1 = i2, 0)
                    line(pos.i1 * w + w/2.0, 0,
                         pos.i1 * w + w/2.0, pos.j2 * w + w/2.0);
                }
            }
        }
        fill(0);
        text(dir, x * w + w/3.0, y * w + w/1.5);
    }
}