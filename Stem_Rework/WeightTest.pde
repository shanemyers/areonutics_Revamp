class WeightTest
{
  Material mat;
  boolean done = false;

  ArrayList<Button> btns = new ArrayList<Button>();

  boolean tested = false;
  boolean passed = false;

  Button temp;

  WeightTest(Material mat)
  {
    this.mat = mat;

    //temp = new Button(width/2, height / 2, 260, 260, .06, .06, 1, false,  genBtn);
    //btns.add(temp);

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    temp = new Button(width - 220, 40, 120, 60, .12, .06, 8, false, genBtn); // test button
    btns.add(temp);

    temp = new Button(width - 80, 40, 120, 60, .12, .06, 9, false, genBtn); // finish test button
    btns.add(temp);
  }

  void Update()
  {
    for (Button b : btns)
    {
      if (!b.draggable && b.checkMouseOver() && Input.mouseDown)
      {
        switch(b.type)
        {
        case 8:
          // get weight from material
          // pass test
          tested = true;
          passed = true;
          break;

        case 9:
          done = true;
          SwitchToResult();
          break;
        }
      }
    }
  }

  void Draw()
  {
    for (Button b : btns)
    {
      b.Draw();
    }

    pushMatrix();
    translate(widthHalf, 40);
    scale(.05);
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


    text("Results", width - 80, 40);
    text("Test", width - 220, 40);
  }
}

