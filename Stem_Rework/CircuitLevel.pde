class CircuitLevel
{
  Level l;

  ArrayList<Button> btns= new ArrayList<Button>();
  ArrayList<Button> drags = new ArrayList<Button>();


  ArrayList<DropLocation> dropLocs = new ArrayList<DropLocation>();

  int count = 0;

  boolean haveDrag = false;

  Button temp;
  Button temp2;

  boolean done = false;

  boolean tested= false;
  boolean passed = false;
  int progress = 0;

  PImage back = circuit1;

  CircuitLevel(int progress)
  {
    this.progress = progress;
    switch(progress)
    {
    case 0:
      createLevel();
      break;

    case 1:
      makeLevel2();
      break;
    }

    temp = new Button(width - 220, 40, 120, 60, .12, .06, 8, false, genBtn); // test button
    btns.add(temp);

    temp = new Button(width - 80, 40, 120, 60, .12, .06, 9, false, genBtn); // finish test button
    btns.add(temp);
  }



  void createLevel()
  {

    for (int i = 0; i < 3; i++)
    {

      temp2 = new Button(width / 16, 100 + (i * 70), 90, 40, .6, .6, 1, true, swtchOn);
      drags.add(temp2);
    }


    temp2 = new Button(width / 16, 310, 90, 40, .1, .1, 0, true, resist1);
    drags.add(temp2);

    temp2 = new Button(width / 16, 380, 90, 40, .1, .1, 9, true, resist2);
    drags.add(temp2);

    temp2 = new Button(width / 16, 450, 90, 40, .1, .1, 9, true, resist3);
    drags.add(temp2);

    temp2 = new Button(width / 16, 530, 90, 40, .5, .5, 4, true, ledB);
    drags.add(temp2);
    //temp2 = new Button(width / 16, 300, 90, 40, .1, .1, 0, true, led1P);
    //drags.add(temp2);
    temp2 = new Button(width / 16, 610, 90, 40, .5, .5, 3, true, ledR);
    drags.add(temp2);
    temp2 = new Button(width / 16, 690, 90, 40, .5, .5, 2, true, ledG);
    drags.add(temp2);




    DropLocation temp3 = new DropLocation(0, new PVector(408, 185), 0); // resister red black brown gold
    dropLocs.add(temp3);

    temp3 = new DropLocation(1, new PVector(581, 247), 1); // switch
    dropLocs.add(temp3);

    temp3 = new DropLocation(1, new PVector(710, 247), 2); // switch
    dropLocs.add(temp3);

    temp3 = new DropLocation(1, new PVector(836, 247), 3); // switch
    dropLocs.add(temp3);


    temp3 = new DropLocation(2, new PVector(581, 430), 4); // green light
    dropLocs.add(temp3);

    temp3 = new DropLocation(3, new PVector(836, 430), 5); // red light
    dropLocs.add(temp3);

    temp3 = new DropLocation(4, new PVector(965, 430), 6); // purple light
    dropLocs.add(temp3);
  }

  // updates the play state
  // @ returns void
  void Update()
  {

    // loop through drags and if it is in position, turn a boolean to true
    // add a drag for any level needing it for gameplay
    // check collision on its position


    for (Button b : btns)
    {
      haveDrag = false;

      if (b.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown)
      {
        switch(b.type)
        {
        case 0:
          //SwitchToTitle();
          makeLevel2();
          break;

        case 8:
          passed = CheckPoints();
          break;

        case 9:
          if (progress < 1 && passed)
          {
            makeLevel2();
            progress++;
          } else
          {
            if (tested)
            {
              done = true;
              SwitchToResult();
            }
          }
          break;
        }
      }
    }


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
  }

  void Draw()
  {
    rect(width/10, height / 2, width / 5, height);

    pushMatrix();

    translate(widthHalf, 40);
    scale(.06);

    if (tested && passed)
    {
      image(checkPos, 0, 0);
    } else if (tested && !passed)
    {
      image(checkNeg, 0, 0);
    } else
    {
      image(checkNon, 0, 0);
    }

    popMatrix();

    pushMatrix();

    translate(widthHalf + 60, height / 2.5 + 40);

    if (progress == 0)
    {
      scale(.5);
    } else
    {
      scale(.6);
    }
    image(back, 0, 0);

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


    text("Results", width - 80, 40);
    text("Test", width - 220, 40);
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
    passed = false;
    tested = false;

    back = circuit2;

    for (int i = drags.size () - 1; i >= 0; i--)
    {
      drags.remove(drags.get(i));
    }

    for (int i = dropLocs.size () - 1; i >= 0; i--)
    {
      dropLocs.remove(dropLocs.get(i));
    }



    temp2 = new Button(width / 16 - 20, 100, 90, 40, .1, .1, 0, true, battery1);
    drags.add(temp2);

    temp2 = new Button(width / 16 + 60, 100, 90, 40, .1, .1, 9, true, battery2);
    drags.add(temp2);

    temp2 = new Button(width / 16 + 20, 280, 90, 40, .25, .15, 1, true, convert);
    drags.add(temp2);

    temp2 = new Button(width / 16 + 40, 470, 90, 40, .5, .7, 2, true, charge);
    drags.add(temp2);

    temp2 = new Button(width / 16 - 20, 610, 90, 40, .25, .25, 3, true, fuse);
    drags.add(temp2);

    temp2 = new Button(width / 16 + 40, 610, 90, 40, .25, .25, 3, true, fuse);
    drags.add(temp2);

    temp2 = new Button(width / 16 + 100, 610, 90, 40, .25, .25, 3, true, fuse);
    drags.add(temp2);

    temp2 = new Button(width / 16 - 20, 700, 90, 40, .4, .4, 9, true, ledG);
    drags.add(temp2);

    temp2 = new Button(width / 16 + 40, 700, 90, 40, .4, .4, 9, true, ledG);
    drags.add(temp2);

    temp2 = new Button(width / 16 + 100, 700, 90, 40, .4, .4, 9, true, ledG);
    drags.add(temp2);



    DropLocation temp3 = new DropLocation(0, new PVector(330, 531), 0); // battery
    dropLocs.add(temp3);

    temp3 = new DropLocation(2, new PVector(588, 270), 1); // charge
    dropLocs.add(temp3);

    temp3 = new DropLocation(1, new PVector(810, 525), 2); // convert
    dropLocs.add(temp3);

    temp3 = new DropLocation(3, new PVector(982, 447), 3); // fuse
    dropLocs.add(temp3);
  }
}

