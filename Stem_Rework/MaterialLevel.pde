class MaterialLevel
{


  ShockTest shockTest;
  HeatTest heatTest;
  WeightTest weightTest;

  Material active = null;
  //boolean haveMat = false;
  ArrayList<Material> materials = new ArrayList<Material>();
  ArrayList<Button> btns = new ArrayList<Button>();

  // need for all materials and all tests of materials
  boolean tested = false;
  boolean passed = false;

  boolean done = false;

  MaterialLevel()
  {

    // set all the material choices in the constructor and draw this array with a coorisponding button list

    // draw out all materials, and melt/shock/weigh measuring devices
    // afet a choice move onto that level and when they back out return to this one

    for (int i = 0; i < 3; i++)
    {
      Button temp = new Button(widthHalf  - 350 + 350 * i, height - 110, 128, 64, .35, .12, i, false, genBtn);
      btns.add(temp);
    }

    for (int i = 0; i < 5; i++)
    {
      Button temp = new Button(widthHalf - 360 + 180 * i, height - 200, 128, 64, .2, .08, i + 5, false, genBtn);
      btns.add(temp);
    }

    Button temp = new Button(width - 80, 40, 120, 60, .12, .06, 10, false, genBtn); // finish test button
    btns.add(temp);




    for (int i = 0; i < 5; i++)
    {
      Material temp2 = new Material(20, 20, 20, i);
      materials.add(temp2);
    }
  }

  void Update(boolean restart)
  {
    if (heatTest == null && shockTest == null && weightTest == null)
    {
      gamePath = "AAAB";

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

          case 2:
            weightTest = new WeightTest(active);
            break;
          }
        } 


        if (b.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown)
        {
          switch(b.type)
          {
          case 10:
            done = true;
            tested = true;
            passed = true;
            for (Material m : materials)
            {
              if (!m.pass1 || !m.pass2 || !m.pass3)
              {
                passed = false;
              }
            }

            SwitchToResult();
            break;

          case 5:
            active = materials.get(0);
            break;

          case 6:
            active = materials.get(1);
            break;

          case 7:
            active = materials.get(2);
            break;

          case 8:
            active = materials.get(3);
            break;

          case 9:
            active = materials.get(4);
            break;
          }
        }
      }
    } else
    {
      if (heatTest != null)
      {
        gamePath = "AAABA";
        heatTest.Update();
        if (heatTest.done  && gsResult == null)
        { 
          materials.get(active.id).pass2 = heatTest.passed;
          heatTest = null; // get information back from test
        }
        if (restart) heatTest = new HeatTest(active);
      } else if (shockTest != null)
      {
        gamePath = "AAABB";
        shockTest.Update();
        if (shockTest.done && gsResult == null)
        {
          materials.get(active.id).pass1 = shockTest.passed;
          shockTest = null; // get information back from test
        }
        if (restart) shockTest = new ShockTest(active);
      } else if (weightTest != null)
      {
        gamePath = "AAABC";
        weightTest.Update();
        if (weightTest.done && gsResult == null)
        {
          materials.get(active.id).pass3 = weightTest.passed;

          weightTest = null; // get information back from test
        }
        if (restart) weightTest = new WeightTest(active);
      }
    }

    Input.SetMousePrev();
  }
  void Draw()
  {
    if (heatTest == null && shockTest == null && weightTest == null)
    {
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

      for (Button b : btns)
      {
        b.Draw();
      }

      text("Shock", widthHalf - 350, height - 100);
      text("Temperature", widthHalf, height - 100);
      text("Weight", widthHalf + 350, height - 100);

      noTint();
      fill(255);
      text("Shock", widthHalf - 460, height - 260);
      text("Temp", widthHalf - 460, height - 320);
      text("Weight", widthHalf - 460, height - 380);
      
      pushMatrix();
      
      translate(widthHalf - 360, height - 270);
      scale(.06);
      
      
      
      
      if (materials.get(0).pass1)
      {
        image(checkPos, 0, -2000);
      } else
      {
        image(checkNon, 0, -2000);
      }

      if (materials.get(0).pass2)
      {
        image(checkPos, 0, -1000);
      } else
      {
        image(checkNon, 0, -1000);
      }

      if (materials.get(0).pass3)
      {
        image(checkPos, 0, 0);
      } else
      {
        image(checkNon, 0, 0);
      }

      


      if (materials.get(1).pass1)
      {
        image(checkPos, 3000, -2000);
      } else
      {
        image(checkNon, 3000, -2000);
      }

      if (materials.get(1).pass2)
      {
        image(checkPos, 3000, -1000);
      } else
      {
        image(checkNon, 3000, -1000);
      }

      if (materials.get(1).pass3)
      {
        image(checkPos, 3000, 0);
      } else
      {
        image(checkNon, 3000, 0);
      }



      if (materials.get(2).pass1)
      {
        image(checkPos, 6000, -2000);
      } else
      {
        image(checkNon, 6000, -2000);
      }

      if (materials.get(2).pass2)
      {
        image(checkPos, 6000, -1000);
      } else
      {
        image(checkNon, 6000, -1000);
      }

      if (materials.get(2).pass3)
      {
        image(checkPos, 6000, 0);
      } else
      {
        image(checkNon, 6000, 0);
      }


      if (materials.get(3).pass1)
      {
        image(checkPos, 9000, -2000);
      } else
      {
        image(checkNon, 9000, -2000);
      }

      if (materials.get(3).pass2)
      {
        image(checkPos, 9000, -1000);
      } else
      {
        image(checkNon, 9000, -1000);
      }

      if (materials.get(3).pass3)
      {
        image(checkPos, 9000, 0);
      } else
      {
        image(checkNon, 9000, 0);
      }


      if (materials.get(4).pass1)
      {
        image(checkPos, 12000, -2000);
      } else
      {
        image(checkNon, 12000, -2000);
      }

      if (materials.get(4).pass2)
      {
        image(checkPos, 12000, -1000);
      } else
      {
        image(checkNon, 12000, -1000);
      }

      if (materials.get(4).pass3)
      {
        image(checkPos, 12000, 0);
      } else
      {
        image(checkNon, 12000, 0);
      }




      popMatrix();
      
      fill(0);
      text("Results", width - 80, 40);
      //text("Test", width - 220, 40);
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
      if (weightTest != null)
      {
        weightTest.Draw();
      }
    }
  }
}

