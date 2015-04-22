// class handels all buttons in the game
class Button
{

  float sizeX;
  float sizeY;
  float sizeYMax;
  float x;
  float y; 

  float originX;
  float originY;

  String text;
  boolean isMouseOver = false;
  float clrR;
  float clrG; 
  float clrB;
  int type;

  float h;
  float w;

  boolean dragging = false;
  boolean draggable = false;
  boolean inPosition = false;

  // initilizes a new button with position growth changes color and text
  public Button(float x, float y, float sizeX, float sizeY, float clrR, float clrG, float clrB, int type, boolean drag, String text)
  {
    this.x = x;
    this.y = y;

    this.originX = x;
    this.originY = y;

    this.sizeX = sizeX;
    this.sizeY = sizeY;

    this.clrR =  clrR;
    this.clrG =    clrG;
    this.clrB =   clrB;

    this.text = text;
    this.type = type;

    this.w = sizeX / 2;
    this.h = sizeY / 2;

    this.draggable = drag;
  }

  // draws the button to the screen
  //@ returns void
  public void Draw()
  {
    noStroke();
    textAlign(CENTER);
    
    
    if (draggable)
    {
      pushMatrix();



      if (type == 0)
      {
        translate(x, y);
        
        scale(.1);
        image(resist, 0, 0);
      }
      else
      {
        translate(x, y);
        scale(.1);
        image(volt, 0, 0);
      }

      popMatrix();
    }
    
    if (!isMouseOver)
    {
      fill(clrR, clrG, clrB);
      
      //fill(0);
      //textSize(20); 
      text(text, this.x, this.y + (this.sizeY / 6));
    }
    else
    {
      fill(0, 0, 100, 50);

      //fill(255);
      //textSize(20); 
      text(text, this.x, this.y + (this.sizeY / 6));
    }
    rect(this.x, this.y, this.sizeX, this.sizeY);
    
    ellipse(x,y, 8,8);
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
  
  void DragObject(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
}

