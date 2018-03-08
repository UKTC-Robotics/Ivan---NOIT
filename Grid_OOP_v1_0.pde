//global variables
byte sensors[][]={
  {(-20),(127),(95)},
  {(-128),(30),(-50)},
  {(0),(35),(10)},
  {(127),(60),(45)}
};

final long interval = 150;

long currentMillis=0;
long previousMillis=0;

Button button1 = new Button(50, 620, 320, 50, 20, 20, 20, 20, "Предни вентилатори", 10, -10);
Button button2 = new Button(50, 680, 320, 50, 20, 20, 20, 20, "Горни вентилатори", 10, -10);
Button button3 = new Button(50, 740, 320, 50, 20, 20, 20, 20, "Задни вентилатори", 10, -10);

Slider slider1 = new Slider(390, 630, 390, 740, 30);
Slider slider2 = new Slider(390, 690, 390, 740, 30);
Slider slider3 = new Slider(390, 750, 390, 740, 30);

Grid grid;
//block of the grid
class Block{
  //variables
  private int startA, startB, size;
  private float tlCorner, trCorner, brCorner, blCorner;
  private byte value;
  //constructor
  Block(int startA, int startB, int size, float tlCorner, float trCorner, float brCorner, float blCorner, byte value){
    this.startA = startA;
    this.startB = startB;
    this.size = size;
    this.tlCorner = tlCorner;
    this.trCorner = trCorner;
    this.blCorner = blCorner;
    this.brCorner = brCorner;
    this.value = value;
  }
  //creation of the block
  public void CreateBlock(byte newValue){
    //used for the block update
    this.value = newValue;
    //used to create the square of the block
    byte realValue = (byte)map(value, -128, 127, 0, 100);
    fill(value+128);
    rect(startA, startB, size, size, trCorner, tlCorner, blCorner, brCorner);
    //used for the number inside the block
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
}

//the grid of blocks for presenting the information from sensors
class Grid{
  //variables
  private int startA, startB, size, maxA, maxB;
  private byte [][] sensors;
  private Block [][] blocks = new Block[7][5];
  //constructor
  Grid(int startA, int startB, int size, byte [][]sensors){
    this.startA = startA;
    this.startB = startB;
    this.size = size;
    this.maxA = 6;
    this.maxB = 4;
    this.sensors = sensors;
  }
  //used to create the grid and its layout the first time
  public void CreateGrid(){
    //for loops to create the grid
    for(int a = 0; a <= maxA; a++){
      for(int b = 0; b <= maxB; b++){
        if(a%2 == 0 && b%2 == 0 && !(a == 0 && b == 0) && !(a == maxA && b == 0) && !(a == 0 && b == maxB) && !(a == maxA && b == maxB)){
          blocks[a][b] = new Block(startA+(size*a), startB+(size*b), size, 0, 0, 0, 0, sensors[a/2][b/2]);
        }else if(a == 0 && b == 0){
          blocks[a][b] = new Block(startA+(size*a), startB+(size*b), size, 0, size/5, 0, 0, sensors[0][0]);
        }else if(a == maxA && b == 0){
          blocks[a][b] = new Block(startA+(size*a), startB+(size*b), size, size/5, 0, 0, 0, sensors[maxA/2][0]);
        }else if(a == 0 && b == maxB){
          blocks[a][b] = new Block(startA+(size*a), startB+(size*b), size, 0, 0, size/5, 0, sensors[0][maxB/2]);
        }else if(a == maxA && b == maxB){
          blocks[a][b] = new Block(startA+(size*a), startB+(size*b), size, 0, 0, 0, size/5, sensors[maxA/2][maxB/2]);
        }else if(a%2 == 1 && b%2 == 0){
          blocks[a][b] = new Block(startA+(size*a), startB+(size*b), size, 0, 0, 0, 0, byte((sensors[a/2][b/2] + sensors[a/2+1][b/2])/2));
        }else if(a%2 == 0 && b%2 == 1){
          blocks[a][b] = new Block(startA+(size*a), startB+(size*b), size, 0, 0, 0, 0, byte((sensors[a/2][b/2] + sensors[a/2][b/2+1])/2));
        }else if(a%2 == 1 && b%2 == 1){
          blocks[a][b] = new Block(startA+(size*a), startB+(size*b), size, 0, 0, 0, 0, byte((sensors[a/2][b/2] + sensors[a/2+1][b/2] + sensors[a/2+1][b/2+1] + sensors[a/2][b/2+1])/4));
        }
      }
    }
  }
  //used to update the information in the grid
  public void UpdateGrid(byte [][]sensors){
    for(int a = 0; a <= maxA; a++){
      for(int b = 0; b <= maxB; b++){
        if(a%2 == 0 && b%2 == 0 && !(a == 0 && b == 0) && !(a == maxA && b == 0) && !(a == 0 && b == maxB) && !(a == maxA && b == maxB)){
          blocks[a][b].CreateBlock(sensors[a/2][b/2]);
        }else if(a == 0 && b == 0){
          blocks[a][b].CreateBlock(sensors[0][0]);
        }else if(a == maxA && b == 0){
          blocks[a][b].CreateBlock(sensors[maxA/2][0]);
        }else if(a == 0 && b == maxB){
          blocks[a][b].CreateBlock(sensors[0][maxB/2]);
        }else if(a == maxA && b == maxB){
          blocks[a][b].CreateBlock(sensors[maxA/2][maxB/2]);
        }else if(a%2 == 1 && b%2 == 0){
          blocks[a][b].CreateBlock(byte((sensors[a/2][b/2] + sensors[a/2+1][b/2])/2));
        }else if(a%2 == 0 && b%2 == 1){
          blocks[a][b].CreateBlock(byte((sensors[a/2][b/2] + sensors[a/2][b/2+1])/2));
        }else if(a%2 == 1 && b%2 == 1){
          blocks[a][b].CreateBlock(byte((sensors[a/2][b/2] + sensors[a/2+1][b/2] + sensors[a/2+1][b/2+1] + sensors[a/2][b/2+1])/4));
        }
      }
    }
  }
}

public class Slider{
  private float boxX, boxY, sliderStart, sliderEnd, xOffset;
  private int boxSize;
  private boolean overBox;
  
  Slider(float boxX, float boxY, float sliderStart, float sliderEnd, int boxSize){
    this.boxX = (sliderEnd - sliderStart)/2 + boxX;
    this.boxY = boxY;
    this.sliderStart = sliderStart;
    this.sliderEnd = sliderEnd;
    this.xOffset = 0.0;
    this.boxSize = boxSize;
    this.overBox = false;
  }
  
  public void CreateSlider(){
    if (mouseX > boxX && mouseX < boxX+boxSize && 
        mouseY > boxY && mouseY < boxY+boxSize) {
    overBox = true;  
    if(mousePressed() && mousePressed) { 
      stroke(255); 
      fill(100);
      } 
    } else {
      stroke(153);
      fill(80);
      overBox = false;
    }
  
  // Draw the box
    rect(boxX, boxY, boxSize, boxSize);
  
  }
  boolean mousePressed() {
    xOffset = mouseX-boxX; 
    if(overBox){   
      fill(153);
      stroke(255);
      return true;
    } else {
      return false;
    }
     
  }

  void mouseDragged() {
    if(mousePressed && mouseX <= sliderEnd + 28 && mouseX >= sliderStart + 4
    && mouseY > boxY && mouseY < boxY+boxSize) {
      boxX = mouseX-xOffset; 
    }
  }
}

class Button{
  
  private float startA, startB, trCorner, tlCorner, blCorner, brCorner;
  private int sizeA, sizeB, option0, option1;
  private String inText;
  private boolean toggle;
  public boolean isClicked;
  
  Button(float startA, float startB, int sizeA, int sizeB, float trCorner, float tlCorner, float blCorner, float brCorner, String inText, int option0, int option1){
    this.startA = startA;
    this.startB = startB;
    this.sizeA = sizeA;
    this.sizeB = sizeB;
    this.trCorner = trCorner;
    this.tlCorner = tlCorner;
    this.blCorner = blCorner;
    this.brCorner = brCorner;
    this.inText = inText;
    this.option0 = option0;
    this.option1 = option1;
    this.toggle = false;
    this.isClicked = false;
  }
  
  public int CreateButton(){
    fill(0);
  rect(startA, startB, (sizeA*9)/10, sizeB, trCorner, 0, 0, brCorner);
  fill(225);
  textSize(sizeB/2);
  text(inText, startA+(sizeA*5)/100, startB+(sizeB*67)/100);
  
  //toggle body
    fill(255);
    rect(startA+(sizeA*9)/10, startB, (sizeA*1)/10, sizeB, 0, tlCorner, blCorner, 0);
    println (option0);
    return option0;
  }
  
  public int UpdateButton(){
    fill(0);
    rect(startA, startB, (sizeA*9)/10, sizeB, trCorner, 0, 0, brCorner);
    fill(225);
    textSize(sizeB/2);
    text(inText, startA+(sizeA*5)/100, startB+(sizeB*67)/100);
    
    if (mousePressed && (mouseButton == LEFT) && Mouseover(startA, startB, sizeA, sizeB)){
    if(toggle && isClicked){
      toggle=false;
    }else if(!toggle && isClicked){
      toggle=true;
    }
      isClicked=true;
    }
    //toggle body
    if(toggle){
      fill(255);
      rect(startA+(sizeA*9)/10, startB, (sizeA*1)/10, sizeB, 0, tlCorner, blCorner, 0);
      return option0;
    }else{
      fill(0);
      rect(startA+(sizeA*9)/10, startB, (sizeA*1)/10, sizeB, 0, tlCorner, blCorner, 0);
      return option1;
    }  
  }
  
 

  boolean Mouseover(float startA, float startB, float sizeA, float sizeB){
    if (mouseX >= startA && mouseX <= startA+sizeA && mouseY >= startB && mouseY <= startB+sizeB) {
      return true;
    } else {
      return false;
    }
  }

  void mouseReleased() {
    isClicked = false;
  }
}


void setup(){
  size(800, 800);
  background(200, 200, 200);
  
  grid = new Grid(50, 100, 100, sensors);
  grid.CreateGrid();
  
  button1.CreateButton();
  button2.CreateButton();
  button3.CreateButton();
}

void draw(){
 // background(200, 200, 200);
    //label
  //creation of outline behind the grid
  fill(0);
  rect(40, 90, 720, 520, 20, 20, 20, 20);
  
  noStroke();
  fill(0);
  rect(30, 20, 740, 50, 20, 20, 20, 20);
  fill(255);
  textSize(30);
  text("Охладителна система за персонален компютър", 41, 55);
  
  fill(160);
  rect(385, 620, 390, 50, 10, 10, 10, 10);
  rect(385, 680, 390, 50, 10, 10, 10, 10);
  rect(385, 740, 390, 50, 10, 10, 10, 10);
  
  slider1.CreateSlider();
  slider1.mouseDragged();
  slider2.CreateSlider();
  slider2.mouseDragged();
  slider3.CreateSlider();
  slider3.mouseDragged();
  
  noStroke();
  
  currentMillis = millis();
  if(currentMillis - previousMillis >= interval){
    previousMillis = currentMillis;
    button1.UpdateButton();
    button2.UpdateButton();
    button3.UpdateButton();
  }
  
  grid.UpdateGrid(sensors);
}