final int GAME1_START = 0;
final int GAME1_RUN = 1;
final int GAME1_WIN = 2;
final int GAME1_LOSE = 12;
final int GAME2_START = 3;
final int GAME2_RUN = 4;
final int GAME2_WIN = 5;
final int GAME2_LOSE = 13;
final int GAME3_START = 6;
final int GAME3_RUN = 7;
final int GAME3_WIN = 8;
final int GAME3_LOSE = 14;
final int GAME4_START = 9;
final int GAME4_RUN = 10;
final int GAME4_WIN = 11;
final int GAME4_LOSE = 15;
final int GAME_WIN = 16;
final int GAME_LOSE = 17;
final int GAME_START = 30;
PImage scence1, loseScence, winScence,start, start2, restart, restart2,specification,specification2,specification3,specification4;

import ddf.minim.*;
Minim minim;
AudioPlayer song ;

int playerHealth;
int gameState; 
int mouseState;
//1 picture
PImage bg1,cloud1,cloud2,cloud3,school,person2,nowface;
Movie movie1_1;
Movie movie1_2;
Movie movie1_3;
//1 code
float bg1X,bg1Y,bg1W,bg1H;
float upSpeed = 4;
boolean playerHitCloud = false;

int spacing,allCloud;
float offsetY;
Cloud[]clouds;
Player1 player;
//2 picture
PImage bg2,chair,classmate1,classmate2,smallhow1,smallhow2,teacher0,teacher1,lefthow,righthow;
PImage lose,win,restart1,start1;
import processing.video.*;
Movie movie2_1;
Movie movie2_2;
Movie movie2_3;

Time1 time1[],lifetime,lifetime2,lifetime3,lifetime4;
Time time;

//2 code
Energe energe;
int changeFrameCount = 0;
int noticeFrameCount = 0;
int sleepState = 0;

int smallhowX1=460,smallhowY1=225;
int smallhowX2=460,smallhowY2=225;
int sleepFrameCount = 0;
int turn1FrameCount = 0;
int startFrameCount = 18*60;

int teacherX=30,teacherY=105;

boolean noSleep = false;
boolean turn1 = false;
boolean change = false;

//3 picture
PImage bg3, howeat, howeat2,nowhoweat;
PImage mateblue, mategreen, mateorange,  matered, teacherblue, banana, fish,life; 
import processing.video.*;
Movie movie3_1;
Movie movie3_2;
Movie movie3_3;
//3 code
int x,y,x2,x3,x4,x5;
float playerX, playerY;
boolean leftState = false;
boolean rightState = false;
boolean downState = false;
boolean upState = false;
int w , q, m, e;
int []bananaX = new int [5];
int []bananaY = new int [5];
int []fishX = new int [5];
int []fishY =new int [5];


//4 picture
import processing.video.*;
Movie movie4_1;
Movie movie4_2;
Movie movie4_3;
//4 code
PImage bg4,sketch1,sketch2,sketch3,sketch4;
float timer;
float pencilX, pencilY;
color c =color(0,126,255);
color d =color(0,200,255);

  void setup(){
  size(640, 480, P2D);
    minim = new Minim(this);
   song = minim.loadFile("song1.wav");
   song.loop();
  
  time1 = new Time1[4];
  lifetime = new Time1(3);
  lifetime2 = new Time1(3);
  lifetime3= new Time1(3);
  lifetime4 = new Time1(3);
  life = loadImage("img/life.png");
  playerHealth = 3;

  specification = loadImage("img/specification.png");
  specification2 = loadImage("img/specification2.png");
  specification3 = loadImage("img/specification3.png");
  specification4 = loadImage("img/specification4.png");
  scence1 = loadImage("img/scence1.jpg");
  loseScence = loadImage("img/loseScence.jpg");
  winScence = loadImage("img/winScence.jpg");
  start = loadImage("img/start.png");
  start2 = loadImage("img/start2.png");
  restart = loadImage("img/restart.png");
  restart2 = loadImage("img/restart2.png");
      
  //1
  bg1 = loadImage("img/bg1.png");
  cloud1 = loadImage("img/cloud1.png");
  cloud2 = loadImage("img/cloud2.png");
  cloud3 = loadImage("img/cloud3.png");
  school = loadImage("img/door.png");
  person2 = loadImage("img/person2.png");
  lefthow = loadImage("img/person2.png");
  righthow = loadImage("img/person3.png");
  movie1_1 = new Movie(this, "1_start.mp4");
  movie1_2 = new Movie(this, "1_win.mp4");
  movie1_3 = new Movie(this, "1_lose.mp4");  
  time1[0] = new Time1(20);
  initGame();
  nowface = lefthow;
  
  //2
  bg2=loadImage("img/bg2.jpg");
  chair=loadImage("img/chair.png");
  classmate1=loadImage("img/classmate1.png");
  classmate2=loadImage("img/classmate2.png");
  smallhow1=loadImage("img/smallhow1.png");
  smallhow2=loadImage("img/smallhow2.png");
  teacher0=loadImage("img/teacher0.png");
  teacher1=loadImage("img/teacher1.png");

  movie2_1 = new Movie(this, "2_start.mp4");
  movie2_2 = new Movie(this, "2_win.mp4");
  movie2_3 = new Movie(this, "2_lose.mp4");

  
  //2

  energe = new Energe(15);
    time = new Time(20);
        
        
  //3
 bg3 = loadImage("img/bg3-2.jpg");
 howeat = loadImage("img/howeat1.png");
 mateblue = loadImage("img/mateblue.png");
 mategreen = loadImage("img/mategreen.png");
 mateorange = loadImage("img/mateorange.png");
 matered = loadImage("img/matered.png");
 teacherblue = loadImage("img/teacherblue.png");
 howeat2 = loadImage("img/howeat2.png");
 banana = loadImage("img/banana.png");
 fish = loadImage("img/fish.png");
 
 movie3_1 = new Movie(this,"3_start.mp4");
 movie3_2 = new Movie(this,"3_lose.mp4");
 movie3_3 = new Movie(this,"3_win.mp4");
 
time1[2] = new Time1(20);
 nowhoweat = howeat;
 x=0;
 x2=0;
 
 for( int p =0;p<5;p++){
  bananaX[p] = floor (random(600));
  bananaY[p] = floor (random(288));
}

for( int p =0;p<5;p++){
  fishX[p] = floor (random(600));
  fishY[p] = floor (random(288));
}
  
  //4
  
  sketch1 = loadImage("img/sketch1.jpg");
  sketch2 = loadImage("img/sketch2.jpg");
  sketch3 = loadImage("img/sketch3.jpg");
  sketch4 = loadImage("img/sketch4.jpg");
  movie4_1 = new Movie(this, "4_start.mp4");
  movie4_2 = new Movie(this, "4_win.mp4");
  movie4_3 = new Movie(this, "4_lose.mp4");
  time1[3] = new Time1(15);
  
  gameState = GAME_START; 

}

void movieEvent(Movie m) {
  m.read();
}

void initGame(){
  //bg
  bg1X = 0;
  bg1W = 640;
  bg1H = 1440;
  bg1Y = 0;
  offsetY = bg1H-height;
  
  // Initialize player
  player = new Player1();
  
  // Initialize clouds and their position
  spacing = 100;
  allCloud = (int)(bg1H-200-100)/spacing;
  clouds = new Cloud[allCloud];
  clouds[0] = new Cloud2(420,1200,150,50);
  for(int i = 0 ; i<clouds.length-1;i++){
    float newX = random(width)+i*i*2;
    float newY = 1200-(i+1)*spacing;
    
    clouds[i+1] = (random(2)>1)? new Cloud2(newX,newY,150,50): new Cloud3(newX,newY,200,40);
  }
  
  }

void draw(){

  println(gameState);
  switch(gameState){
    case GAME_START:
      image(scence1,0,0,640,480);
      image(start,115,322);
      if(mouseX<115+120 && mouseX>115 && mouseY<322+40&& mouseY>322){
        image(start2,115,322);
        if(mousePressed){
          gameState = 29;
        }
      }
      break;
    case 29:
        fill(#EAD084);
        rect(0,0,width,height);
              image(specification,0,0,width,height);
      life();
      lifetime4.update();

      if(lifetime4.isTimeUp())gameState = GAME1_START;
     break;
    case GAME1_START:
      movie1_1.play();
      image(movie1_1, 0, 0 ,640 ,480);
      float mt1 = movie1_1.time();
      if (mt1>=20){
               
      gameState = GAME1_RUN;
      }  
      break;
    case GAME1_RUN:
      offsetY+=upSpeed;
      if (offsetY>bg1H-height){
        offsetY = bg1H-height;
      }else if (offsetY < 0 ){
        offsetY = 0;
      }
  
      pushMatrix();
      //translate(0,max(0, bg1Y))
  
       translate(0,-offsetY);
  
       image(bg1, bg1X,bg1Y, bg1W,bg1H);         
      //clouds
      clouds[0].display();
      for(int i = 0; i < clouds.length-1; i++){
          clouds[i+1].move();
          clouds[i+1].display();
      }
      for(int i = 0; i < clouds.length; i++){
        player.checkHit(clouds[i]);
      }
      //player
      player.move();
      player.display();  
      
      //school
      image(school,width-300,bg1Y,300,160);
      //bound detect
      if(isHit(width-300+100,bg1Y,300,160,player.x+47,player.y+117,30,16)){
        gameState = GAME1_WIN;
        ;
      }
      
      popMatrix();
      time1[0].update();
      time1[0].displayUI();
      if(time1[0].isTimeUp()){
        gameState = GAME1_LOSE;
        playerHealth--;
      }
        break;
    case GAME1_WIN:
        movie1_2.play();
       image(movie1_2, 0, 0 ,640 ,480);
       
      float mt1_2 = movie1_2.time();
      if (mt1_2>=8.9){
               
      gameState = 18;
      }  
      break;
    case GAME1_LOSE:
    
        movie1_3.play();
       image(movie1_3, 0, 0 ,640 ,480);
       
      float mt1_3 = movie1_3.time();
      if (mt1_3>=22){
        
      gameState = 18;
      } 
      break;
    case 18:
        fill(#EAD084);
        rect(0,0,width,height);
        image(specification2,0,0,width,height);
      life();
      lifetime.update();
      
      if(lifetime.isTimeUp())gameState = GAME2_START;
      
    break;
    case GAME2_START: 
    movie2_1.play();
    image(movie2_1, 0, 0 ,640 ,480);
    float mt2 = movie2_1.time();
    if (mt2>=17){       
    gameState = GAME2_RUN;
    }  
    break;
    case GAME2_RUN: 
      image(bg2, 0, 0,640,480);
      image(classmate2,30,245,190,210);
      image(classmate1,235,245,190,210);
      image(chair,495,335,75,130);
      
        
       //sleep
         if (noSleep == true){
          image(smallhow1,smallhowX1,smallhowY1,165,220);
          image(chair,495,335,75,130);
          if(sleepFrameCount == 2*60){
            noSleep = !noSleep;
            sleepFrameCount = 0;
            
          }
        }else{
          image(smallhow2,smallhowX2,smallhowY2,165,220);
          image(chair,495,335,75,130);
          energe.plus();
        }
        
        if(changeFrameCount > random(60,180)){
           change = true;
        }
        if (change == true){
          image(teacher1,30,105,300,300);
          image(classmate2,30,245,190,210);
          if(changeFrameCount == 3*60){
            change = !change;
            changeFrameCount = 0;
            noticeFrameCount=0;
          }
        }else{
          image(teacher0,30,105,300,300);
          image(classmate2,30,245,190,210);
        }
      

      time.update();
      time.displayUI();
      if(time.isTimeUp()) gameState =GAME2_WIN;
      if(noSleep == false && change == true && noticeFrameCount >= 180){
        gameState =GAME2_LOSE;
        playerHealth--;
      }
      
      energe.update();
      energe.displayUI();  
      
      break; 
      
      case GAME2_WIN:
        movie2_2.play();
       image(movie2_2, 0, 0 ,640 ,480);
       
      float mt2_2 = movie2_2.time();
      if (mt2_2>=9){
               
      gameState = 19;
      }  
        break;
        
      case GAME2_LOSE: 
      movie2_3.play();
      image(movie2_3, 0, 0 ,640 ,480);
      float mt2_3 = movie2_3.time();
      if (mt2_3>=11){
               
      gameState = 19;
      } 

      break; 
    case 19:
        fill(#EAD084);
        rect(0,0,width,height);
        image(specification3,0,0,width,height);
      life();
      lifetime2.update();
      
      if(lifetime2.isTimeUp())gameState = GAME3_START;
      
    break;
      
      case GAME3_START:
      movie3_1.play();
       image(movie3_1, 0 , 0, width,height);
      
       float mt3_1 = movie3_1.time();      
       if(mt3_1>=17){
         gameState = GAME3_RUN;
       }
       break;
  
      case GAME3_RUN:
       image(bg3,0,0+w,640,1440);

         
           //banana,fish
           for(int p=0;p<5;p++){     
          image(banana,bananaX[p],60+p*240+bananaY[p]+w,50,50);
          if(bananaX[p]<240+playerX+100+m -40 && bananaX[p]+40>240+playerX+m+40 && 60+ p*240+bananaY[p]+w<20+playerY+e+80-20 && 30+60+p*240+bananaY[p]+w>playerY+e+20){
                gameState = GAME3_LOSE;
                playerHealth--;
              }
         }
          for(int p=0;p<5;p++){     
          image(fish,fishX[p],60+p*240+fishY[p]+w,50,50);
          if(fishX[p]<240+playerX+100+m -40 && fishX[p]+40>240+playerX+m+40 && 60+p*240+fishY[p]+w<20+playerY+e+80-20 && 30+60+p*240+fishY[p]+w>playerY+e+20){
                gameState = GAME3_LOSE;
                playerHealth--;
              }
         }
           
         
         //mateblue
         for(int i = 0 ; i < 3 ; i++ ){
           image(mateblue,640+x,120+410*i+w,120,90);
             if(640+x<240+playerX+100+m -40&& 640+x+120>240+playerX+m+40 && 120+410*i+w<20+playerY+e+80 -20&& 90+120+410*i+w>playerY+e+20){
                gameState = GAME3_LOSE;
                playerHealth--;
              }
         }
         x-=7;
        if(640+x<-120)x=640; 
        
         //mategreen
          for(int i = 0 ; i < 3 ; i++ ){
           image(mategreen,-120+x2,210+410*i+w,120,90);
            if(-120+x2<240+playerX+100+m -40&& -120+x2+90>240+playerX+m +40&& 210+410*i+w<20+playerY+e+80-20 && 90+210+410*i+w>playerY+e+20 ){
                gameState = GAME3_LOSE;
                playerHealth--;
              }
          }
         x2+=4;
         if(x2>760)x2=-120; 
         
         //mateorange
           for(int i = 0 ; i < 3 ; i++ ){
           image(mateorange,-120+x3,300+410*i+w,120,90);
            if(-120+x3<240+playerX+100+m -40 && -120+x3+90>240+playerX+m +40 && 300+410*i+w<20+playerY+e+80-20 && 90+300+410*i+w>playerY+e +20){
                gameState = GAME3_LOSE;
                playerHealth--;
         }
           }
         x3+=2.5;
          if(x3>760)x3=-120; 
         
         //matered
            for(int i = 0 ; i < 3 ; i++ ){
           image(matered,640+x4,390+410*i+w,120,90);
            if(640+x4<240+playerX+100+m -40 && 640+x4+120>240+playerX+m+40 && 390+410*i+w<20+playerY+e+80-20 && 90+390+410*i+w>playerY+e+20){
                gameState = GAME3_LOSE;
                playerHealth--;
              }
         }
         x4-=10;
         if(640+x4<-120)x4=640; 
         
         //teacherblue
          image(teacherblue,640+x5,1000+w,400,300);
          x5-=10;
          if(640+x5<-400)x5=640; 
             if(640+x5+140<240+playerX+100+m -40 && 640+x5+260>240+playerX+m+40 &&1000+w<20+playerY+e+80-20 && 1000+w+150>playerY+e+20){
                gameState = GAME3_LOSE;
                playerHealth--;
              }
        
         
         float howeatMove;
         howeatMove = 240+playerX+m;
         
        
          
          if(leftState){
           nowhoweat = howeat2;
            m-=12;
            if(m<-250)m=-250;
          
          }
         if(rightState){
           nowhoweat = howeat;
           m+=12;
           if(m>310)m=310;
         }
         if(downState){
           w-=12;
            if(w<-960){
              w=-960;
              e+=15;
            }
            if(e>380)e=380;
           }
           if(upState){
             w+=12;
             if(w>0)w=0;
           }
           //   if(640+x5+140<240+playerX+100+m -40 && 640+x5+260>240+playerX+m+40 &&1000+w<20+playerY+e+80-20 && 1000+w+150>playerY+e+20)
           //   640,1440
           ImageHow(nowhoweat);
             if(300<240+playerX+100+m -40 && 360>240+playerX+m+40 && 1380+w<20+playerY+e+80 && 1440+w>playerY+e){
               println(2);
                gameState = GAME3_WIN;
              }
            time1[2].update();
            time1[2].displayUI();
            if(time1[2].isTimeUp()){
              gameState = GAME3_LOSE;
             playerHealth--; 
            }
           
           break;
           
      case GAME3_WIN:
       movie3_3.play();
       image(movie3_3, 0 , 0, 640,480);
       e=0;
       float mt3_3 = movie3_3.time();
      if (mt3_3>=11.9){
       gameState = 20;
      } 
       break;
      
      case GAME3_LOSE:
        movie3_2.play();
        image(movie3_2, 0 , 0, 640,480);
        e=0;
        float mt3_2 = movie3_2.time();
      if (mt3_2>=11.9){
       gameState = 20;
      } 
        break;
        case 20:
        fill(#EAD084);
        rect(0,0,width,height);
        image(specification4,0,0,width,height);
          life();
          lifetime3.update();
          
          if(lifetime3.isTimeUp())gameState = GAME4_START;
          
        break;
      
      
      
      
      //4
      case GAME4_START:
          movie4_1.play();
          image(movie4_1, 0, 0 ,640 ,480);
          float mt4 = movie4_1.time();
          if (mt4>=11){
            
          float i =floor(random(4)+1); //random bg
        
        if(i==1){
        bg4=sketch1;
        }else if(i==2){
          bg4=sketch2;
          }else if(i==3){
            bg4=sketch3;
              }else {
                 bg4=sketch4;
        }
        
      image(bg4,0,0,640,480);
            time1[0].update();
      if(time1[0].isTimeUp())  gameState = GAME4_RUN;
          }
          break;
        
      case GAME4_RUN:
          fill(c);
          noStroke();
          ellipse(50,260,5,5);
          fill(d);
          noStroke();
          ellipse(590,260,5,5);
          
          int x = mouseX;
          int y = mouseY;
          int loc=x+y*bg4.width;
          
          loadPixels();
          colorMode(HSB);
          float value=brightness(bg4.pixels[loc]);
          
          if(value==255){
            
          image(bg4,0,0,640,480);
          fill(c);
          noStroke();
          ellipse(50,260,5,5);
          fill(d);
          noStroke();
          ellipse(590,260,5,5);
          }
          
          if(mouseX>=40 && mouseX<=60 && mouseY>=250 && mouseY<=270){
          c =color(0,126,0);
          }
          if(mouseX>=580 && mouseX<=600 && mouseY>=250 && mouseY<=270){
          d =color(0,200,0);
          }
          
          if(brightness(c)==0 && brightness(d)==0){
            println("win");
            gameState =GAME4_WIN;
          }
          
        time1[3].update();
        time1[3].displayUI();
        if(time1[3].isTimeUp() &&  gameState !=GAME4_WIN){
              gameState =GAME4_LOSE;
              playerHealth--;
            }
            
            if(mousePressed){
            fill(0);
            strokeWeight(10);
            stroke(0);
            line(mouseX,mouseY,pmouseX,pmouseY);
            }
           break;
      case GAME4_WIN:
        movie4_2.play();
       image(movie4_2, 0, 0 ,640 ,480);
      float mt4_2 = movie4_2.time();
      if (mt4_2>=15){
               
      gameState = 21;
      } 

        break;
      case GAME4_LOSE:
        movie4_3.play();
        image(movie4_3, 0, 0 ,640 ,480);
      float mt4_3 = movie4_3.time();
      if (mt4_3>=10){
               
      gameState = 21;
      } 

        break; 
        case 21:

           if(playerHealth>0){
             gameState = GAME_WIN;
           }else gameState = GAME_LOSE;

          break;
        case GAME_WIN:
          image(winScence,0,0,640,480);
          image(restart,260,410);
            if(mouseX<320+120 && mouseX>320 && mouseY<410+40&& mouseY>410){
            image(restart2,260,410);
            if(mousePressed){
              setup();
              gameState = 29;
            }
          }
          break;
        case GAME_LOSE:
          image(loseScence,0,0,640,480);
          image(restart,260,200);
          if(mouseX<320+120 && mouseX>320 && mouseY<200+40&& mouseY>200){
            image(restart2,260,200);
            if(mousePressed){
              setup();
              gameState = 29;
            }
          }
        break;
}
      if(playerHealth<=0){
        gameState =  GAME_LOSE;
      }
   
}

void mouseClicked() {

  noSleep = true;
  energe.move();
  changeFrameCount++;
  
}

void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      
      case LEFT:
   
      leftState = true;
      break;
      
      case RIGHT:
    
      rightState = true;
      break;
      
      case DOWN:
      
      downState = true;
          
      break;
         case UP:
   
      upState = true;
    }
  }else{
    if(key=='3'){
      // Press B to toggle demo mode
      gameState = GAME3_START;
    }
    if(key=='2'){
      // Press B to toggle demo mode
      gameState = GAME2_START;
    }
    if(key=='4'){
      // Press B to toggle demo mode
      gameState = GAME4_START;
    }
  }
}
void keyReleased() {
  if (key == CODED){
    switch (keyCode) {
      case LEFT:
    
      leftState = false;
      break;
      case DOWN:
      downState = false;
      break;
      case UP:
      upState = false;
      break;
      case RIGHT:
      rightState = false;
      break;
    }
  }
}

void ImageHow(PImage name){
image(name,240+playerX+m , 20+ playerY+e,100,80);
}

boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh){
  return   ax + aw > bx &&    // a right edge past b left
        ax < bx + bw &&    // a left edge past b right
        ay + ah > by &&
        ay < by + bh;
}

void life(){
   // text("life",width/2-30-60-20,height/2-50);
      for(int i = 0; i<playerHealth ;i++){
        int x = width/2+30+i*80;
        int y = height-115;
          image(life,x,y,60,60);
      }
}
