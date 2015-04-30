class HeatTest
{
  Material mat;

  ArrayList<Button> btns = new ArrayList<Button>();

  float currTemp = 0;
  boolean done = false;

  boolean tested = false;
  boolean passed = false;


  HeatTest(Material mat)
  {
    
    this.mat = mat;
    
    Button temp = new Button(width/24, 600, 260, 260, .06, .06, 0, true, arrow);
    btns.add(temp);


    temp = new Button(width - 240, 40, 120, 60, .12, .06, 8, false, genBtn); // test button
    btns.add(temp);

    temp = new Button(width - 80, 40, 120, 60, .12, .06, 9, false, genBtn); // finish test button
    btns.add(temp);
  }

  void Update()
  {
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
          } 
          else if (mouseY < 150) 
          {
            b.DragObject(b.x, 150);
            currTemp = 100;
          } 
          else if (mouseY > 600) 
          {
            b.DragObject(b.x, 600);
            currTemp = 0;
          }

          break;
        }
      } 
      else if (b.checkMouseOver() && Input.mouseDown && !Input.mouseDownPrev)
      {
        switch(b.type)
        {
        case 8:
          // hit material image with the fist image, if the current force is great enough crack the material
          if (mat.tempMax < currTemp + 5 && mat.tempMax > currTemp - 5)
          {
            passed = true;
            // show damage to the material
          }
          else if (mat.tempMax > currTemp + 5)
          {
            // show damage to the material
          }
          else if (mat.tempMax < currTemp - 5)
          {
            // show damage to the material
          }
          tested = true;
          break;

        case 9:
          done = true;
          SwitchToResult();
          // throw up the results box
          break;
        }
      }
    }
  }

  void Draw()
  {
    rect(width/10, height / 2, width / 5, height);

    fill(255);
    text(currTemp, width / 10 + 20, height - 100);
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
    }
    else if (tested && !passed)
    {
      image(checkNeg, 0, 0);
    }
    else
    { 

      image(checkNon, 0, 0);
    }
    popMatrix();
  }
}

