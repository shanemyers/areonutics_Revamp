class RocketLevel
{

  ArrayList<Button> btns = new ArrayList<Button>();
  ArrayList<Button> drags = new ArrayList<Button>();

  ArrayList<DropLocation> dropLocs = new ArrayList<DropLocation>();
  
  int partCount = 5;

  Button temp;
  boolean haveDrag = false;
  int count = 0;
  boolean done = false;

  int progress = 0;
  boolean tested= false;
  boolean passed = false;

  RocketLevel(int progress)
  {
    this.progress = progress;
    
    for (int i = 0; i < partCount; i++)
    {
      temp = new Button(width / 12, 200 + 80 * i, 128, 64, .06, .06, i, true, volt);
      drags.add(temp);
    }
    
    temp = new Button(width - 220, 40, 120, 60, .06, .06, 8, false, genBtn); // test button
    btns.add(temp);

    temp = new Button(width - 80, 40, 120, 60, .06, .06, 9, false, genBtn); // finish test button
    btns.add(temp);


    DropLocation temp3 = new DropLocation(0, new PVector(650, 70), 0);
    dropLocs.add(temp3);
    
    temp3 = new DropLocation(1, new PVector(650, 470), 1);
    dropLocs.add(temp3);
    
    temp3 = new DropLocation(2, new PVector(650, 870), 2);
    dropLocs.add(temp3);
    
    
    if(progress == 1)
    {
      makeLevel2();
    }
    
    
    
  }

  void Update()
  {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    for (Button b : btns)
    {
      haveDrag = false;

      if (b.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown)
      {
        switch(b.type)
        {
        case 0:
          //SwitchToTitle();
          break;

        case 8:
          // test rocket version
          passed = CheckPoints();
          break;

        case 9:
          progress++; // advance to the next rocket building section
          done = true; // only when all rocket sections are finished
          SwitchToResult(); // only when all rocket sections are finished
          break;
        }
      }
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    for (Button b : drags)
    {

      if (b.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown && !haveDrag)
      {

        b.dragging = true;
        haveDrag = true;

        if (b.inPosition)
        {
          b.inPosition = false;
          dropLocs.get(b.targetID).hasObject = false;
          dropLocs.get(b.targetID).holdingType = -1;
          b.targetID = -1;
          count--;
        }
      }

      if (b.dragging && Input.mouseDown)
      {
        b.DragObject();
      }

      if (!Input.mouseDown && b.dragging)
      {

        for (DropLocation p : dropLocs)
        {
          if (b.x < p.pos.x + 80 && b.x > p.pos.x - 80 && b.y  < p.pos.y + 80 && b.y > p.pos.y - 80 && !p.hasObject)
          {
            b.x = p.pos.x;
            b.y = p.pos.y;
            b.inPosition = true;
            p.hasObject = true;
            p.holdingType = b.type;
            b.targetID = p.id;
            count++;
          }
        }

        if (!b.inPosition)
        {
          b.x = b.originX;
          b.y = b.originY;
        }
      }

      if (!Input.mouseDown)
      {
        b.dragging = false;
      }
    }

    Input.SetMousePrev();
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  }

  void Draw()
  {
    fill(255);
    rect(width/10, height / 2, width / 5, height);

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
  
  boolean CheckPoints()
  {
    boolean check = true;

    for (DropLocation p : dropLocs)
    {
      if (!p.hasObject || p.typeAccept != p.holdingType)
      {
        check = false;
      }
    }
    
    tested = true;
    return check;
  }
  
  void makeLevel2()
  {
    // this or delete all drags and drops and simply draw a completed image in it's place
    for (Button b : drags)
    {
      b.active = false;
    }

    for (DropLocation p : dropLocs)
    {
      p.active = false;
    }
    
    // change background
    // add next level drags and drops
  }
}

