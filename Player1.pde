class Player1{
  float x, y;
  float w = 100;
  float h = 134;
  float speed = 4;
  float a = 0.1;
  final float GROUND = bg1H-h;
  void move(){
   if(leftState){
    x-=speed;
    if(x<=0)x=0;
   }
   if(rightState){
    x+=speed;
    if(x>=width-w) x=width-w;
   }
   if (y <= GROUND){
      upSpeed += a;
      y+=upSpeed;

   }else{
     a = 0;
     upSpeed = 0;
     gameState = GAME1_LOSE;
     playerHealth--;
   }
  }
  void display(){
     pushMatrix();
     translate(x, y);

     scale(1, 1);

      if(leftState){
        nowface = lefthow;
      }
      if(rightState){
        nowface = righthow;
      }
      ImageFace(nowface);
    popMatrix();
  }
  void jump(){
    upSpeed = -5;
  }

  void checkHit(Cloud clouds){
    // check the foot only
    //rect (x+47,y+117,30,16); // foot area
    //println(offsetY, y+100, clouds.y);
    if(isHit(x+47,y+117,30,16,clouds.x,clouds.y,clouds.w,clouds.h)){ 
      jump();
    }
  }
  
  Player1(){
     x= 420;
     y= 1000;
  }
void ImageSetup(){

}  
void ImageFace(PImage name){
  image(name,0 , 0,w,h);
}
}
