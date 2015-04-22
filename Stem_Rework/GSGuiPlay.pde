
// class that defines the gui setup of each level
class GSGuiPlay
{
  ArrayList<Button> btns= new ArrayList<Button>();
  
  float buttonSize = height / 16; // height of all buttone in the GUI
  
  boolean textUp = true;
  
  GSGuiPlay()
  {
    for (int i = 0; i < 3; i++)
    {
      Button temp = new Button(widthHalf - buttonSize + buttonSize * i, height - buttonSize  / 2, buttonSize, buttonSize, 100 + 64 * i, 255, 255, i, false, "Button");
      btns.add(temp);
    }
  }


  void Draw()
  {
    // boarders of the gui
    
    
    rect(widthHalf, height - buttonSize / 2, width, buttonSize);



    fill(255);
    for (Button b : btns)
    {
      b.Draw();
    }
    
    if(textUp)
    {
      rect(widthHalf + 120, height - height / 7, width - 272, height / 8);
      fill(122,0,0);
      text("This is a sentence", widthHalf - 280, height - (height / 7) - 32);
    }
    
    /*
    fill(200);
     rect(380, 820, 500, 100);
     
     fill(122,0,0);
     
     */
  }

  void Update()
  {
    for (Button b : btns)
    {
      if (b.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown)
      {
        switch(b.type)
        {
        case 0:
          textUp = !textUp;
          break;

        case 1:
          //SwitchToPlay();
          break;

        case 2:
          SwitchToTitle();
          break;
        }
      }
    }
  }
}

