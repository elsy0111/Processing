int N = 10;
int GRID = 10;
int w = 80;
Cell cell;
ArrayList<Mover> movers; 

void setup(){
    size(800,800);
    colorMode(HSB);
    cell = new Cell();
    movers = new ArrayList<Mover>(); 
    for (int i = 0; i < N; ++i){
        Mover mover = new Mover(int(random(GRID)), int(random(GRID)));
        movers.add(mover);
    }
}

int flame = 0;
void draw(){
    background(255);
    ShowGrid(GRID, w);
    // Alice.show();
    // Alice.update(flame);
    for (Mover mover : movers){
        mover.show(flame);
        mover.update(flame);
    }
    ++flame;
}

void ShowGrid(int GRID, int w){
    stroke(0);
    strokeWeight(1);
    for (int i = 0; i < GRID; ++i){
        for (int j = 0; j < GRID; ++j){
            fill(cell.Cell_cnt[i][j],cell.Cell_cnt[i][j],255);
            rect(i * w + 2, j * w + 2, w - 4, w - 4);
        }
    }
}