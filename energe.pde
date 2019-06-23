class Energe {
  int energelevel;
  int rectY = 32 ;
  
  Energe (float initSeconds) {
    energelevel = floor(initSeconds * 60);
  }
  
  void update () {
 
  }
    
  void displayUI(){
 
  fill(255);
  rectMode(CORNER);
  rect(620,30,10,300);
   int energeColor;
  if(rectY > 250){
    energeColor = #ff6600;
  }else{
    energeColor = #ffcc00 ;
  }
  fill(energeColor);
  rectMode(CORNERS);
  rect(622,rectY,628,328);


    textSize(15);
    textAlign(LEFT, TOP);
    text("Energy", 585, 10);

  }
  
  void move(){
    rectY += 50;
    if (rectY >= 335){
      gameState =GAME2_LOSE;
    }
  }
  
  void plus(){
    rectY --;
    if (rectY<=32){
      rectY =32;
    }
  }
  
  //boolean isTimeUp () { return energelevel == 0; }
}
