void Grid(int startA, int startB, int size, byte aa, byte ab, byte ac, byte ad , byte ba , byte bb , byte bc , byte bd, byte ca, byte cb, byte cc, byte cd){

//line1
  fill(aa+128);
  rect(startA, startB, size, size, size/5, 0, 0, 0);
  fill((aa+ab)/2+128);
  rect(startA+size, startB, size, size);
  fill(ab+128);
  rect(startA+2*size, startB, size, size);
  fill((ab+ac)/2+128);
  rect(startA+3*size, startB, size, size);
  fill(ac+128);
  rect(startA+4*size, startB, size, size);
  fill((ac+ad)/2+128);
  rect(startA+5*size, startB, size, size);
  fill(ad+128);
  rect(startA+6*size, startB, size, size, 0, size/5, 0, 0);
  //line2
  fill((aa+ba+128)/2);
  rect(startA, startB+size, size, size);
  fill((aa+ba+ab+bb)/4+128);
  rect(startA+size, startB+size, size, size);
  fill((ab+bb)/2+128);
  rect(startA+2*size, startB+size, size, size);
  fill((ab+bb+ac+bc)/4+128);
  rect(startA+3*size, startB+size, size, size);
  fill((ac+bc)/2+128);
  rect(startA+4*size, startB+size, size, size);
  fill((ac+bc+ad+bd)/4+128);
  rect(startA+5*size, startB+size, size, size);
  fill((ad+bd)/2+128);
  rect(startA+6*size, startB+size, size, size);
  //line3
  fill(ba+128);
  rect(startA, startB+2*size, size, size);
  fill((ba+bb)/2+128);
  rect(startA+size, startB+2*size, size, size);
  fill(bb+128);
  rect(startA+2*size, startB+2*size, size, size);
  fill((bb+bc)/2+128);
  rect(startA+3*size, startB+2*size, size, size);
  fill(bc+128);
  rect(startA+4*size, startB+2*size, size, size);
  fill((bc+bd)/2+128);
  rect(startA+5*size, startB+2*size, size, size);
  fill(bd+128);
  rect(startA+6*size, startB+2*size, size, size);
  //line4
  fill((ba+ca)/2+128);
  rect(startA, startB+3*size, size, size);
  fill((ba+ca+bb+cb)/4+128);
  rect(startA+size, startB+3*size, size, size);
  fill((bb+cb)/2+128);
  rect(startA+2*size, startB+3*size, size, size);
  fill((bb+cb+bc+cc)/4+128);
  rect(startA+3*size, startB+3*size, size, size);
  fill((bc+cc)/2+128);
  rect(startA+4*size, startB+3*size, size, size);
  fill((bc+cc+bd+cd)/4+128);
  rect(startA+5*size, startB+3*size, size, size);
  fill((bd+cd)/2+128);
  rect(startA+6*size, startB+3*size, size, size);
  //line5
  fill(ca+128);
  rect(startA, startB+4*size, size, size, 0, 0, 0, size/5);
  fill((ca+cb)/2+128);
  rect(startA+size, startB+4*size, size, size);
  fill(cb+128);
  rect(startA+2*size, startB+4*size, size, size);
  fill((cb+cc)/2+128);
  rect(startA+3*size, startB+4*size, size, size);
  fill(cc+128);
  rect(startA+4*size, startB+4*size, size, size);
  fill((cc+cd)/2+128);
  rect(startA+5*size, startB+4*size, size, size);
  fill(cd+128);
  rect(startA+6*size, startB+4*size, size, size, 0, 0, size/5, 0);
}

void setup() {
  size(800, 800);
  background(80, 80, 80);

}

void draw() {
  //startPoint
  int startA = 50;
  int startB = 150;
  
  //line size
  int size = 100;
  
  //line1Sensors
  byte aa = -20;
  byte ab = -120;
  byte ac = 0;
  byte ad = 50;
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