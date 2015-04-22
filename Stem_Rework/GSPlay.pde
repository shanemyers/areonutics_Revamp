// class that handels the game
class GSPlay
{



  GSGuiPlay gui = new GSGuiPlay();

  CircuitLevel level_1;
  MaterialLevel level_2;

  ArrayList<Button> btns = new ArrayList<Button>();

  int levelCount = 3;

  // initilizes the play state and gets the array of body variables
  public GSPlay()
  {
    for (int i = 0; i < levelCount; i++)
    {
      Button temp = new Button(widthHalf, heightHalf - 90 + 90 * i, 128, 64, 0, 200, 100, i, false, "Level: " + i);
      btns.add(temp);
    }
  }  

  void Update()
  {
    gui.Update();

    if (level_1 == null && level_2 == null)
    {
      for (Button b : btns)
      {
        if (b.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown)
        {
          switch(b.type)
          {
          case 0:
            level_1 = new CircuitLevel();
            break;

          case 1:
            println("here");
            level_2 = new MaterialLevel();
            break;
          }
        }
      }
    }
    else
    {
      if (level_1 != null)
      {
        level_1.Update();
      }

      if (level_2 != null)
      {
        level_2.Update();
      }
    }
    
    Input.SetMousePrev();
  }

  void Draw()
  {
    // draw level options if all levels are null

    if (level_1 == null && level_2 == null)
    {
      for (Button b : btns)
      {
        b.Draw();
      }
    } else
    {

      gui.Draw();

      if (level_1 != null)
      {
        level_1.Draw();
      }

      if (level_2 != null)
      {
        level_2.Draw();
      }
    }
  }
}

