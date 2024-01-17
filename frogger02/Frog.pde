float H_ = 30;
float H_e = H_ + 1;
float X,Y,H,W;
float H_w = 40;
float Wall_H = H_w * 7;
class Frog{
  Rectangle re;
  Rectangle re_;
  Rectangle[] OTHER = {};
  
  Frog(float x, float y, float w, float h){
    re = new Rectangle(x, y, w, h);
  }
  
  void Other_rect(float x, float y, float w, float h){
    re_ = new Rectangle(x, y, w, h);
    OTHER = (Rectangle[])append(OTHER,re_);
  }
  
  void wall(){
    fill(2);
    beginShape(TRIANGLE_STRIP);
    vertex(      0,        0,        0);
    vertex(      0,     Size,        0);
    vertex(      0,        0,   Wall_H);
    vertex(      0,     Size,   Wall_H);
    endShape();
    beginShape(TRIANGLE_STRIP);
    vertex(   Size,        0,        0);
    vertex(   Size,     Size,        0);
    vertex(   Size,        0,   Wall_H);
    vertex(   Size,     Size,   Wall_H);
    endShape();
    beginShape(TRIANGLE_STRIP);
    vertex(      0,        0,        0);
    vertex(   Size,        0,        0);
    vertex(      0,        0,   Wall_H);
    vertex(   Size,        0,   Wall_H);
    endShape();
  }
  
  void show(int d){
    wall();
    fill(255);
    stroke(200);
    boolean red = false;
    for (int i = 0; i < OTHER.length; ++i){
      OTHER[i].x += 4;
      if (OTHER[i].x > Size){
        OTHER[i].x = -OTHER[i].w;
      }
    }
    for (int i = 0; i < OTHER.length; ++i){
      fill(i * 110 % 256, i * 150 % 256, i * 300 % 256);
      beginShape(TRIANGLE_STRIP);
      vertex(OTHER[i].x             , OTHER[i].y             , 0);
      vertex(OTHER[i].x + OTHER[i].w, OTHER[i].y             , 0);
      vertex(OTHER[i].x             , OTHER[i].y + OTHER[i].h, 0);
      vertex(OTHER[i].x + OTHER[i].w, OTHER[i].y + OTHER[i].h, 0);
      endShape();
      beginShape(TRIANGLE_STRIP);
      vertex(OTHER[i].x             , OTHER[i].y             , H_w);
      vertex(OTHER[i].x + OTHER[i].w, OTHER[i].y             , H_w);
      vertex(OTHER[i].x             , OTHER[i].y + OTHER[i].h, H_w);
      vertex(OTHER[i].x + OTHER[i].w, OTHER[i].y + OTHER[i].h, H_w);
      endShape();
      beginShape(TRIANGLE_STRIP);
      vertex(OTHER[i].x             , OTHER[i].y             , 0  );
      vertex(OTHER[i].x + OTHER[i].w, OTHER[i].y             , 0  );
      vertex(OTHER[i].x             , OTHER[i].y             , H_w);
      vertex(OTHER[i].x + OTHER[i].w, OTHER[i].y             , H_w);
      endShape();
      beginShape(TRIANGLE_STRIP);
      vertex(OTHER[i].x             , OTHER[i].y + OTHER[i].h, 0  );
      vertex(OTHER[i].x + OTHER[i].w, OTHER[i].y + OTHER[i].h, 0  );
      vertex(OTHER[i].x             , OTHER[i].y + OTHER[i].h, H_w);
      vertex(OTHER[i].x + OTHER[i].w, OTHER[i].y + OTHER[i].h, H_w);
      endShape();
      beginShape(TRIANGLE_STRIP);
      vertex(OTHER[i].x             , OTHER[i].y             , 0  );
      vertex(OTHER[i].x             , OTHER[i].y + OTHER[i].h, 0  );
      vertex(OTHER[i].x             , OTHER[i].y             , H_w);
      vertex(OTHER[i].x             , OTHER[i].y + OTHER[i].h, H_w);
      endShape();
      beginShape(TRIANGLE_STRIP);
      vertex(OTHER[i].x + OTHER[i].w, OTHER[i].y             , 0  );
      vertex(OTHER[i].x + OTHER[i].w, OTHER[i].y + OTHER[i].h, 0  );
      vertex(OTHER[i].x + OTHER[i].w, OTHER[i].y             , H_w);
      vertex(OTHER[i].x + OTHER[i].w, OTHER[i].y + OTHER[i].h, H_w);
      endShape();
      if (re.intersects(OTHER[i])){
        red = true;
      }
    }
    fill(255);
    if (red){
      fill(255,0,0);
    }
    
    beginShape(TRIANGLE_STRIP);
    vertex(re.x       , re.y       , 0 );
    vertex(re.x + re.w, re.y       , 0 );
    vertex(re.x       , re.y + re.h, 0 );
    vertex(re.x + re.w, re.y + re.h, 0 );
    endShape();
    beginShape(TRIANGLE_STRIP);
    vertex(re.x       , re.y       , H_);
    vertex(re.x + re.w, re.y       , H_);
    vertex(re.x       , re.y + re.h, H_);
    vertex(re.x + re.w, re.y + re.h, H_);
    endShape();
    beginShape(TRIANGLE_STRIP);
    vertex(re.x       , re.y       , 0 );
    vertex(re.x + re.w, re.y       , 0 );
    vertex(re.x       , re.y       , H_);
    vertex(re.x + re.w, re.y       , H_);
    endShape();
    beginShape(TRIANGLE_STRIP);
    vertex(re.x       , re.y + re.h, 0 );
    vertex(re.x + re.w, re.y + re.h, 0 );
    vertex(re.x       , re.y + re.h, H_);
    vertex(re.x + re.w, re.y + re.h, H_);
    endShape();
    beginShape(TRIANGLE_STRIP);
    vertex(re.x       , re.y       , 0 );
    vertex(re.x       , re.y + re.h, 0 );
    vertex(re.x       , re.y       , H_);
    vertex(re.x       , re.y + re.h, H_);
    endShape();
    beginShape(TRIANGLE_STRIP);
    vertex(re.x + re.w, re.y       , 0 );
    vertex(re.x + re.w, re.y + re.h, 0 );
    vertex(re.x + re.w, re.y       , H_);
    vertex(re.x + re.w, re.y + re.h, H_);
    endShape();
    
    fill(0);
    stroke(0);
    if (d == 0){
      X = re.x + re.w/4;
      Y = re.y;
      W = re.w/2;
      H = re.h/4;
    }
    if (d == 1){
      X = re.x + re.w * 3/4;
      Y = re.y + re.w/4;
      W = re.w/4;
      H = re.h/2;
    }
    if (d == 2){
      X = re.x + re.w/4;
      Y = re.y + re.w * 3/4;
      W = re.w/2;
      H = re.h/4;
    }
    if (d == 3){
      X = re.x;
      Y = re.y + re.w/4;
      W = re.w/4;
      H = re.h/2;
    }
    beginShape(TRIANGLE_STRIP);
    vertex(X    , Y    , H_e);
    vertex(X + W, Y    , H_e);
    vertex(X    , Y + H, H_e);
    vertex(X + W, Y + H, H_e);
    endShape();
  }
  
  void move(float xdir,float ydir){
    if (!(0 > re.x + xdir * grid || re.x + re.w + xdir * grid > Size)){
      re.x += xdir * grid;
    }
    if (!(0 > re.y + ydir * grid || re.y + re.h + ydir * grid > Size)){
      re.y += ydir * grid;
    }
  }
}
