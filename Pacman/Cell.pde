class Cell{
    int[][] Cell_cnt = new int[GRID][GRID];
    boolean[][] exist = new boolean[GRID][GRID];

    Cell(){
        for (int i = 0; i < GRID; ++i){
            for (int j = 0; j < GRID; ++j){
                exist[i][j] = false;
                Cell_cnt[i][j] = 0;
            }
        }
    }

    void update(boolean in, int i, int j){
        if (in) exist[i][j] = true;
        else exist[i][j] = false;
    }
}