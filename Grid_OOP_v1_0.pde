import processing.serial.*;

//global variables
byte sensors[][]={
  {(-20),(127),(95)},
  {(-128),(30),(-50)},
  {(0),(35),(10)},
  {(127),(60),(45)}
};
byte tempSensors[];
byte fans[] = new byte[3];
//used for timer of the button
final long interval = 150;
long currentMillis=0;
long previousMillis=0;
//buttons
Button button1 = new Button(50, 620, 320, 50, 20, 20, 20, 20, "Предни вентилатори", 10, -10);
Button button2 = new Button(50, 680, 320, 50, 20, 20, 20, 20, "Горни вентилатори", 10, -10);
Button button3 = new Button(50, 740, 320, 50, 20, 20, 20, 20, "Задни вентилатори", 10, -10);
//sliders
Slider slider1 = new Slider(390, 630, 390, 740, 30);
Slider slider2 = new Slider(390, 690, 390, 740, 30);
Slider slider3 = new Slider(390, 750, 390, 740, 30);
//used for the logo
PImage logo;
boolean pic = true;
//serial
Serial myPort;
//used to create the grid
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
//sliders to control fan speeds
public class Slider{
  //variables
  private float boxX, boxY, sliderStart, sliderEnd, xOffset;
  private int boxSize;
  private boolean overBox;
  //constructor
  Slider(float boxX, float boxY, float sliderStart, float sliderEnd, int boxSize){
    this.boxX = (sliderEnd - sliderStart)/2 + boxX;
    this.boxY = boxY;
    this.sliderStart = sliderStart;
    this.sliderEnd = sliderEnd;
    this.xOffset = 0.0;
    this.boxSize = boxSize;
    this.overBox = false;
  }
  //used to create and update the slider's box position
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
  //check if the mouse is pressed and makes the stroke
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
  //adjust the position of the box
  void mouseDragged() {
    if(mousePressed && mouseX <= sliderEnd + 28 && mouseX >= sliderStart + 4
    && mouseY > boxY && mouseY < boxY+boxSize) {
      boxX = mouseX-xOffset; 
    }
  }
}
//used for the buttons
class Button{
  //variables
  private float startA, startB, trCorner, tlCorner, blCorner, brCorner;
  private int sizeA, sizeB, option0, option1;
  private String inText;
  private boolean toggle;
  public boolean isClicked;
  //constructor
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
  //creates button the first time
  public int CreateButton(){
    //button main body
    fill(0);
    rect(startA, startB, (sizeA*9)/10, sizeB, trCorner, 0, 0, brCorner);
    fill(225);
    textSize(sizeB/2);
    text(inText, startA+(sizeA*5)/100, startB+(sizeB*67)/100);
    //toggle body
    fill(255);
    rect(startA+(sizeA*9)/10, startB, (sizeA*1)/10, sizeB, 0, tlCorner, blCorner, 0);
    return option0;
  }
  //used to update the button
  public int UpdateButton(){
    //main body
    fill(0);
    rect(startA, startB, (sizeA*9)/10, sizeB, trCorner, 0, 0, brCorner);
    fill(225);
    textSize(sizeB/2);
    text(inText, startA+(sizeA*5)/100, startB+(sizeB*67)/100);
    //check for click
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
  //mouseover check
  boolean Mouseover(float startA, float startB, float sizeA, float sizeB){
    if (mouseX >= startA && mouseX <= startA+sizeA && mouseY >= startB && mouseY <= startB+sizeB) {
      return true;
    } else {
      return false;
    }
  }
  //check if the mouse is released
  void mouseReleased() {
    isClicked = false;
  }
}

void setup(){
  size(800, 800);
  //displaying the logo at startup
  logo = loadImage("logo.png");
  background(logo);
  //initialize the grid
  grid = new Grid(50, 100, 100, sensors);
  grid.CreateGrid();
  //serial
  myPort = new Serial(this, Serial.list()[0], 9600);
  
}

void draw(){
  
  //used to stop displaying the logo and creates buttons
  if(pic){
    delay(2000);
    background(200, 200, 200);
    button1.CreateButton();
    button2.CreateButton();
    button3.CreateButton();
    pic = false;
  }else{
  //  myPort.write()
    //creation of outline behind the grid
    fill(0);
    rect(40, 90, 720, 520, 20, 20, 20, 20);
    //creation of label on the top
    noStroke();
    fill(0);
    rect(30, 20, 740, 50, 20, 20, 20, 20);
    fill(255);
    textSize(30);
    text("Охладителна система за персонален компютър", 41, 55);
    //used for the sliders
    fill(160);
    rect(385, 620, 390, 50, 10, 10, 10, 10);
    rect(385, 680, 390, 50, 10, 10, 10, 10);
    rect(385, 740, 390, 50, 10, 10, 10, 10);
    //creation of sliders
    slider1.CreateSlider();
    slider1.mouseDragged();
    slider2.CreateSlider();
    slider2.mouseDragged();
    slider3.CreateSlider();
    slider3.mouseDragged();
  
    noStroke();
    //timer for the buttons and updating
    currentMillis = millis();
    if(currentMillis - previousMillis >= interval){
      previousMillis = currentMillis;
      button1.UpdateButton();
      button2.UpdateButton();
      button3.UpdateButton();
    }
    
    byte tempSensors[] = myPort.readBytes(12);
    byte serialCounter = 0;
    for(int i = 0; i < 4; i++){
      for(int j = 0; j < 3; i++){
        sensors[i][j] = tempSensors[serialCounter];
        serialCounter++;
      }
    }
    //creating the grid
    grid.UpdateGrid(sensors);
  }
}