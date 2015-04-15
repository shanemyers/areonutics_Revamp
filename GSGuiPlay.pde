
// class that defines the gui setup of each level
class GSGuiPlay
{
  ArrayList<Button> btns= new ArrayList<Button>();
  
  GSGuiPlay()
  {
    for (int i = 0; i < 5; i++)
    {
      Button temp = new Button(210 + (i * 120), 800, 90, 40, 122, 255, 0, i, "Button");
      btns.add(temp);
    }
  }
  
  
  void Draw()
  {

    for (Button b: btns)
    {
      b.Draw();
    }
  }

  void Update()
  {
    for (Button b: btns)
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
  }
}
