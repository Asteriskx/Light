public class Lights {
    private int    base;   // 1辺の大きさ
    private float  center; // 中心座標
    private float  distance; // 距離
    private PImage img;    // 光の球
    
    private Lights() {
        base      = 200;
        center    = base / 2.0;
        img       = createImage(base, base, RGB); // 画像を生成
    }
    
    //////////////////////////////////////
    // OnCreateLights
    //////////////////////////////////////
    private PImage OnCreateLights( float rPow, float gPow, float bPow ) {
        // 画像の一つ一つのピクセルの色を設定する
        for( int y = 0; y < base; y++ ){
            for( int x = 0; x < base; x++ ){
                distance = ( sq( center - x ) + sq( center - y ) ) / 50.0;
                int r    = int( ( 255 * rPow ) / distance );
                int g    = int( ( 255 * gPow ) / distance );
                int b    = int( ( 255 * bPow ) / distance );
                img.pixels[x + y * base] = color( r, g, b );
            }
        }
        return img;
    }
    
}