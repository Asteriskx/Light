Lights light;

PImage img; // 光球

float velocity = 0;
float accele   = 0.05; 

public static final int   RADIUS = 250;  //全体の球の直径
public static final float RATE   = 0.01; //回転量

color bg = color( 0, 15, 30 );  

void setup() {
  size( 1000, 800, P3D );
  hint( DISABLE_DEPTH_TEST ); // Z軸の無効化
  
  blendMode( ADD ); // 加算合成
  imageMode( CENTER ); // 画像の初期位置
  
  light = new Lights(); //インスタンス生成
  // 画像の生成
  img   = light.OnCreateLights( random(0.5, 0.8), random(0.5, 0.8), random(0.5, 0.8) );
}

void draw() {
  background( bg );

  translate( width / 2, height / 2 ); // 中心に移動
  rotateX( frameCount * RATE );       // X軸回転
  rotateY( frameCount * RATE );       // Y軸回転

  float lastX = 0, lastY = 0, lastZ = 0;

  for( float s = 0, t = 0; s <= 180; s++, t += velocity ) {
    float radianS = radians(s);
    float radianT = radians(t);
    
    float x = RADIUS * sin(radianS) * cos(radianT);
    float y = RADIUS * sin(radianS) * sin(radianT);
    float z = RADIUS * cos(radianS);

    stroke( 0x80 );
    if( lastX != 0 ) {
      strokeWeight( 1 );
      line( x, y, z, lastX, lastY, lastZ );
    }

    pushMatrix();
    // 画像の座標へ原点を移動
    translate( x, y, z );
    // 画像の向きを元に戻す
    rotateY( -frameCount * 0.01 );
    rotateX( -frameCount * 0.01 );
    // 画像を描画
    image( img, 0, 0 );
    popMatrix();

    lastX = x;
    lastY = y;
    lastZ = z;
  }
  velocity += accele;
}