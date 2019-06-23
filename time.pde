class Time {
  int Frames;
  int timeX2;
  
  Time (float initSeconds) {
    Frames = floor(initSeconds * 60);
    timeX2 = Frames;
  }

  
  void update () {
    if(Frames > 0){ 
      Frames --;
      startFrameCount --;
      if (noSleep == true){
        sleepFrameCount++;
      }
      if (turn1 == true){
       turn1FrameCount++;
      }
      if (change == true || change == false){
        changeFrameCount++;
        noticeFrameCount++;
      }
      
    }    
  }
    
  void displayUI(){
  float timeX = map(Frames, 0,timeX2,0,350);
  fill(255);
  rectMode(CORNER);
  rect(10,10,350,10);
   int timeColor;
  if(Frames > 300){
    timeColor = #ffcc00;
  }else{
    timeColor = #ff6600;
  }
  fill(timeColor);
  rectMode(CORNER);
  rect(12,12,timeX,6);
  
    textSize(36);
    textAlign(LEFT, TOP);
    String timeString = nf(floor(Frames/60), 2);
    fill(0, 120);
    text(timeString, 10,15);
    fill((Frames > 300) ? #ffcc00 : #ff6600);
    text(timeString, 8, 15);

  }
  
  boolean isTimeUp () { return Frames == 0; }
}
