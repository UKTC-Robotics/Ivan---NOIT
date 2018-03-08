/*
float boxX;
float boxY;
int boxSize = 30;
float sliderStart;
float sliderEnd;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
*/
    Slider slider = new Slider(80, 160, 100, 500, 30);
void setup() {

  size(640, 360);
    background(100);
  /*
  boxX = width/2.0;
  boxY= height/2.0;
  sliderEnd = 500;
  sliderStart = 100;
  rectMode(RADIUS); 
  */
  background(100);
  
}

void draw() { 
slider.CreateSlider();

  
  // Test if the cursor is over the box 
/*  if (mouseX > boxX-boxSize && mouseX < boxX+boxSize && 
      mouseY > boxY-boxSize && mouseY < boxY+boxSize) {
    overBox = true;  
    if(!locked) { 
      stroke(0); 
      fill(153);
    } 
  } else {
    stroke(153);
    fill(153);
    overBox = false;
  }
  
  // Draw the box
  rect(boxX, boxY, boxSize, boxSize);
  
  println (map(boxX, sliderStart, sliderEnd, 0, 100));
  */
}
/*
void mousePressed() {
  if(overBox) { 
    locked = true; 
    fill(255);
  } else {
    locked = false;
  }
  xOffset = mouseX-boxX;  

}

void mouseDragged() {
  if(locked && mouseX < sliderEnd - boxSize && mouseX >= sliderStart + boxSize) {
    boxX = mouseX-xOffset; 
  }
}

void mouseReleased() {
  locked = false;
}
*/
public class Slider{
  public float boxX, tempBoxX, boxY, sliderStart, sliderEnd, xOffset;
  public int boxSize;
  public boolean overBox, first;
  
  Slider(float boxX, float boxY, float sliderStart, float sliderEnd, int boxSize){
    this.boxX = (sliderEnd - sliderStart)/2 + boxX;
    this.boxY = boxY;
    this.sliderStart = sliderStart;
    this.sliderEnd = sliderEnd;
    this.xOffset = 0.0;
    this.boxSize = boxSize;
    this.overBox = false;
    this.tempBoxX = boxX;
    this.first = true;
  }
  
  public void CreateSlider(){
    if (mouseX > boxX && mouseX < boxX+boxSize && 
        mouseY > boxY && mouseY < boxY+boxSize) {
    overBox = true;  
    if(mousePressed() && mousePressed) { 
      stroke(255); 
      fill(255);
      } 
    } else {
      stroke(153);
      fill(80);
      overBox = false;
    }
  
  // Draw the box
    if(boxX != tempBoxX || first == true){
      rect(tempBoxX, boxY, boxSize, boxSize);
      first = false;
    }
    println (map(boxX, sliderStart, sliderEnd, 0, 100));
  
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
  if(mousePressed && mouseX <= sliderEnd - boxSize && mouseX >= sliderStart + boxSize) {
    tempBoxX = mouseX-xOffset; 
  }
}

//void mouseReleased() {
//  locked = false;
//}
  }
  