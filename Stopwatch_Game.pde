float timer=0;
float[] score_array={0,0,0};
int game_count=0;
float total=0;
int target_time=(int)random(3,6);

void setup(){
  size(600,800);
  background(255);
  PFont font=createFont("MS Gothic",40);
  textFont(font);
}

void draw(){
  timer=(millis()/ 1000.0)-total;
  background(255);

  fill(0);
  ellipse(250,250,200,200);
  stroke(255);
  strokeWeight(5);
  ellipse(250,250,180,180);
  fill(255);
  PFont font=createFont("MS Gothic",40);
  textFont(font);
 
  if(game_count!=3){ 
    text(timer,170,270);     
  }
  showText();
}

void showText(){
  fill(0);  
  text("目標タイム："+target_time+".0秒",100,70);

  PFont font=createFont("MS Gothic",30);
  textFont(font);
  
  fill(137,130,130);
  rect(80,450,400,300);
  
  fill(255);
  for(int i=0;i<score_array.length;i++){
    text((i+1)+"回目："+score_array[i],100,500+(i*50));
  }
  
  if(game_count==3){
     showScore();
  }
}

void mousePressed(){
   score_array[game_count]=timer;
   total +=timer;
   game_count++;
}

void showScore(){
   text("平均："+(total/score_array.length),200,650); 
   text("誤差："+(((total/score_array.length) - target_time) / target_time)*100+"%",200,700);
   noLoop();
}
