class Cloud {
  float x, y, w, h;
  
  Cloud(float x,float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    }
    
  void display(){

  }
  void move(){
   x++;
   if( x > width ){ x=-w;}
  }
}
