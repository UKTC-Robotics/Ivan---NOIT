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
    Slider slider = new Slider(100, 500, 0.0, 30);
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
  public float boxX, boxY, sliderStart, sliderEnd, xOffset;
  public int boxSize = 30;
  public boolean overBox = false;
  private boolean locked = false;
  
  Slider(float sliderStart, float sliderEnd, float xOffset, int boxSize){
    this.boxX = width/2.0;
    this.boxY = height/2.0;
    this.sliderStart = sliderStart;
    this.sliderEnd = sliderEnd;
    this.xOffset = xOffset;
    this.boxSize = boxSize;
    this.overBox = false;
    this.locked = false;
  }
  
  public void CreateSlider(){
    if (mouseX > boxX-boxSize && mouseX < boxX+boxSize && 
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
  }
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
  }
  