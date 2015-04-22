class MaterialLevel
{


  ShockTest shockTest;
  HeatTest heatTest;
  WeightTest weightTest;

  Material active;
  //boolean haveMat = false;
  ArrayList<Material> materials = new ArrayList<Material>();
  ArrayList<Button> btns = new ArrayList<Button>();

  MaterialLevel()
  {

    // set all the material choices in the constructor and draw this array with a coorisponding button list

    // draw out all materials, and melt/shock/weigh measuring devices
    // afet a choice move onto that level and when they back out return to this one

    for (int i = 0; i < 3; i++)
    {
      Button temp = new Button(widthHalf, heightHalf - 90 + 90 * i, 128, 64, 0, 100, 100, i, false, "Level: " + i);
      btns.add(temp);
    }
    
    for (int i = 0; i < 6; i++)
    {
      Button temp = new Button(widthHalf + 200, 160 - 90 + 90 * i, 128, 64, 0, 100, 100, 9, false, "Material: " + i);
      btns.add(temp);
    }
    
  }

  void Update()
  {
    if (heatTest == null && shockTest == null)
    {
      for (Button b : btns)
      {
        if (b.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown && active != null)
        {
          switch(b.type)
          {
          case 0:
            shockTest = new ShockTest(active);
            break;

          case 1:
            heatTest = new HeatTest(active);
            break;
          }
        }
        else if (b.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown)
        {
          switch(b.type)
          {
          case 9:
            active = new Material(10, 20);
            break;

          }
          
        }
      }
    }
    else
    {
      if (heatTest != null)
      {
        heatTest.Update();
        if(heatTest.done) heatTest = null; // get information back from test
      }
      if (shockTest != null)
      {
        shockTest.Update();
        if(shockTest.done) shockTest = null; // get information back from test
      }
    }

    Input.SetMousePrev();
  }
  void Draw()
  {
    if (heatTest == null && shockTest == null)
    {
      for (Button b : btns)
      {
        b.Draw();
      }
    } else
    {
      if (heatTest != null)
      {
        heatTest.Draw();
      }
      if (shockTest != null)
      {
        shockTest.Draw();
      }
    }
  }
}

