class GSTitle
{



  ArrayList<Button> btns = new ArrayList<Button>();
  ArrayList<Button> drags = new ArrayList<Button>();


  GSTitle()
  {
    gamePath = "A";
    Button temp = new Button(widthHalf, heightHalf - 40, 90, 40, .12, .06, 1, false, genBtn);
    btns.add(temp);
    temp= new Button(widthHalf, heightHalf + 40, 90, 40, .12, .06, 3, false, genBtn);
    btns.add(temp);


    //temp = new Button(700, 50, 90, 40, 122, 0, 100, 1,true, "Button");
    //drags.add(temp);
  }

  void Draw()
  {

    //image(background2, 0, 50);

    fill(255); // the color of this text
    textSize(20);
    //text(audioList[0], 30,20);
    text("STEM: Give Me Some Space!", widthHalf, 200);

    for (Button b : btns)
    {
      b.Draw();
    }

    for (Button b : drags)
    {
      b.Draw();
    }
    
    fill(0);
    text("Start", widthHalf, heightHalf - 40);
    text("Exit", widthHalf, heightHalf + 50);
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
          SwitchToCareer();
          // SwitchToPlay();
          break;

        case 3:
          exit();
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

      if (b.dragging && Input.mouseDown)
      {
        b.DragObject();
      }
    }

    Input.SetMousePrev();
  }
}

