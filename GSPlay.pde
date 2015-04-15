// class that handels the game
class GSPlay
{

  Level l;

  ArrayList<Button> btns= new ArrayList<Button>();
  PImage background;
  GSGuiPlay gui = new GSGuiPlay();

  // initilizes the play state and gets the array of body variables
  public GSPlay()
  {
    
  }  

  void createLevel()
  {
    
    // new level defines button amount, origional button positions, drag button amount, origional drag button positions, that level this currently is
    
    l = new Level(5,5);
    
    for (int i = 0; i < l.btnAmount; i++)
    {
      Button temp = new Button(450, 300 + (i * 80), 90, 40, 122, 255, 0, i, "Button");
      btns.add(temp);
    }
  }

  // updates the play state
  // @ returns void
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



    gui.Update();

    Input.SetMousePrev();
  }

  void Draw()
  {
    image(background1, 0, 50);

    for (Button b: btns)
    {
      b.Draw();
    }


    gui.Draw();
  }

  void mousePress() {
    // TODO: hard stats of the tower

    // get mouse position
    //Point p = TileHelper.pixelToGrid(new PVector(mouseX, mouseY));


    //println("clicked on ground");
  }
  /*
  void keyPressed() {
   //println(keyCode);
   
   if (keyCode == 37) player.goLeft(true);
   if (keyCode == 38) player.goUp(true);
   if (keyCode == 39) player.goRight(true);
   if (keyCode == 40) player.goDown(true);
   
   if (keyCode == 49) level.loadLevel(LevelDefs.LEVEL1);
   if (keyCode == 50) level.loadLevel(LevelDefs.LEVEL2);
   if (keyCode == 51) level.loadLevel(LevelDefs.LEVEL3);
   if (keyCode == 52) level.loadLevel(LevelDefs.LEVEL4);
   if (keyCode == 53) level.loadLevel(LevelDefs.LEVEL5);
   
   if (keyCode == 68) level.toggleDiagonals();
   if (keyCode == 72) pathfinder.toggleHeuristic();
   }
   */
}

