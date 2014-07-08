interface PNaClCsound {
   void Event(String val);
}

PnaclCsound csound;

void bindCsound(PNaClCsound cs) {
     csound = cs;
}

Circle[] _circleArr = {};
int[] notes = {60, 62, 64, 67, 71, 72, 74, 76, 79, 83};
Preloader p = new Preloader();

class Preloader {
   String loadingText = "Loading Csound... Only works with Google Chrome";
   
   void drawMe() {
      fill(#ffffff);
      textSize(18);
      text(loadingText, width/2 - textWidth(loadingText)/2, 
          height/2 - 9);
   } 
}

void setup(){
  size(800,800);
  noStroke();
  smooth();  
}

void draw(){
  background(0);
  
  if(csound==null){
    p.drawMe();
  }
  else{
    for (int i=0; i<_circleArr.length; i++){
      Circle thisCirc = _circleArr[i];
      thisCirc.updateMe();
    }
  }
}

void mousePressed(){
  drawCircle();

   if(csound != null) {
	  int ranNote = int(random(0,10));
	  switch(ranNote){
		case 0:
                  csound.ReadScore("i1 0 2 0.2 60 0.5");
                  break; 
		case 1:
                  csound.ReadScore("i1 0 2 0.2 62 0.5");
                  break;
		case 2:
                  csound.ReadScore("i1 0 2 0.2 64 0.5"); 
                  break;
		case 3:
                  csound.ReadScore("i1 0 2 0.2 67 0.5"); 
                  break;
		case 4:
                  csound.ReadScore("i1 0 2 0.2 71 0.5"); 
                  break;
		case 5:
                  csound.ReadScore("i1 0 2 0.2 72 0.5"); 
                  break;
		case 6:
                  csound.ReadScore("i1 0 2 0.2 74 0.5");
                  break; 
		case 7:
                  csound.ReadScore("i1 0 2 0.2 76 0.5");
                  break; 
		case 8:
                  csound.ReadScore("i1 0 2 0.2 79 0.5"); 
                  break;
		case 9:
                  csound.ReadScore("i1 0 2 0.2 83 0.5"); 
                  break;
		case 10:
                  csound.ReadScore("i1 0 2 0.2 84 0.5"); 
                  break;
                }
   }
   
}

void drawCircle() {
  Circle thisCirc = new Circle(mouseX, mouseY);
  thisCirc.drawMe();
  _circleArr = (Circle[])append(_circleArr, thisCirc);
}

class Circle{
  float x,y;
  float radius;
  color fillcol;
  float alph;
  
  Circle(int tempx, int tempy){
   x = tempx;
    y = tempy;
    radius = 100;
    fillcol = color(random(255), random(255), random(255));
    alph = 100;
  }
  
  void drawMe(){
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
  }
  
  void updateMe(){
    if (alph > 0){
      alph--;
      drawMe();
      //println(alph);
    }
    else{
    }
  }
  
}

