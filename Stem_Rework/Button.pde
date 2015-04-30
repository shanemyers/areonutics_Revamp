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

  //String text;
  boolean isMouseOver = false;
  float scaleY;
  float scaleX;
  int type;

  float h;
  float w;

  boolean dragging = false;
  boolean prevDragging = false;
  boolean draggable = false;
  boolean inPosition = false;
  boolean active = true;

  int targetID = -1;

  PImage img;

  // initilizes a new button with position growth changes color and text
  public Button(float x, float y, float sizeX, float sizeY, float scaleX, float scaleY, int type, boolean drag, PImage img)
  {
    this.x = x;
    this.y = y;

    this.originX = x;
    this.originY = y;

    this.sizeX = sizeX;
    this.sizeY = sizeY;

    this.scaleX = scaleX;
    this.scaleY = scaleY;

    //this.text = text;
    this.type = type;

    this.w = sizeX / 2;
    this.h = sizeY / 2;

    this.draggable = drag;

    this.img = img;
  }

  // draws the button to the screen
  //@ returns void
  public void Draw()
  {
    noStroke();
    textAlign(CENTER);

    /*
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
     */
    
    pushMatrix();
    
    translate(x, y);
    
    scale(scaleX, scaleY);
    
    if (!isMouseOver)
    {
      tint(255,255,255, 255);
    }
    else
    {
      tint(255,255,255, 100);
    }
    
    if(!active)
    {
      tint(123, 123, 123, 255);
    }
    
    if (img != null)
    {
      image(img, 0, 0);
    }
    
    popMatrix();
    
    //rect(this.x, this.y, 4, 4);
  
    //ellipse(x, y, 8, 8);
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

  void setPrevDrag()
  {
    prevDragging = dragging;
  }
}

