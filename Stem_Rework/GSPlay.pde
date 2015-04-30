// class that handels the game
class GSPlay
{



  GSGuiPlay gui = new GSGuiPlay();

  CircuitLevel level_1;
  MaterialLevel level_2;
  RocketLevel level_3;



  boolean pass1;
  boolean pass2;
  boolean pass3;

  int levelSection = 0;

  ArrayList<Button> btns = new ArrayList<Button>();

  int levelCount = 3;

  // initilizes the play state and gets the array of body variables
  public GSPlay()
  {
    for (int i = 0; i < levelCount; i++)
    {
      Button temp = new Button(widthHalf - 100, heightHalf - 90 + 90 * i, 128, 64, .12, .06, i, false, genBtn);
      btns.add(temp);
    }
  }  

  void Update()
  {
    gui.Update();

    if (level_1 == null && level_2 == null && level_3 == null)
    {
      for (Button b : btns)
      {
        if (b.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown)
        {
          switch(b.type)
          {
          case 0:
            gamePath = "AAAA";
            level_1 = new CircuitLevel(0);
            break;

          case 1:
            gamePath = "AAAB";
            level_2 = new MaterialLevel();
            break;

          case 2:
            gamePath = "AAAC";
            level_3 = new RocketLevel(0);
            break;
          }
        }
      }
    } else
    {
      if (level_1 != null)
      {
        level_1.Update();

        if (level_1.done && gsResult == null)
        {
          pass1 = level_1.passed;

          level_1 = null;
        }

        if (gui.restart)
        {
          levelSection = level_1.progress;
          level_1 = new CircuitLevel(levelSection);
        }
      }

      if (level_2 != null)
      {
        level_2.Update(gui.restart);

        if (level_2.done && gsResult == null)
        {
          pass2 = level_2.passed;
          level_2 = null;
        }
      }

      if (level_3 != null)
      {

        level_3.Update();

        if (level_3.done && gsResult == null)
        {
          pass3 = level_3.passed;
          level_3 = null;
        }
        if (gui.restart)
        {
          levelSection = level_3.progress;
          level_3 = new RocketLevel(levelSection);
        }
      }
    }

    Input.SetMousePrev();
  }

  void Draw()
  {
    // draw level options if all levels are null

    if (level_1 == null && level_2 == null && level_3 == null)
    {
      for (Button b : btns)
      {
        b.Draw();
      }

      pushMatrix();
      
      translate(widthHalf, heightHalf - 90);
      scale(.08);
      noTint();
      if (pass1)
      {
        image(checkPos, 0, 0);
      } else
      {
        image(checkNon, 0, 0);
      }
      if (pass2)
      {
        image(checkPos, 0, 1100);
      } else
      {
        image(checkNon, 0, 1100);
      }
      if (pass3)
      {
        image(checkPos, 0, 2200);
      } else
      {
        image(checkNon, 0, 2200);
      }
      popMatrix();
      
     
      text("Circuits", widthHalf - 100, heightHalf - 90);
      text("Materials", widthHalf - 100, heightHalf);
      text("Structure", widthHalf - 100, heightHalf + 90);
      
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

      if (level_3 != null)
      {
        level_3.Draw();
      }
    }
  }
}

