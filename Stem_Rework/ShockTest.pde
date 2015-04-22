class ShockTest
{
  
  Material mat;
  ArrayList<Button> btns = new ArrayList<Button>();
  
  float currForce = 0;
  boolean done = false;
  boolean punching = false;
  
  PImage fist;
  float fistX = 1400;
  float fistY = 400;
  
  ShockTest(Material mat)
  {
    
    this.mat = mat;
    
    // add images and a counder that is set via what matieal was selected upon entering this class
    
    Button temp = new Button(width/24, 600, 260, 260, 200, 0, 200, 0, true, "temp");
    btns.add(temp);
    
    temp = new Button(width/2, height / 2, 260, 260, 200, 0, 200, 1, false, "temp");
    btns.add(temp);
  }
  
  void Update()
  {
    
    if(punching && fistX > width / 2)
    {
      fistX -= currForce / 4 + 1;
    }
    if(fistX < width / 2)
    {
      fistX = width / 2; 
    }
    
    for (Button b : btns)
    {
      if (b.draggable && b.checkMouseOver() && Input.mouseDown)
      {
        switch(b.type)
        {
        case 0:
          if (mouseY > 150 && mouseY < 600)
          {
            b.DragObject(b.x, mouseY);
            currForce = map(b.y, 150, 600, 100, 0);
          } else if (mouseY < 150) 
          {
            b.DragObject(b.x, 150);
            currForce = 100;
          } else if (mouseY > 600) 
          {
            b.DragObject(b.x, 600);
            currForce = 0;
          }

          break;
        }
      }
      else if(b.checkMouseOver() && Input.mouseDown && !Input.mouseDownPrev)
      {
        switch(b.type)
        {
        case 1:
          punching = true;
          // hit material image with the fist image, if the current force is great enough crack the material
          if(mat.durability < currForce)
          {
            // show damage to the material
          }
          // show results
          // pause the game and let the player try again by reseting this level with the same material or return to the material select again
          break;
        }
      }
      
      
    }
    
    
    
  }
  
  void Draw()
  {
    fill(255);
    rect(width/10, height / 2, width / 5, height);
    
    text(currForce, width/2, height / 3);
    
    
    
    for (Button b : btns)
    {
      b.Draw();
    }
    
    fill(255);
    if(punching)
    {
      println(fistX);
      ellipse(fistX, fistY, 10,10);
      //image(fist, fistX, fistY);
    }
  }
}
