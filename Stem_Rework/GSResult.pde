class GSResult
{
  boolean done = false;
  
  Button btn;
  
  GSResult()
  {
    btn = new Button(widthHalf, heightHalf, 90, 40, .12, .06, 1, false, genBtn);
  }
  
  void Update()
  {
    if(btn.checkMouseOver() && !Input.mouseDownPrev && Input.mouseDown)
    {
      done = true;
    }
  }
  
  void Draw()
  {
    rect(widthHalf, heightHalf, 320, 160);
    btn.Draw();
    
    text("Continue", widthHalf, heightHalf);
  }
}
