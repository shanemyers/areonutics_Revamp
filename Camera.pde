// dynamic camera of the game, follows the player
class Camera
{
  float shakingTime = 0;
  float shakeNum = 0;
  PVector pos;

  PMatrix2D matrix = new PMatrix2D();


  void Update()
  {
    //pos = mainPos;
    matrix.reset();

    if (shakingTime > 0)
    {
      shakeNum = random(-shakingTime, shakingTime);
    }

    matrix.translate(shakeNum, shakeNum); // 3 move to center of screen

    matrix.scale(1);                         // 2 zoom in

    if (shakingTime > .5)
    {
      shakingTime *= .9;
    }
    else
    {
      shakingTime = 0;
      shakeNum = 0;
    }

    // shifts the world opposite of the chosen movement
    //matrix.translate(-pos.x, -pos.y);        // 1  move to world origin
  }


  PVector TransformInverseMatrix(PVector v)
  {
    v = v.get();


    PMatrix2D im = matrix.get(); // copy
    im.invert();

    // stroes it in the s3econd passed in variable (PVector)
    im.mult(v, v);

    return v;
  }
}

