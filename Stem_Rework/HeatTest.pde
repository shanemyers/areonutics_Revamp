class HeatTest
{
  Material mat;

  ArrayList<Button> btns = new ArrayList<Button>();

  float currTemp = 0;
  boolean done = false;
  HeatTest(Material mat)
  {
    Button temp = new Button(width/24, 600, 260, 260, 200, 0, 200, 0, true, "temp");
    btns.add(temp);
  }

  void Update()
  {
    println(currTemp);
    for (Button b : btns)
    {
      if (b.draggable && b.checkMouseOver() && Input.mouseDown)
      {
        switch(b.type)
        {
        case 0:
          if (mouseY > 150 && mouseY < 600)
          {
            b.DragObject(b.x, mouseY);
            currTemp = map(b.y, 150, 600, 100, 0);
          } else if (mouseY < 150) 
          {
            b.DragObject(b.x, 150);
            currTemp = 100;
          } else if (mouseY > 600) 
          {
            b.DragObject(b.x, 600);
            currTemp = 0;
          }

          break;
        }
      }
    }
  }

  void Draw()
  {
    rect(width/10, height / 2, width / 5, height);

    for (Button b : btns)
    {
      b.Draw();
    }
  }
}

