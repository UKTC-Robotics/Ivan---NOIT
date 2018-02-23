//global variables
boolean[] toggles = new boolean[21];{
  for(int i=0; i<21; i++){
    toggles[i]=false;
  }
}
int[] fanSpeed = new int[3];{
    fanSpeed[0]=80; //front
    fanSpeed[1]=80; //back
    fanSpeed[2]=80; //top
}
int[] chosens = new int[21];{
  for(int i=0; i<21; i++){
    chosens[i]=0;
  }
}
boolean isClicked=false;

void Grid(int startA, int startB, int size, byte aa, byte ab, byte ac, byte ad , byte ba , byte bb , byte bc , byte bd, byte ca, byte cb, byte cc, byte cd){
//variables
  byte value;  
//removing the outline
  noStroke();
//creating outline
  fill(0, 0, 0);
  rect(startA-size/10, startB-size/10, size*7+(size/10)*2, size*5+(size/10)*2, size/5, size/5, size/5, size/5);
//line1
  value=aa;
  fill(value+128);
  Block(startA, startB, size, size/5, 0, 0, 0, value);
  value=ByteFix((aa+ab)/2);
  fill(value+128);
  Block(startA+size, startB, size, 0, 0, 0, 0, value);
  value=ab;
  fill(value+128);
  Block(startA+2*size, startB, size, 0, 0, 0, 0, value);
  value=ByteFix((ab+ac)/2);
  fill(value+128);
  Block(startA+3*size, startB, size, 0, 0, 0, 0, value);
  value=ac;
  fill(value+128);
  Block(startA+4*size, startB, size, 0, 0, 0, 0, value);
  value=ByteFix((ac+ad)/2);
  fill(value+128);
  Block(startA+5*size, startB, size, 0, 0, 0, 0, value);
  value=ad;
  fill(value+128);
  Block(startA+6*size, startB, size, 0, size/5, 0, 0, value);
  
  //line2
  value=ByteFix((aa+ba)/2);
  fill(value+128);
  Block(startA, startB+size, size, 0, 0, 0, 0, value);
  value=ByteFix((aa+ba+ab+bb)/4);
  fill(value+128);
  Block(startA+size, startB+size, size, 0, 0, 0, 0, value);
  value=ByteFix((ab+bb)/2);
  fill(value+128);
  Block(startA+2*size, startB+size, size, 0, 0, 0, 0, value);
  value=ByteFix((ab+bb+ac+bc)/4);
  fill(value+128);
  Block(startA+3*size, startB+size, size, 0, 0, 0, 0, value);
  value=ByteFix((ac+bc)/2);
  fill(value+128);
  Block(startA+4*size, startB+size, size, 0, 0, 0, 0, value);
  value=ByteFix((ac+bc+ad+bd)/4);
  fill(value+128);
  Block(startA+5*size, startB+size, size, 0, 0, 0, 0, value);
  value=ByteFix((ad+bd)/2);
  fill(value+128);
  Block(startA+6*size, startB+size, size, 0, 0, 0, 0, value);
  
  //line3
  value=ba;
  fill(value+128);
  Block(startA, startB+2*size, size, 0, 0, 0, 0, value);
  value=ByteFix((ba+bb)/2);
  fill(value+128);
  Block(startA+size, startB+2*size, size, 0, 0, 0, 0, value);
  value=bb;
  fill(value+128);
  Block(startA+2*size, startB+2*size, size, 0, 0, 0, 0, value);
  value=ByteFix((bb+bc)/2);
  fill(value+128);
  Block(startA+3*size, startB+2*size, size, 0, 0, 0, 0, value);
  value=bc;
  fill(value+128);
  Block(startA+4*size, startB+2*size, size, 0, 0, 0, 0, value);
  value=ByteFix((bc+bd)/2);
  fill(value+128);
  Block(startA+5*size, startB+2*size, size, 0, 0, 0, 0, value);
  value=bd;
  fill(value+128);
  Block(startA+6*size, startB+2*size, size, 0, 0, 0, 0, value);
  
  //line4
  value=ByteFix((ba+ca)/2);
  fill(value+128);
  Block(startA, startB+3*size, size, 0, 0, 0, 0, value);
  value=ByteFix((ba+ca+bb+cb)/4);
  fill(value+128);
  Block(startA+size, startB+3*size, size, 0, 0, 0, 0, value);
  value=ByteFix((bb+cb)/2);
  fill(value+128);
  Block(startA+2*size, startB+3*size, size, 0, 0, 0, 0, value);
  value=ByteFix((bb+cb+bc+cc)/4);
  fill(value+128);
  Block(startA+3*size, startB+3*size, size, 0, 0, 0, 0, value);
  value=ByteFix((bc+cc)/2);
  fill(value+128);
  Block(startA+4*size, startB+3*size, size, 0, 0, 0, 0, value);
  value=ByteFix((bc+cc+bd+cd)/4);
  fill(value+128);
  Block(startA+5*size, startB+3*size, size, 0, 0, 0, 0, value);
  value=ByteFix((bd+cd)/2);
  fill(value+128);
  Block(startA+6*size, startB+3*size, size, 0, 0, 0, 0, value);
  
  //line5
  value=ca;
  fill(value+128);
  Block(startA, startB+4*size, size, 0, 0, 0, size/5, value);
  value=ByteFix((ca+cb)/2);
  fill(value+128);
  Block(startA+size, startB+4*size, size, 0, 0, 0, 0, value);
  value=cb;
  fill(value+128);
  Block(startA+2*size, startB+4*size, size, 0, 0, 0, 0, value);
  value=ByteFix((cb+cc)/2);
  fill(value+128);
  Block(startA+3*size, startB+4*size, size, 0, 0, 0, 0, value);
  value=cc;
  fill(value+128);
  Block(startA+4*size, startB+4*size, size, 0, 0, 0, 0, value);
  value=ByteFix((cc+cd)/2);
  fill(value+128);
  Block(startA+5*size, startB+4*size, size, 0, 0, 0, 0, value);
  value=cd;
  fill(value+128);
  Block(startA+6*size, startB+4*size, size, 0, 0, size/5, 0, value);
  
}
//mouseover function
boolean Mouseover(float startA, float startB, float sizeA, float sizeB){
  if (mouseX >= startA && mouseX <= startA+sizeA && mouseY >= startB && mouseY <= startB+sizeB) {
    return true;
  } else {
    return false;
  }
}
//block creating and tempcheck
void Block(int startA, int startB, int size, float trCorner, float tlCorner, float blCorner, float brCorner, byte value){
  //variables
  float tempVar;
  byte realValue;
  //creating the block
  rect(startA, startB, size, size, trCorner, tlCorner, blCorner, brCorner);
  //temp display
      tempVar=map(value, -128, 127, 0, 100);
      realValue=(byte)tempVar;
      textSize(size/2);      
      if(100-realValue>19){
        fill(255);
        if(100-realValue>99){
          text(100-realValue, startA+(size*2)/100, startB+(size*67)/100);
        }else{
          text(100-realValue, startA+(size*18)/100, startB+(size*67)/100);
        }
      }else{
        fill(0);
        if(100-realValue<10){
          text(100-realValue, startA+(size*35)/100, startB+(size*67)/100);
        }else{
          text(100-realValue, startA+(size*18)/100, startB+(size*67)/100);
        }
      }
  }

//fixing some data type problems
byte ByteFix(int value){
  byte realValue=(byte)value;
  return realValue;
}

//simple toggle switch
int Buton(float startA, float startB, int sizeA, int sizeB, float trCorner, float tlCorner, float blCorner, float brCorner, String inText, int option0, int option1, int toggle){
  //buton body
  fill(0);
  rect(startA, startB, (sizeA*9)/10, sizeB, trCorner, 0, 0, brCorner);
  fill(225);
  textSize(sizeB/2);
  text(inText, startA+(sizeA*5)/100, startB+(sizeB*67)/100);
  //logic
  if (mousePressed && (mouseButton == LEFT) && Mouseover(startA, startB, sizeA, sizeB)){
    if(toggles[toggle] && !isClicked){
      chosens[toggle]=option0;
      toggles[toggle]=false;
    }else if(!toggles[toggle] && !isClicked){
      chosens[toggle]=option1;
      toggles[toggle]=true;
    }
      isClicked=true;
  }
  
  //toggle body
  if(toggles[toggle]){
    fill(0);
    rect(startA+(sizeA*9)/10, startB, (sizeA*1)/10, sizeB, 0, tlCorner, blCorner, 0);
  }else{
    fill(255);
    rect(startA+(sizeA*9)/10, startB, (sizeA*1)/10, sizeB, 0, tlCorner, blCorner, 0);
  }
  println (chosens[toggle]);
  return chosens[toggle];
}
//release fix
void mouseReleased() {
  isClicked = false;
}

//checkboxes
int CheckBoxes(){
  
  return 0;
}

int FrontFans(byte aa, byte ab, byte ac, byte ad , byte ba , byte bb , byte bc , byte bd, byte ca, byte cb, byte cc, byte cd){
  int temp=(aa+ab+2*ac+2*ad+ba+bb+2*bc+2*bd+ca+cb+2*cc+2*cd)/18;
  return temp;
}

int BackFans(byte aa, byte ab, byte ac, byte ad , byte ba , byte bb , byte bc , byte bd, byte ca, byte cb, byte cc, byte cd){
  int temp = (2*aa+2*ab+ac+ad+2*ba+2*bb+bc+bd+2*ca+2*cb+cc+cd)/18;
  return temp;
}

int TopFans(byte aa, byte ab, byte ac, byte ad , byte ba , byte bb , byte bc , byte bd, byte ca, byte cb, byte cc, byte cd){
  int temp = (2*aa+2*ab+2*ac+2*ad+ba+bb+bc+bd+ca+cb+cc+cd)/16;
  return temp;
}

void setup() {
  size(800, 800);
  background(200, 200, 200);
  
  //label
  fill(0);
  rect(30, 20, 740, 50, 20, 20, 20, 20);
  fill(255);
  textSize(30);
  text("Охладителна система за персонален компютър", 41, 55);
}

void draw() {
  //startPoints
  int startA = 50;
  int startB = 100;
  
  //block size
  int size = 100;
  
  //line1Sensors
  byte aa = -20;
  byte ab = -128;
  byte ac = 0;
  byte ad = 127;
  //line2Sensors
  byte ba = 127;
  byte bb = 30;
  byte bc = 35;
  byte bd = 60;
  //line3Sensors
  byte ca = 95;
  byte cb = -50;
  byte cc = 10;
  byte cd = 45;
  
  //controled fans
  byte frontFan;
  byte backFan;
  byte topFan;
  
  
  
  
  //creating the grid
  Grid(startA, startB, size, aa ,ab ,ac ,ad ,ba ,bb ,bc ,bd ,ca ,cb ,cc ,cd);
  //front fans button
  Buton(50, 620, 320, 50, 20, 20, 20, 20, "Предни вентилатори", FrontFans(aa, ab, ac, ad, ba, bb, bc, bd, ca, cd, cc, cd), aa, 0);
  //back fans button
  Buton(50, 680, 320, 50, 20, 20, 20, 20, "Задни вентилатори", BackFans(aa, ab, ac, ad, ba, bb, bc, bd, ca, cd, cc, cd), aa, 1);
  //top fans button
  Buton(50, 740, 320, 50, 20, 20, 20, 20, "Горни вентилатори", TopFans(aa, ab, ac, ad, ba, bb, bc, bd, ca, cd, cc, cd), aa, 2);
  
  //front 0%
  Buton(400, 620, 40, 50, 20, 0, 0, 20, "0%", 0, -10, 3);
  //front 20%
  Buton(440, 620, 60, 50, 0, 0, 0, 0, "20%", 20, -10, 4);
  //front 40%
  Buton(500, 620, 60, 50, 0, 0, 0, 0, "40%", 40, -10, 5);
  //front 60%
  Buton(560, 620, 60, 50, 0, 0, 0, 0, "60%", 60, -10, 6);
  //front 80%
  Buton(620, 620, 60, 50, 0, 0, 0, 0, "80%", 80, -10, 7);
  //front 100%
  Buton(680, 620, 80, 50, 0, 20, 20, 0, "100%", 100, -10, 8);
  
  //back 0%
  Buton(400, 680, 40, 50, 20, 0, 0, 20, "0%", 0, -10, 9);
  //back 20%
  Buton(440, 680, 60, 50, 0, 0, 0, 0, "20%", 20, -10, 10);
  //back 40%
  Buton(500, 680, 60, 50, 0, 0, 0, 0, "40%", 40, -10, 11);
  //back 60%
  Buton(560, 680, 60, 50, 0, 0, 0, 0, "60%", 60, -10, 12);
  //back 80%
  Buton(620, 680, 60, 50, 0, 0, 0, 0, "80%", 80, -10, 13);
  //back 100%
  Buton(680, 680, 80, 50, 0, 20, 20, 0, "100%", 100, -10, 14);
  
  //top 0%
  Buton(400, 740, 40, 50, 20, 0, 0, 20, "0%", 0, -10, 15);
  //top 20%
  Buton(440, 740, 60, 50, 0, 0, 0, 0, "20%", 20, -10, 16);
  //top 40%
  Buton(500, 740, 60, 50, 0, 0, 0, 0, "40%", 40, -10, 17);
  //top 60%
  Buton(560, 740, 60, 50, 0, 0, 0, 0, "60%", 60, -10, 18);
  //top 80%
  Buton(620, 740, 60, 50, 0, 0, 0, 0, "80%", 80, -10, 19);
  //top 100%
  Buton(680, 740, 80, 50, 0, 20, 20, 0, "100%", 100, -10, 20);
}
