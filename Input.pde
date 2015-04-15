// class that holds the input of the player in key presses or mouse clicks
static class Input
{

  static boolean mouseDown = false;
  static boolean mouseDownPrev = false;
  
  
  static boolean keyU = false;
  static boolean keyD = false;
  static boolean keyW = false;
  static boolean keyS = false;

  static boolean keySpace = false;


  static boolean prevKeyDown = false;


  static void SetMouse(boolean m)
  {
    mouseDown = m;
  }

  static void SetMousePrev()
  {
    mouseDownPrev = mouseDown;
  }

  // sets the boolean of the key to true if the key is pressed
  static void SetKey(int code)
  {

    switch(code)
    {
    case UP:
      keyU = true;
      break;

    case DOWN:
      keyD = true;
      break;

    case 87:
      keyW = true;
      break;

    case 83:
      keyS = true;
      break;


    case 32:
      keySpace = true;
      break;

    }

    keyDown();
  }

  // makes all key input false to stop infinite clicks
  // @ returns void
  static void KeyReset()
  {
    keyU = false;
    keyD = false;
    keyW = false;
    keyS = false;


    keySpace = false;

  }


  static void keyDown()
  {
    prevKeyDown = true;
  }

  static void keyUp()
  {
    prevKeyDown = false;
  }
} 

// fires whenever the mouse is clicked
// @ return void
void mousePressed()
{
  if (!Input.mouseDown)
  {
    Input.SetMouse(true);
  }
}

// fires whenever the mouse is released
// @ return void
void mouseReleased()
{

  if (Input.mouseDown)
  {
    Input.SetMouse(false);
    Input.SetMousePrev();
  }
}

// fires whenever the key is pressed
// @ return void
void keyPressed() 
{
  if (!Input.prevKeyDown)
  {
    //println(keyCode);
    Input.SetKey(keyCode);
  }
  else
  {

    Input.KeyReset();
  }
}

// fires whenever the key is released
// @ return void
void keyReleased() 
{
  Input.keyUp();
  Input.KeyReset();
}

