class CircuitLevel
{
  Level l;

  ArrayList<Button> btns= new ArrayList<Button>();
  ArrayList<Button> drags = new ArrayList<Button>();


  ArrayList<DropLocation> dropLocs = new ArrayList<DropLocation>();
  
  int count = 0;
  
  CircuitLevel()
  {
    createLevel();
  }
  
  
  void createLevel()
  {

    // new level defines button amount, origional button positions, drag button amount, origional drag button positions, that level this currently is

    l = new Level(1, 0, 3);

    for (int i = 0; i < l.btnAmount; i++)
    {
      Button temp = new Button(450, 300 + (i * 80), 90, 40, 122, 255, 0, i, false, "Button");
      btns.add(temp);
    }
    
    /*
    for (int i = 0; i < l.dragAmt; i++)
    {
      Button temp2;
      
      if(i == 0)
      {
        temp2 = new Button(width / 16, 300 + (i * 128), 90, 40, 122, 255, 0, 0, true, "Button");
      }
      else
      {
        temp2 = new Button(width / 16, 300 + (i * 128), 90, 40, 122, 255, 0, 1, true, "Button");
      }
      
      
      drags.add(temp2);
    }
    */


    DropLocation temp3 = new DropLocation(1, new PVector(485, 135));
    dropLocs.add(temp3);

    temp3 = new DropLocation(1,  new PVector(485, 760));
    dropLocs.add(temp3);

    temp3 = new DropLocation(0, new PVector(70, 460));
    dropLocs.add(temp3);
  }

  // updates the play state
  // @ returns void
  void Update()
  {

    // loop through drags and if it is in position, turn a boolean to true
    // add a drag for any level needing it for gameplay
    // check collision on its position

    if(count == l.dragAmt)
    {
      SwitchToTitle();
    }


    for (Button b : btns)
    {
      if (b.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown)
      {
        switch(b.type)
        {
        case 0:
          SwitchToTitle();
          break;
        }
      }
    }


    for (Button b : drags)
    {
      
      if (!Input.mouseDown && b.dragging)
      {
        b.dragging = false;
        b.inPosition = false;


        for (DropLocation p : dropLocs)
        {
          if (b.x < p.pos.x + 100 && b.x > p.pos.x - 100 && b.y  < p.pos.y + 150 && b.y > p.pos.y - 150 && b.type == p.typeAccept)
          {
            println("in");
            b.x = p.pos.x;
            b.y = p.pos.y;
            b.inPosition = true;
            count++;
          }
        }

        if (!b.inPosition && !b.dragging);
        {
          // return object to origional place
          //println("here");
          //b.x = b.originX;
          //b.y = b.originY;
        }
      }

      if (b.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown)
      {
        b.dragging = true;
        
        if(b.inPosition)
        {
          b.inPosition = false;
          count--;
        }
        
      }

      if (b.dragging && Input.mouseDown)
      {
        b.DragObject();
      }
    }

    

    Input.SetMousePrev();
  }

  void Draw()
  {
    rect(width/10, height / 2, width / 5, height);
    
    
    pushMatrix();
    
    translate(widthHalf + 30, height / 2.5);
    scale(.2);

    image(background1, 0, 0);

    popMatrix();
    
    

    for (DropLocation p : dropLocs)
    {
      ellipse(p.pos.x, p.pos.y, 40, 40);
    }


    for (Button b : btns)
    {
      b.Draw();
    }
    
    
    
    for (Button b : drags)
    {
      b.Draw();
    }
  }
}
