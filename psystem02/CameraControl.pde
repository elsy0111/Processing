boolean w,a,s,d,e,c,up,down,left,right;

void keyPressed(){
  if (key == 'w')		    w     = true;
  if (key == 'a')		    a     = true;
  if (key == 's')		    s     = true;
  if (key == 'd')		    d     = true;
  if (key == 'e')		    e     = true;
  if (key == 'c')		    c     = true;
  if (keyCode == UP)    up    = true;
  if (keyCode == DOWN)  down  = true;
  if (keyCode == LEFT)  left  = true;
  if (keyCode == RIGHT) right = true;


  if (key == 'h')		    h     = true;
  if (key == 'j')		    j     = true;
  if (key == 'k')		    k     = true;
  if (key == 'l')		    l     = true;

  if (key = ' ')            shoot = true; 
}

void keyReleased(){
  if (key == 'w')		    w     = false;
  if (key == 'a')		    a     = false;
  if (key == 's')		    s     = false;
  if (key == 'd')		    d     = false;
  if (key == 'e')		    e     = false;
  if (key == 'c')		    c     = false;
  if (keyCode == UP)    up    = false;
  if (keyCode == DOWN)  down  = false;
  if (keyCode == LEFT)  left  = false;
  if (keyCode == RIGHT) right = false;


  if (key == 'h')		    h     = false;
  if (key == 'j')		    j     = false;
  if (key == 'k')		    k     = false;
  if (key == 'l')		    l     = false;

  if (key = ' ')            shoot = false; 
}

// --------------------------------------------------------------
// ここからカメラ操作用のクラス（別なpdeファイルに分けると良いです）
public class CameraControl {
  final float MOVE_SPEED = 8; // 移動スピード
  final float ROTATION_SPEED = 0.02; // 首振りのスピード
  
  PApplet parent;

  CameraControl(PApplet parent) {
    this.parent = parent;
    try {
      parent.registerMethod("dispose", this);
      parent.registerMethod("pre", this);
    } 
    catch (Exception e) {
    }
  }

  public void dispose() {
    parent.unregisterMethod("dispose", this);
    parent.unregisterMethod("pre", this);
  }

  public void pre() {
    // もしキーイベントの自動実行がお気に召さない場合は、ここをコメントアウトしてkeyControl()メソッドを直接メインプログラムから呼んでください。
    keyControl();
  }

  public void keyControl() {


//    println(w,a,s,d,e,c,up,down,left,right);
    // ビュー行列（camera）を入力に応じて修正するための行列
    PMatrix3D M = new PMatrix3D();

    if ( w ) {
      M.translate( 0, 0, MOVE_SPEED );
    } 
    if ( s ) {
      M.translate( 0, 0, -MOVE_SPEED );
    } 
    if ( a ) {
      M.translate( MOVE_SPEED, 0, 0 );
    } 
    if ( d ) { 
      M.translate( -MOVE_SPEED, 0, 0 );
    } 
    if ( e ) { 
      M.translate( 0, MOVE_SPEED, 0 );
    } 
    if ( c ) { 
      M.translate( 0, -MOVE_SPEED, 0 );
    } 
    if ( up ) {     
      M.rotateX(ROTATION_SPEED);
    } 
    if ( down ) {  
      M.rotateX(-ROTATION_SPEED);
    } 
    if ( right ) { 
      M.rotateY(ROTATION_SPEED);
    }
    if ( left ) {  
      M.rotateY(-ROTATION_SPEED);
    }

    // ビュー行列の修正
    PMatrix3D C = ((PGraphicsOpenGL)(this.parent.g)).camera.get(); // コピー
    C.preApply(M);

    // 上を向くように修正
    C.invert();
    float ex = C.m03;
    float ey = C.m13;
    float ez = C.m23;
    float cx = -C.m02 + ex;
    float cy = -C.m12 + ey;
    float cz = -C.m22 + ez;
    parent.camera( ex, ey, ez, cx, cy, cz, 0, 1, 0 );
  }
}
