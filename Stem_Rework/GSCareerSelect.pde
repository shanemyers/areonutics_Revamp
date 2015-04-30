class GSCareerSelect
{
  ArrayList<Button> btns = new ArrayList<Button>();
  ArrayList<Button> btns2 = new ArrayList<Button>();

  int careerCount = 8;
  int screenMax;
  int screenNum;

  GSCareerSelect()
  {
    gamePath = "AA";

    screenMax = careerCount / 4 - 1;

    int skipCount = 0;
    int skipNum = 0;

    for (int i = 0; i < careerCount; i++)
    {
      if (skipCount == 4)
      {
        skipCount = 0;
        skipNum++;
      }

      Button temp = new Button(240 + 240 * i + width * skipNum, height - 100, 128, 64, .25, .1, i, false, genBtn);

      if (i > 0)
      {
        temp.active = false;
      }

      btns.add(temp);

      skipCount++;
    }

    Button temp2 = new Button(50, height - 100, 128, 64, .1, .1, 0, false, arrowBtn);
    btns2.add(temp2);

    temp2 = new Button(width - 50, height - 100, 128, 64, -.1, .1, 1, false, arrowBtn);
    btns2.add(temp2);
  }

  void Update()
  {
    for (Button b2 : btns2)
    {
      if (b2.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown)
      {
        switch(b2.type)
        {
        case 0:
          for (Button b : btns)
          {
            if (screenNum - 1 >= 0)
            {
              b.x += width + width - 240;
              screenNum--;
            }
          }
          break;

        case 1:
          for (Button b : btns)
          {
            if (screenNum + 1 <= screenMax)
            {
              b.x -= width + width - 240;
              screenNum++;
            }
          }
          break;
        }

        Input.SetMousePrev();
      }
    }


    for (Button b : btns)
    {
      if (b.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown)
      {
        switch(b.type)
        {
        case 0:
          gamePath = "AAA";
          SwitchToPlay();
          break;
        }
      }
    }
  }

  void Draw()
  {
    for (Button b2 : btns2)
    {
      b2.Draw();
    }

    for (Button b : btns)
    {
      b.Draw();
    }
  }
}

