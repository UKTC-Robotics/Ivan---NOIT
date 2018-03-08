
    Slider slider = new Slider(80, 160, 100, 500, 30);
void setup() {
  size(640, 360);
  background(100);
}

void draw() { 
  background(100);
slider.CreateSlider();
slider.mouseDragged();
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
      fill(255);
      } 
    } else {
      stroke(153);
      fill(80);
      overBox = false;
    }
  
  // Draw the box
    rect(boxX, boxY, boxSize, boxSize);
    
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
    if(mousePressed && mouseX <= sliderEnd + 28 && mouseX >= sliderStart + 4
    && mouseY > boxY && mouseY < boxY+boxSize) {
      boxX = mouseX-xOffset; 
    }
  }

}
  