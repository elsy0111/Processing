class Rectangle{
  float x,y,w,h;
  
  Rectangle(float x0, float y0, float w0, float h0){
    x = x0;
    y = y0;
    w = w0;
    h = h0;
  }
  
  boolean intersects(Rectangle other){
    float left = x;
    float right = x + w;
    float top = y;
    float bottom = y + h;
    
    float left_ = other.x;
    float right_ = other.x + other.w;
    float top_ = other.y;
    float bottom_ = other.y + other.h;
    
    return (((left_ <= left && left <= right_) || (left_ <= right && right <= right_)) &&
            ((bottom_ >= bottom && bottom >= top_) || (bottom_ >= top && top >= top_)));
  }
}
