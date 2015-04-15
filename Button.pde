// class handels all buttons in the game
class Button
{

  float sizeX;
  float sizeY;
  float sizeYMax;
  float x;
  float y; 
  String text;
  boolean isMouseOver = false;
  float clrR;
  float clrG; 
  float clrB;
  int type;
  
  float h;
  float w;
  
  boolean dragging = false;
  
  // initilizes a new button with position growth changes color and text
  public Button(float x, float y, float sizeX, float sizeY, float clrR, float clrG, float clrB, int type, String text)
  {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;

    this.clrR =  clrR;
    this.clrG =    clrG;
    this.clrB =   clrB;

    this.text = text;
    this.type = type;
    
    this.w = sizeX / 2;
    this.h = sizeY / 2;
  }
  
  // draws the button to the screen
  //@ returns void
  public void Draw()
  {
    noStroke();
    textAlign(CENTER);

    if (!isMouseOver)
    {
      fill(clrR, clrG, clrB);
      rect(this.x - w, this.y - h, this.sizeX, this.sizeY);
      
      //fill(0);
      //textSize(20); 
      //text(text, this.x, this.y + (this.sizeY / 6));
    }
    else
    {
      fill(0,0,100, 50);
      rect(this.x - w, this.y - h, this.sizeX, this.sizeY);
      
      //fill(255);
      //textSize(20); 
      //text(text, this.x, this.y + (this.sizeY / 6));

    }
    
    
  }
  
  // checks for if the mouse is over this button
  // if it is it grows the button size
  // @ returns void
  public boolean checkMouseOver()
  {
    // and if mouse is down send bac they joint type for the next joint (nothing, up and down, ect)
    if (mouseX > x - w && mouseX < x + w && mouseY > y - h && mouseY < y + h)
    {
      isMouseOver = true;
    }
    else
    {
      isMouseOver = false;
    }
    
    return isMouseOver;
  }
  
  void DragObject()
  {
    this.x = mouseX;
    this.y = mouseY;
  }
}

