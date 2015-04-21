class GSTitle
{



  ArrayList<Button> btns = new ArrayList<Button>();
  ArrayList<Button> drags = new ArrayList<Button>();
  
  
  GSTitle()
  {

    Button temp = new Button(600, 300, 90, 40, 122, 255, 0, 1, false, "Button");
    btns.add(temp);
    temp = new Button(600, 380, 90, 40, 122, 255, 0, 2,false, "Button");
    btns.add(temp);
    temp= new Button(600, 460, 90, 40, 122, 255, 0, 3,false, "Button");
    btns.add(temp);
    temp = new Button(600, 540, 90, 40, 122, 255, 0, 4,false, "Button");
    btns.add(temp);
    
    //temp = new Button(700, 50, 90, 40, 122, 0, 100, 1,true, "Button");
    //drags.add(temp);
  }

  void Draw()
  {
    
    image(background2,0,50);
    
    fill(255); // the color of this text
    //text(audioList[0], 30,20);
    text("TITLE", widthHalf, 80);
    
    for (Button b : btns)
    {
      b.Draw();
    }
    
    for (Button b : drags)
    {
      b.Draw();
    }
    
    
  }

  void Update()
  {
    
    
    
    for (Button b : btns)
    {

      if (b.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown)
      {
        switch(b.type)
        {
          case 1:
            SwitchToPlay();
            break;
        }
      }
    }
    
    for (Button b : drags)
    {
      
      if (!Input.mouseDown)
      {
        b.dragging = false;
        
      }
      
      if (b.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown)
      {
        b.dragging = true;
        
      }
      
      if(b.dragging && Input.mouseDown)
      {
        b.DragObject();
      }
      
    }
    
    Input.SetMousePrev();
  }
  
  
}

