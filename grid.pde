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
  value=ByteFix((aa+ba+128)/2);
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

boolean Mouseover(float startA, float startB, float size){
  if (mouseX >= startA && mouseX <= startA+size && mouseY >= startB && mouseY <= startB+size) {
    return true;
  } else {
    return false;
  }
}

void Block(int startA, int startB, int size, float trCorner, float tlCorner, float blCorner, float brCorner, byte value){
  float tempVar;
  byte realValue;
  rect(startA, startB, size, size, trCorner, tlCorner, blCorner, brCorner);
  if(Mouseover(startA, startB, size)){
    tempVar=value; //map(value, -128, 127, 0, 100);
    realValue=(byte)tempVar;
    print(realValue, "\n");
  }
}

byte ByteFix(int value){
  byte realValue=(byte)value;
  return realValue;
}

void FrontFans(byte aa, byte ab, byte ac, byte ad , byte ba , byte bb , byte bc , byte bd, byte ca, byte cb, byte cc, byte cd){
  int temp=aa+ab+2*ac+2*ad+ba+bb+2*bc+2*bd+ca+cb+2*cc+2*cd/18;
}

void BackFans(byte aa, byte ab, byte ac, byte ad , byte ba , byte bb , byte bc , byte bd, byte ca, byte cb, byte cc, byte cd){
  int temp = 2*aa+2*ab+ac+ad+2*ba+2*bb+bc+bd+2*ca+2*cb+cc+cd/18;
}

void TopFans(byte aa, byte ab, byte ac, byte ad , byte ba , byte bb , byte bc , byte bd, byte ca, byte cb, byte cc, byte cd){
  int temp = 2*aa+2*ab+2*ac+2*ad+ba+bb+bc+bd+ca+cb+cc+cd/16;
}

void setup() {
  size(800, 800);
  background(200, 200, 200);

}

void draw() {
  //startPoint
  int startA = 50;
  int startB = 150;
  
  //line size
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
  
  
  
  Grid(startA, startB, size, aa ,ab ,ac ,ad ,ba ,bb ,bc ,bd ,ca ,cb ,cc ,cd);
}
