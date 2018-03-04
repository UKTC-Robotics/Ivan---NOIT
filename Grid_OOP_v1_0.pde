//global variables
byte sensors[][]={
  {(-20),(127),(95)},
  {(-128),(30),(-50)},
  {(0),(35),(10)},
  {(127),(60),(45)}
};

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
    //creation of outline behind the grid
    fill(0);
    rect(startA-size/10, startB-size/10, size*(maxA+1)+(size/10)*2, size*(maxB+1)+(size/10)*2, size/5, size/5, size/5, size/5);
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

void setup(){
  size(800, 800);
  background(200, 200, 200);
  
  //label
  noStroke();
  fill(0);
  rect(30, 20, 740, 50, 20, 20, 20, 20);
  fill(255);
  textSize(30);
  text("Охладителна система за персонален компютър", 41, 55);
  
  grid = new Grid(50, 100, 100, sensors);
  grid.CreateGrid();
}

void draw(){
  grid.UpdateGrid(sensors);
}