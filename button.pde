Button button1;

class Button{
  
  private float startA, startB, trCorner, tlCorner, blCorner, brCorner;
  private int sizeA, sizeB, option0, option1;
  private String inText;
  private boolean toggle, isClicked;
  
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
  //logic
  if (mousePressed && (mouseButton == LEFT) && Mouseover(startA, startB, sizeA, sizeB)){
    if(toggle && !isClicked){
      toggle=false;
    }else if(!toggle && !isClicked){
      toggle=true;
    }
      isClicked=true;
  }
  
  //toggle body
  if(toggle){
    fill(255);
    rect(startA+(sizeA*9)/10, startB, (sizeA*1)/10, sizeB, 0, tlCorner, blCorner, 0);
    println (option0);
    return option0;
  }else{
    fill(0);
    rect(startA+(sizeA*9)/10, startB, (sizeA*1)/10, sizeB, 0, tlCorner, blCorner, 0);
    println (option1);
    return option1;
  }
  }
  
  public int UpdateButton(){
    if (mousePressed && (mouseButton == LEFT) && Mouseover(startA, startB, sizeA, sizeB)){
    if(toggle && !isClicked){
      toggle=false;
    }else if(!toggle && !isClicked){
      toggle=true;
    }
      isClicked=true;
  }
  
  //toggle body
  if(toggle){
    fill(255);
    rect(startA+(sizeA*9)/10, startB, (sizeA*1)/10, sizeB, 0, tlCorner, blCorner, 0);
    println (option0);
    return option0;
  }else{
    fill(0);
    rect(startA+(sizeA*9)/10, startB, (sizeA*1)/10, sizeB, 0, tlCorner, blCorner, 0);
    println (option1);
    return option1;
  }
  }
  
  void mouseReleased() {
  isClicked = false;
}

boolean Mouseover(float startA, float startB, float sizeA, float sizeB){
  if (mouseX >= startA && mouseX <= startA+sizeA && mouseY >= startB && mouseY <= startB+sizeB) {
    return true;
  } else {
    return false;
  }
}
}

void setup() {
  size(800, 800);
  background(200, 200, 200);
  fill(0);
  rect(30, 20, 740, 50, 20, 20, 20, 20);
  fill(255);
  textSize(30);
  text("Охладителна система за персонален компютър", 41, 55);
  Button button1 = new Button(50, 620, 320, 50, 20, 20, 20, 20, "Предни вентилатори", 10, -10);
  button1.CreateButton();
}

void draw() {
  button1.UpdateButton();
}