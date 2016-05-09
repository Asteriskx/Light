///////////////////////////////
// mousePressed
///////////////////////////////
void mousePressed() {
    switch( mousePressed ){
    case LEFT:
        img = light.OnCreateLights( random(0.5, 0.8), random(0.5, 0.8), random(0.5, 0.8) );
        break;
    
    case RIGHT:
        save( "Lights.png" );
        break;
        
    case CENTER:
        //None;
        break;
        
    default:
        break;
    }
    
}