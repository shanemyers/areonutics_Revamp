
// class that defines the gui setup of each level
class GSGuiPlay
{
  ArrayList<Button> btns= new ArrayList<Button>();

  float buttonSize = height / 16; // height of all buttone in the GUI

  boolean textUp = true;
  boolean restart = false;
  
  
  GSGuiPlay()
  {

    Button temp = new Button(widthHalf - buttonSize, height - buttonSize  / 2, buttonSize, buttonSize, .06, .06, 0, false, speech);
    btns.add(temp);

    temp = new Button(widthHalf - buttonSize + buttonSize, height - buttonSize  / 2, buttonSize, buttonSize, .06, .06, 1, false, home);
    btns.add(temp);

    temp = new Button(widthHalf - buttonSize + buttonSize * 2, height - buttonSize  / 2, buttonSize, buttonSize, .06, .06, 2, false, reset);
    btns.add(temp);
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

    if (textUp)
    {
      pushMatrix();
      
      noTint();
      translate(widthHalf + 250, height - 116);
      scale(-.085, .085);
      image(speechL, 0, 0);
      
      popMatrix();
      
      fill(122, 0, 0);
      text("This is a sentence", widthHalf - 5, height - 120 - 32);
    }
    fill(122, 0, 0);
    /*
    fill(200);
     rect(380, 820, 500, 100);
     
     fill(122,0,0);
     
     */
  }

  void Update()
  {
    restart = false;
    
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
          SwitchToTitle();
          break;

        case 2:
          restart = true;
          break;
        }
      }
    }
  }
}

